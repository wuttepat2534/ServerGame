const { response } = require("express");
const mysql = require('mysql2') //npm install mysql2
const jwt = require('jsonwebtoken');
const os = require('os');
const repostGame = require('./repostGame')
require('dotenv').config()

const connection = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    database: process.env.DB_DATABASE,
    password: process.env.DB_PASSWORD
});

//Live22-------------------------------------------------------------------------------------------------------------------------------------------------------------------

http://localhost:5000/post/Live/GetBalance  
exports.GetBalanceLive = async (req, res) => {
    const RequestDateTime = req.body.RequestDateTime;
    const currency = req.body.Currency;
    const usernameGame = req.body.PlayerId;

    username = 'member001';
    let spl = `SELECT credit FROM member WHERE phonenumber ='${usernameGame}' AND status_delete='N' `;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                res.status(201).json({
                    Status: 200,
                    Description: "OK",
                    ResponseDateTime: RequestDateTime,
                    Balance: balanceUser,
                });
            }
        })
    } catch (err) {
        err.statusCode = 500;
        res.json({ status: "Not Data Request Body." });
    }
};

http://localhost:5000/post/Live/Bet 
exports.BetLive = async (req, res) => {
    const RequestDateTime = req.body.RequestDateTime;
    const TranDateTime = req.body.TranDateTime;
    const BetId = req.body.BetId;
    const GameId = req.body.GameId;
    const GameType = req.body.GameType;
    const BetAmount = req.body.BetAmount;
    const JackpotContribution = req.body.JackpotContribution;
    const Currency = req.body.Currency;
    const ExchangeRate = req.body.ExchangeRate;
    const usernameGame = req.body.PlayerId;
    const userAgent = req.headers['user-agent'];
    let spl = `SELECT credit, turnover FROM member WHERE phonenumber ='${usernameGame}' AND status_delete='N'`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                const balanceNow = balanceUser - BetAmount;

                let postTurnover = results[0].turnover - BetAmount;
                if (postTurnover < 0) {
                    postTurnover = 0;
                }

                const post = {
                    username: usernameGame, gameid: GameId, bet: BetAmount, win: 0, balance_credit: balanceNow, userAgent: userAgent, platform: userAgent, trans_id: TranDateTime
                }
                let repost = repostGame.uploadLogRepostGameAsk(post)

                const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${BetAmount}', turnover='${postTurnover}'
                WHERE phonenumber ='${usernameGame}'`;
                connection.query(sql_update, (error, resultsGame) => {
                    if (error) { console.log(error) }
                    else {
                        res.status(201).json({
                            Status: 200,
                            Description: "OK",
                            ResponseDateTime: RequestDateTime,
                            OldBalance: balanceUser,
                            NewBalance: balanceNow,
                        });
                    }
                });
            }
        })
    } catch (err) {
        err.statusCode = 500;
        res.json({ status: "Not Data Request Body." });
    }
};

http://localhost:5000/post/Live/GameResult
exports.GameResultLive = async (req, res) => {
    const RequestDateTime = req.body.RequestDateTime;
    const Payout = req.body.Payout;
    const WinLose = req.body.WinLose;
    const ExchangeRate = req.body.ExchangeRate;
    const usernameGame = req.body.PlayerId;
    const userAgent = req.headers['user-agent'];
    let spl = `SELECT credit FROM member WHERE phonenumber ='${usernameGame}' AND status_delete='N'`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                const balanceNow = balanceUser + Payout;
                const post = {
                    username: usernameGame, gameid: ExchangeRate, bet: 0, win: Payout, balance_credit: balanceNow, userAgent: userAgent, platform: userAgent, trans_id: RequestDateTime
                }
                let repost = repostGame.uploadLogRepostGameAsk(post)
                const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${0}' WHERE phonenumber ='${usernameGame}'`;
                connection.query(sql_update, (error, resultsGame) => {
                    if (error) { console.log(error) }
                    else {
                        res.status(201).json({
                            Status: 200,
                            Description: "OK",
                            ResponseDateTime: RequestDateTime,
                            OldBalance: balanceUser,
                            NewBalance: balanceNow,
                        });
                    }
                });
            }
        })
    } catch (err) {
        err.statusCode = 500;
        res.json({ status: "Not Data Request Body." });
    }
};

http://localhost:5000/post/Live/Rollback
exports.RollbackLive = async (req, res) => {
    const RequestDateTime = req.body.RequestDateTime;
    const BetAmount = req.body.BetAmount;
    const usernameGame = req.body.PlayerId;

    let spl = `SELECT credit FROM member WHERE phonenumber ='${usernameGame}' AND status_delete='N'`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                const balanceNow = balanceUser - BetAmount;
                const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${BetAmount}' WHERE phonenumber ='${usernameGame}'`;
                connection.query(sql_update, (error, resultsGame) => {
                    if (error) { console.log(error) }
                    else {
                        res.status(201).json({
                            Status: 200,
                            Description: "OK",
                            ResponseDateTime: RequestDateTime,
                            OldBalance: balanceUser,
                            NewBalance: balanceNow,
                        });
                    }
                });
            }
        })
    } catch (err) {
        err.statusCode = 500;
        res.json({ status: "Not Data Request Body." });
    }
};

//Dream Gaming-------------------------------------------------------------------------------------------------------------------------------------------------------------------
http://localhost:5000/post/Dream/user/getBalance 
exports.MemberBalanceDream = async (req, res) => {
    const authHeader = req.body.token;
    const member = req.body.member;
    username = '0990825942';
    let spl = `SELECT credit FROM member WHERE phonenumber ='${username}' AND status_delete='N' 
  ORDER BY member_code ASC`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                console.log(balanceUser);
                res.status(201).json({
                    codeId: 0,
                    token: authHeader,
                    member: {
                        username: member.username,
                        balance: balanceUser
                    }
                });
            }
        })
    } catch (err) {
        err.statusCode = 500;
        res.json({ status: "Not Data Request Body." });
    }
};

http://localhost:5000/post/Dream/account/transfer
exports.MemberTransferDream = async (req, res) => {
    const authHeader = req.body.token;
    const ticketId = req.body.ticketId;
    const data = req.body.data;
    const member = req.body.member;
    username = '0990825942';
    let spl = `SELECT credit FROM member WHERE phonenumber ='${username}' AND status_delete='N' 
  ORDER BY member_code ASC`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                const balanceNow = balanceUser + member.amount;
                const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${0}' WHERE phonenumber ='${username}'`;
                connection.query(sql_update, (error, resultsGame) => {
                    if (error) { console.log(error) }
                    else {
                        res.status(201).json({
                            codeId: 0,
                            token: authHeader,
                            data: data,
                            member: {
                                username: member.username,
                                amount: member.amount,
                                balance: balanceNow
                            }
                        });
                    }
                });
            }
        })
    } catch (err) {
        err.statusCode = 500;
        res.json({ status: "Not Data Request Body." });
    }
};

http://localhost:5000/post/Dream/account/inform
exports.RollbackDream = async (req, res) => {
    const authHeader = req.body.token;
    const ticketId = req.body.ticketId;
    const data = req.body.data;
    const member = req.body.member;
    username = 'member001';
    let spl = `SELECT credit FROM member WHERE username ='${username}' AND status_delete='N' 
  ORDER BY member_code ASC`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                const balanceNow = balanceUser - member.amount;
                const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${0}' WHERE username ='${username}'`;
                connection.query(sql_update, (error, resultsGame) => {
                    if (error) { console.log(error) }
                    else {
                        res.status(201).json({
                            codeId: 0,
                            token: authHeader,
                            data: data,
                            member: {
                                username: member.username,
                                balance: balanceNow
                            }
                        });
                    }
                });
            }
        })
    } catch (err) {
        err.statusCode = 500;
        res.json({ status: "Not Data Request Body." });
    }
};

//Manna Play-------------------------------------------------------------------------------------------------------------------------------------------------------------------
http://localhost:5000/post/Manna/fetchBalance
exports.FetchBalanceManna = async (req, res) => {
    const account = req.body.account;
    const sessionId = req.body.sessionId;
    username = 'member001';
    let spl = `SELECT credit FROM member WHERE username ='${account}' AND status_delete='N' 
  ORDER BY member_code ASC`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                res.status(201).json({
                    balance: balanceUser
                });
            }
        })
    } catch (err) {
        err.statusCode = 500;
        res.status(201).json({
            errorCode: 10100,
            message: "Server is not ready!"
        });
    }
};

http://localhost:5000/post/Manna/withdraw
exports.WithdrawManna = async (req, res) => {
    const account = req.body.account;
    const transaction_id = req.body.transaction_id;
    const amount = req.body.amount;
    const game_id = req.body.game_id;
    username = 'member001';
    const userAgent = req.headers['user-agent'];

    let spl = `SELECT credit, turnover FROM member WHERE username ='${account}' AND status_delete='N' 
  ORDER BY member_code ASC`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                const balanceNow = balanceUser - amount;
                let postTurnover = results[0].turnover - amount;
                if (postTurnover < 0) {
                    postTurnover = 0;
                }
                const post = {
                    username: account, gameid: game_id, bet: amount, win: 0, balance_credit: balanceNow, userAgent: userAgent, platform: userAgent, trans_id: transaction_id
                }
                let repost = repostGame.uploadLogRepostGameAsk(post)
                const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${amount}', turnover='${postTurnover}'
                WHERE username ='${account}'`;
                connection.query(sql_update, (error, resultsGame) => {
                    if (error) { console.log(error) }
                    else {
                        res.status(201).json({
                            transaction_id: transaction_id,
                            balance: balanceNow,
                        });
                    }
                });
            }
        })
    } catch (err) {
        err.statusCode = 500;
        res.status(201).json({
            errorCode: 10100,
            message: "Server is not ready!"
        });
    }
};

http://localhost:5000/post/Manna/deposit
exports.DepositManna = async (req, res) => {
    const account = req.body.account;
    const transaction_id = req.body.transaction_id;
    const amount = req.body.amount;
    const jp_win = req.body.jp_win;
    const game_id = req.body.game_id;
    const userAgent = req.headers['user-agent'];

    let spl = `SELECT credit FROM member WHERE username ='${account}' AND status_delete='N' 
  ORDER BY member_code ASC`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                const balanceNow = balanceUser + amount + jp_win;
                const post = {
                    username: account, gameid: game_id, bet: 0, win: jp_win, balance_credit: balanceNow, userAgent: userAgent, platform: userAgent, trans_id: game_id
                }
                let repost = repostGame.uploadLogRepostGameAsk(post)
                const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${amount}' WHERE username ='${account}'`;
                connection.query(sql_update, (error, resultsGame) => {
                    if (error) { console.log(error) }
                    else {
                        res.status(201).json({
                            transaction_id: transaction_id,
                            balance: balanceNow,
                        });
                    }
                });
            }
        })
    } catch (err) {
        err.statusCode = 500;
        res.status(201).json({
            errorCode: 10100,
            message: "Server is not ready!"
        });
    }
};

http://localhost:5000/post/Manna/rollback
exports.RollbackManna = async (req, res) => {
    const account = req.body.account;
    const transaction_id = req.body.transaction_id;
    const sessionId = req.body.sessionId;
    const currency = req.body.currency;
    username = 'member001';

    let spl = `SELECT credit FROM member WHERE username ='${account}' AND status_delete='N' 
  ORDER BY member_code ASC`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                res.status(201).json({
                    transaction_id: transaction_id,
                    balance: balanceUser,
                });
            }
        })
    } catch (err) {
        err.statusCode = 500;
        res.status(201).json({
            errorCode: 10100,
            message: "Server is not ready!"
        });
    }
};

http://localhost:5000/post/Manna/jp_deposit
exports.JP_DepositManna = async (req, res) => {
    const account = req.body.account;
    const transaction_id = req.body.transaction_id;
    const jp_win = req.body.jp_win;
    username = 'member001';

    let spl = `SELECT credit FROM member WHERE username ='${account}' AND status_delete='N' 
  ORDER BY member_code ASC`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                const balanceNow = balanceUser + jp_win;
                const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${0}' WHERE username ='${account}'`;
                connection.query(sql_update, (error, resultsGame) => {
                    if (error) { console.log(error) }
                    else {
                        res.status(201).json({
                            transaction_id: transaction_id,
                            balance: balanceNow,
                        });
                    }
                });
            }
        })
    } catch (err) {
        err.statusCode = 500;
        res.status(201).json({
            errorCode: 10100,
            message: "Server is not ready!"
        });
    }
};

//Simple Play -------------------------------------------------------------------------------------------------------------------------------------------------------------------

http://localhost:5000/post/SimplePlay/GetUserBalance
exports.GetUserBalanceSimplePlay = async (req, res) => {
    const usernames = req.body.username;
    const currency = req.body.currency;
    username = 'member001';
    let spl = `SELECT credit FROM member WHERE username ='${usernames}' AND status_delete='N' 
  ORDER BY member_code ASC`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                res.status(201).json({
                    username: usernames,
                    currency: currency,
                    amount: balanceUser,
                    error: 0
                });
            }
        })
    } catch (err) {
        err.statusCode = 500;
        res.status(201).json({
            message: "Server is not ready!"
        });
    }
};

http://localhost:5000/post/SimplePlay/PlaceBet
exports.PlaceBetSimplePlay = async (req, res) => {
    const usernames = req.body.username;
    const transaction_id = req.body.transaction_id;
    const amount = req.body.amount;
    const currency = req.body.currency;
    const userAgent = req.headers['user-agent'];
    const game_id = req.body.gameid;
    let spl = `SELECT credit FROM member WHERE username ='${usernames}' AND status_delete='N' 
  ORDER BY member_code ASC`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                const balanceamount = parseFloat(amount);
                const balanceNow = balanceUser - balanceamount;
                let postTurnover = results[0].turnover - balanceamount;
                if (postTurnover < 0) {
                    postTurnover = 0;
                }
                const post = {
                    username: usernames, gameid: game_id, bet: balanceamount, win: 0, balance_credit: balanceNow, userAgent: userAgent, platform: userAgent, trans_id: transaction_id
                }
                let repost = repostGame.uploadLogRepostGameAsk(post)

                const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${balanceamount}', turnover='${postTurnover}'
                WHERE username ='${usernames}'`;
                connection.query(sql_update, (error, resultsGame) => {
                    if (error) { console.log(error) }
                    else {
                        res.status(201).json({
                            username: usernames,
                            currency: currency,
                            amount: balanceNow,
                            error: 0
                        });
                    }
                });
            }
        })
    } catch (err) {
        err.statusCode = 500;
        res.status(201).json({
            message: "Server is not ready!"
        });
    }
};

http://localhost:5000/post/SimplePlay/PlayerWin
exports.PlayerWinSimplePlay = async (req, res) => {
    const usernames = req.body.username;
    const transaction_id = req.body.transaction_id;
    const amount = req.body.amount;
    const currency = req.body.currency;
    const userAgent = req.headers['user-agent'];
    const game_id = req.body.gameid;

    let spl = `SELECT credit FROM member WHERE username ='${usernames}' AND status_delete='N' 
  ORDER BY member_code ASC`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                const balanceamount = parseFloat(amount);
                const balanceNow = balanceUser + balanceamount;
                const post = {
                    username: usernames, gameid: game_id, bet: 0, win: balanceamount, balance_credit: balanceNow, userAgent: userAgent, platform: userAgent, trans_id: transaction_id
                }
                let repost = repostGame.uploadLogRepostGameAsk(post)
                const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${0}' WHERE username ='${usernames}'`;
                connection.query(sql_update, (error, resultsGame) => {
                    if (error) { console.log(error) }
                    else {
                        res.status(201).json({
                            username: usernames,
                            currency: currency,
                            amount: balanceNow,
                            error: 0
                        });
                    }
                });
            }
        })
    } catch (err) {
        err.statusCode = 500;
        res.status(201).json({
            message: "Server is not ready!"
        });
    }
};

http://localhost:5000/post/SimplePlay/PlayerLost
exports.PlayerLostSimplePlay = async (req, res) => {
    const usernames = req.body.username;
    const currency = req.body.currency;
    username = 'member001';
    let spl = `SELECT credit FROM member WHERE username ='${usernames}' AND status_delete='N' 
  ORDER BY member_code ASC`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                res.status(201).json({
                    username: usernames,
                    currency: currency,
                    amount: balanceUser,
                    error: 0
                });
            }
        })
    } catch (err) {
        err.statusCode = 500;
        res.status(201).json({
            message: "Server is not ready!"
        });
    }
};

http://localhost:5000/post/SimplePlay/PlaceBetCancel
exports.PlaceBetCancelSimplePlay = async (req, res) => {
    const usernames = req.body.username;
    const txn_reverse_id = req.body.txn_reverse_id;
    const currency = req.body.currency;
    const amount = req.body.amount;
    username = 'member001';

    let spl = `SELECT credit FROM member WHERE username ='${usernames}' AND status_delete='N' 
  ORDER BY member_code ASC`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                const balanceamount = parseFloat(amount);
                const balanceNow = balanceUser + balanceamount;
                const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${0}' WHERE username ='${usernames}'`;
                connection.query(sql_update, (error, resultsGame) => {
                    if (error) { console.log(error) }
                    else {
                        res.status(201).json({
                            username: usernames,
                            currency: currency,
                            amount: balanceNow,
                            error: 0
                        });
                    }
                });
            }
        })
    } catch (err) {
        err.statusCode = 500;
        res.status(201).json({
            message: "Server is not ready!"
        });
    }
};
// -------------------------------------------------------------------------------------------------------------------------------------------------------------------
