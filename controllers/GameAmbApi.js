const { response } = require("express");
const mysql = require('mysql2') //npm install mysql2
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
const os = require('os');
const repostGame = require('./repostGame')
require('dotenv').config()

const connection = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    database: process.env.DB_DATABASE,
    password: process.env.DB_PASSWORD
});

//Spade_Gaming-------------------------------------------------------------------------------------------------------------------------------------------------------------------
http://localhost:5000/post/Spade_Gaming  
exports.AuthorizationSpade_Gaming = async (req, res) => {
    const authHeaderApi = req.headers.api;
    const acctId = req.body.acctId;
    const serialNo = req.body.serialNo;
    const authHeader = req.body.token;
    const gameCode = req.body.gameCode;
    const transferId = req.body.transferId;
    const amount = req.body.amount;
    const type = req.body.type;
    const userAgent = req.headers['user-agent'];

    let spl = `SELECT credit, turnover FROM member WHERE phonenumber ='${acctId}' AND status_delete='N'`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                if (authHeaderApi === 'authorize' || authHeaderApi === 'getBalance') {
                    res.status(201).json({
                        acctInfo: {
                            acctId: acctId,
                            balance: balanceUser,
                            userName: acctId,
                            currency: "THB",
                        },
                        msg: "success",
                        code: 0,
                        serialNo: serialNo
                    });
                } else {
                    let balanceNow;
                    let postTurnover = results[0].turnover - amount;
                    if (type === 1) {
                        balanceNow = balanceUser - amount;
                        const post = {
                            username: acctId, gameid: gameCode, bet: amount, win: 0, balance_credit: balanceNow, userAgent: userAgent, platform: userAgent, trans_id: transferId
                        }
                        let repost = repostGame.uploadLogRepostGameAsk(post)
                        if (postTurnover < 0) postTurnover = 0;
                    } else if (type === 2) {
                        balanceNow = balanceUser + amount;
                        const post = {
                            username: acctId, gameid: gameCode, bet: 0, win: amount, balance_credit: balanceNow, userAgent: userAgent, platform: userAgent, trans_id: transferId
                        }
                        let repost = repostGame.uploadLogRepostGameAsk(post)
                        if (postTurnover < 0) postTurnover = 0;
                    } else if (type === 4) {
                        balanceNow = balanceUser - amount;
                        if (postTurnover < 0) postTurnover = 0;
                    } else {
                        balanceNow = balanceUser + amount;
                        if (postTurnover < 0) postTurnover = 0;
                    }

                    const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${amount}', turnover='${postTurnover}' 
                    WHERE phonenumber ='${acctId}'`;
                    connection.query(sql_update, (error, resultsGame) => {
                        if (error) { console.log(error) }
                        else {
                            res.status(201).json({
                                transferId: transferId,
                                merchantTxId: serialNo,
                                acctId: acctId,
                                balance: balanceNow,
                                msg: "success",
                                code: 0,
                                serialNo: serialNo
                            });
                        }
                    });
                }
            }
        })
    } catch (err) {
        err.statusCode = 500;
        res.json({ status: "Not Data Request Body." });
    }
};

//Habanero-------------------------------------------------------------------------------------------------------------------------------------------------------------------
http://localhost:5000/post/Habanero  
exports.HabaneroGame = async (req, res) => {
    const type = req.body.type;
    const dtsent = req.body.dtsent;
    const basegame = req.body.basegame;
    const auth = req.body.auth;
    const token = '00tcga7cq_d4be70d1-349f-4fc1-a955-35d2a4bff244';
    const secretKey = 'your-secret-key';
    const gameToken = req.body.playerdetailrequest.token;
    const gameTokenV = req.body.playerdetailresponse.token;
    console.log(gameToken);
    console.log(gameTokenV);
    console.log(auth.username);
    let spl = `SELECT credit, turnover FROM member WHERE phonenumber ='${auth.username}' AND status_delete='N'`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                console.log(results)
                const balanceUser = results[0].credit;
                if (type === 'playerdetailrequest') {
                    const playerdetailrequest = req.body.playerdetailrequest;
                    res.status(201).json({
                        playerdetailresponse: {
                            status: {
                                success: true,
                                autherror: false,
                                nofunds: false,
                                successdebit: true,
                                successcredit: true,
                                refundstatus: 0,
                                message: "success",
                            },
                            accountid: auth.username,
                            accountname: auth.username,
                            balance: balanceUser,
                            currencycode: "THB"
                        }
                    });
                } else if (type === 'fundtransferrequest') {
                    const fundtransferrequest = req.body.fundtransferrequest;
                    const gamedetails = req.body.gamedetails;
                    const amount0 = fundtransferrequest.funds.fundinfo[0].amount
                    //const amount1 = fundtransferrequest.funds.fundinfo[1].amount
                    const balanceNum = parseFloat(balanceUser);
                    const balanceNow = balanceNum + amount0
                    const balanceString = balanceNow.toString();
                    let postTurnover = results[0].turnover - amount0;
                    if (postTurnover < 0) {
                        postTurnover = 0;
                    }
                    const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${amount0}', turnover='${postTurnover}' 
                    WHERE phonenumber ='${auth.username}'`;
                    connection.query(sql_update, (error, resultsGame) => {
                        res.status(201).json({
                            fundtransferresponse: {
                                status: {
                                    success: true,
                                    autherror: false,
                                    nofunds: false,
                                    successdebit: true,
                                    successcredit: true,
                                    refundstatus: 0,
                                },
                                balance: balanceString,
                                currencycode: "THB"
                            }
                        });
                    });
                } else {
                    const queryrequest = req.body.queryrequest;
                    res.status(201).json({
                        fundtransferresponse: {
                            status: {
                                success: true,
                            }
                        }
                    });
                }
            }
        })
    } catch (err) {
        err.statusCode = 500;
        res.json({ status: "Not Data Request Body." });
    }
};

//Micro gaming/UPG slot-------------------------------------------------------------------------------------------------------------------------------------------------------------------

http://localhost:5000/post/gaming/login //getbalance
exports.gamingLogin = async (req, res) => {
    const playerId = req.body.playerId;
    const username = '0990825941';
    console.log(playerId);
    let spl = `SELECT credit FROM member WHERE phonenumber ='${username}' AND status_delete='N'`;
    try {
        connection.query(spl, (error, results) => {
            const balanceNum = parseFloat(results[0].credit);
            console.log(balanceNum);
            if (error) { console.log(error) }
            else {
                res.status(201).json({
                    currency: "THB",
                    balance: balanceNum,
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

http://localhost:5000/post/gaming/updatebalance 
exports.UpdateBalanceGaming = async (req, res) => {
    const txnType = req.body.txnType;
    const amount = req.body.amount;
    //const username = '0990825941';
    const completed = req.body.completed;
    const username = req.body.playerId;
    const txnId = req.body.txnId;
    const txnEventType = req.body.txnEventType
    const userAgent = req.headers['user-agent'];
    let spl = `SELECT credit, turnover FROM member WHERE phonenumber ='${username}' AND status_delete='N'`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                const balanceamount = parseFloat(amount);
                let balanceNow = balanceUser + balanceamount;
                let postTurnover = results[0].turnover - balanceamount;
                if (txnType === 'DEBIT') {
                    balanceNow = balanceUser + balanceamount;
                    const post = {
                        username: username, gameid: txnEventType, bet: 0, win: balanceamount, balance_credit: balanceNow, userAgent: userAgent, platform: userAgent, trans_id: txnId
                    }
                    let repost = repostGame.uploadLogRepostGameAsk(post)
                    if (postTurnover < 0) {
                        postTurnover = 0;
                    }
                } else {
                    balanceNow = balanceUser - balanceamount;
                    balanceNow = balanceUser + balanceamount;
                    const post = {
                        username: username, gameid: txnEventType, bet: balanceamount, win: 0, balance_credit: balanceNow, userAgent: userAgent, platform: userAgent, trans_id: txnId
                    }
                    let repost = repostGame.uploadLogRepostGameAsk(post)
                    if (postTurnover < 0) {
                        postTurnover = 0;
                    }
                }
                const sql_update = `UPDATE member set credit='${balanceNow}', bet_latest='${0}', turnover='${postTurnover}'
                WHERE phonenumber ='${username}'`;
                connection.query(sql_update, (error, resultsGame) => {
                    if (error) { console.log(error) }
                    else {
                        res.status(201).json({
                            extTxnId: "f47e5065-412c-40d1-9e4c-f6c248919509",
                            currency: "THB",
                            balance: balanceNow
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

http://localhost:5000/post/gaming/rollback 
exports.RollbackGaming = async (req, res) => {
    const amount = req.body.amount;
    const username = req.body.playerId;
    let spl = `SELECT credit FROM member WHERE phonenumber ='${username}' AND status_delete='N'`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                const balanceamount = parseFloat(amount);
                const balanceNow = balanceUser - balanceamount;
                const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${amount}' WHERE phonenumber ='${username}'`;
                connection.query(sql_update, (error, resultsGame) => {
                    if (error) { console.log(error) }
                    else {
                        res.status(201).json({
                            extTxnId: "f47e5065-412c-40d1-9e4c-f6c248919509",
                            currency: "THB",
                            balance: balanceNow
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

//EVOPLAY -------------------------------------------------------------------------------------------------------------------------------------------------------------------

http://localhost:5000/post/eVOPLAYSeamless  
exports.EVOPLAYSeamless = async (req, res) => {
    const token = req.body.token;
    const callback_id = req.body.callback_id;
    const name = req.body.name;
    const data = req.body.data;
    const username = '0990825941';
    const userAgent = req.headers['user-agent'];
    console.log(token);
    let spl = `SELECT credit, turnover FROM member WHERE phonenumber ='${username}' AND status_delete='N'`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = results[0].credit;
                const balanceString = balanceUser.toString();

                if (name === 'init') {
                    console.log(balanceUser);
                    res.status(201).json({
                        status: "ok",
                        data: {
                            balance: balanceString,
                            currency: "THB"
                        }
                    });
                } else if (name === 'bet') {
                    const amount0 = data.amount
                    const amount = parseFloat(amount0);
                    const balanceNum = parseFloat(balanceUser);
                    const balanceNow = balanceNum - amount
                    const balanceString = balanceNow.toString();
                    let postTurnover = results[0].turnover - amount;
                    if (postTurnover < 0) {
                        postTurnover = 0;
                    }
                    const post = {
                        username: username, gameid: callback_id, bet: amount, win: 0, balance_credit: balanceNow, userAgent: userAgent, platform: userAgent, trans_id: data.action_id
                    }
                    let repost = repostGame.uploadLogRepostGameAsk(post)

                    const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${amount}', turnover='${postTurnover}'
                    WHERE phonenumber ='${username}'`;
                    connection.query(sql_update, (error, resultsGame) => {
                        res.status(201).json({
                            status: "ok",
                            data: {
                                balance: balanceString,
                                currency: data.currency
                            }
                        });
                    });
                } else if (name === 'win') {
                    const amount0 = data.amount
                    const amount = parseFloat(amount0);
                    const balanceNum = parseFloat(balanceUser);
                    const balanceNow = balanceNum + amount
                    const balanceString = balanceNow.toString();
                    const post = {
                        username: username, gameid: callback_id, bet: 0, win: amount, balance_credit: balanceNow, userAgent: userAgent, platform: userAgent, trans_id: data.action_id
                    }
                    let repost = repostGame.uploadLogRepostGameAsk(post)
                    const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${amount}' WHERE phonenumber ='${username}'`;
                    connection.query(sql_update, (error, resultsGame) => {
                        res.status(201).json({
                            status: "ok",
                            data: {
                                balance: balanceString,
                                currency: data.currency
                            }
                        });
                    });
                } else {
                    const amount0 = data.amount
                    const amount = parseFloat(amount0);
                    const balanceNum = parseFloat(balanceUser);
                    const balanceNow = balanceNum + amount
                    const balanceString = balanceNow.toString();
                    const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${amount}' WHERE phonenumber ='${username}'`;
                    connection.query(sql_update, (error, resultsGame) => {
                        res.status(201).json({
                            status: "ok",
                            data: {
                                balance: balanceString,
                                currency: data.currency
                            }
                        });
                    });
                }
            }
        })
    } catch (err) {
        err.statusCode = 500;
        res.json({ status: "Not Data Request Body." });
    }
};

//Funky game -------------------------------------------------------------------------------------------------------------------------------------------------------------------

http://localhost:5000/post//Funky/User/GetBalance
exports.GetBalanceFunky = async (req, res) => {
    const playerId = req.body.playerId;
    const authHeader = req.body.sessionId;
    const username = '0990825941';
    console.log(authHeader);
    let spl = `SELECT credit FROM member WHERE phonenumber ='${username}' AND status_delete='N'`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                res.status(201).json({
                    errorCode: 0,
                    errorMessage: "No Error",
                    data: {
                        balance: balanceUser,
                        currency: "THB"
                    }
                });
            }
        })
    } catch (err) {
        err.statusCode = 500;
        res.json({ status: "Not Data Request Body." });
    }
};

http://localhost:5000/post/Funky/Bet/PlaceBet
exports.PlaceBetFunky = async (req, res) => {
    const bet = req.body.bet;
    const sessionId = req.body.sessionId;
    const playerIp = req.body.playerIp;
    const username = '0990825941';
    const userAgent = req.headers['user-agent'];
    console.log(playerIp);
    console.log(sessionId)
    let spl = `SELECT credit, turnover FROM member WHERE phonenumber ='${username}' AND status_delete='N'`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const amount = bet.stake
                const balanceNum = parseFloat(results[0].credit);
                const balanceNow = balanceNum - amount
                let postTurnover = results[0].turnover - amount;
                if (postTurnover < 0) {
                    postTurnover = 0;
                }
                const post = {
                    username: username, gameid: bet.gameCode, bet: amount, win: 0, balance_credit: balanceNow, userAgent: userAgent, platform: userAgent, trans_id: bet.refNo
                }
                let repost = repostGame.uploadLogRepostGameAsk(post)

                const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${amount}', turnover='${postTurnover}'
                WHERE phonenumber ='${username}'`;
                connection.query(sql_update, (error, resultsGame) => {
                    res.status(201).json({
                        errorCode: 0,
                        errorMessage: "No Error",
                        data: {
                            balance: balanceNow
                        }
                    });
                });
            }
        })
    } catch (err) {
        err.statusCode = 500;
        res.json({ status: "Not Data Request Body." });
    }
};

http://localhost:5000/post/Funky/Bet/SettleBet
exports.SettleBetFunky = async (req, res) => {
    const refNo = req.body.refNo;
    const betResultReq = req.body.betResultReq;
    const now = new Date();
    const currentDate = now.toISOString().slice(0, 10);
    const username = '0990825941';
    const userAgent = req.headers['user-agent'];
    let spl = `SELECT credit FROM member WHERE phonenumber ='${username}' AND status_delete='N'`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                const balanceNow = balanceUser + betResultReq.winAmount;
                const post = {
                    username: username, gameid: betResultReq.gameCode, bet: 0, win: betResultReq.winAmount, balance_credit: balanceNow, userAgent: userAgent, platform: userAgent, trans_id: refNo
                }
                let repost = repostGame.uploadLogRepostGameAsk(post)
                const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${betResultReq.winAmount}' WHERE phonenumber ='${username}'`;
                connection.query(sql_update, (error, resultsGame) => {
                    if (error) { console.log(error) }
                    else {
                        res.status(201).json({
                            errorCode: 0,
                            errorMessage: "No Error",
                            data: {
                                refNo: refNo,
                                balance: balanceNow,
                                playerId: betResultReq.playerId,
                                statementDate: currentDate
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

http://localhost:5000/post/Funky/Bet/CancelBet
exports.CancelBetFunky = async (req, res) => {
    const refNo = req.body.refNo;
    const playerId = req.body.playerId;
    const username = '0990825941';

    let spl = `SELECT credit FROM member WHERE phonenumber ='${username}' AND status_delete='N'`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                res.status(201).json({
                    errorCode: 0,
                    errorMessage: "No Error",
                    data: {
                        refNo: refNo
                    }
                });
            }
        })
    } catch (err) {
        err.statusCode = 500;
        res.json({ status: "Not Data Request Body." });
    }
};

http://localhost:5000/post/Funky/Bet/CheckBet
exports.CheckBetFunky = async (req, res) => {
    const playerId = req.body.playerId;
    const id = req.body.id;
    const now = new Date();
    const currentDate = now.toISOString().slice(0, 10);
    const username = '0990825941';

    let spl = `SELECT credit, bet_latest FROM member WHERE phonenumber ='${username}' AND status_delete='N'`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                res.status(201).json({
                    errorCode: 0,
                    errorMessage: "No Error",
                    data: {
                        refNo: refNo,
                        stake: 50.00,
                        winAmount: results[0].bet_latest,
                        status: "W",
                        statementDate: currentDate
                    }
                });
            }
        })
    } catch (err) {
        err.statusCode = 500;
        res.json({ status: "Not Data Request Body." });
    }
};

//Yggdrasil -------------------------------------------------------------------------------------------------------------------------------------------------------------------

http://localhost:5000/post/Yggdrasil/playerinfo //getbalance
exports.PlayerinfoYggdrasil = async (req, res) => {
    const usernames = req.body.username;
    let spl = `SELECT credit FROM member WHERE phonenumber ='${usernames}' AND status_delete='N'`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                res.status(201).json({
                    code: 0,
                    data: {
                        balance: balanceUser,
                        currency: "THB",
                        country: "TH"
                    }
                });
            }
        })
    } catch (err) {
        err.statusCode = 500;
        res.json({ status: "Not Data Request Body." });
    }
};

http://localhost:5000/post/Yggdrasil/wager  //endwager  //Append Payout
exports.PlaceBetYggdrasil = async (req, res) => {
    const usernames = req.body.username;
    const amount = req.body.amount;
    const gameId = req.body.gameId;
    const betId = req.body.betId;
    const roundId = req.body.roundId;
    const userAgent = req.headers['user-agent'];
    let spl = `SELECT credit, turnover FROM member WHERE phonenumber ='${usernames}' AND status_delete='N'`;
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
                    username: usernames, gameid: gameId, bet: amount, win: 0, balance_credit: balanceNow, userAgent: userAgent, platform: userAgent, trans_id: betId
                }
                let repost = repostGame.uploadLogRepostGameAsk(post)

                const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${amount}', turnover='${postTurnover}'
                WHERE phonenumber ='${usernames}'`;
                connection.query(sql_update, (error, resultsGame) => {
                    if (error) { console.log(error) }
                    else {
                        res.status(201).json({
                            code: 0,
                            data: {
                                balance: balanceNow,
                                currency: "THB",
                                country: "TH"
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

http://localhost:5000/post/Yggdrasil/wager  //endwager  //Append Payout
exports.PayoutYggdrasil = async (req, res) => {
    const usernames = req.body.username;
    const amount = req.body.amount;
    const gameId = req.body.gameId;
    const betId = req.body.betId;
    const roundId = req.body.roundId;
    const userAgent = req.headers['user-agent'];
    let spl = `SELECT credit, turnover FROM member WHERE phonenumber ='${usernames}' AND status_delete='N'`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                const balanceNow = balanceUser + amount;
                const post = {
                    username: usernames, gameid: gameId, bet: 0, win: amount, balance_credit: balanceNow, userAgent: userAgent, platform: userAgent, trans_id: betId
                }
                let repost = repostGame.uploadLogRepostGameAsk(post)

                const sql_update = `UPDATE member set credit='${balanceNow}' WHERE phonenumber ='${usernames}'`;
                connection.query(sql_update, (error, resultsGame) => {
                    if (error) { console.log(error) }
                    else {
                        res.status(201).json({
                            code: 0,
                            data: {
                                balance: balanceNow,
                                currency: "THB",
                                country: "TH"
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

http://localhost:5000/post/Yggdrasil/cancelwager
exports.CancelBetYggdrasil = async (req, res) => {
    const usernames = req.body.username;
    const amount = req.body.amount;
    const gameId = req.body.gameId;
    const betId = req.body.betId;
    const roundId = req.body.roundId;

    let spl = `SELECT credit FROM member WHERE phonenumber ='${usernames}' AND status_delete='N'`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                const balanceNow = balanceUser + amount;
                const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${amount}' WHERE phonenumber ='${usernames}'`;
                connection.query(sql_update, (error, resultsGame) => {
                    if (error) { console.log(error) }
                    else {
                        res.status(201).json({
                            code: 0,
                            data: {
                                balance: balanceNow,
                                currency: "THB",
                                country: "TH"
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

//Ameba -------------------------------------------------------------------------------------------------------------------------------------------------------------------

http://localhost:5000/post/Ameba  
exports.AmebaGame = async (req, res) => {
    const action = req.body.action;
    const account_name = req.body.account_name;
    const time = req.body.time;
    const userAgent = req.headers['user-agent'];

    let spl = `SELECT credit, turnover FROM member WHERE phonenumber ='${account_name}' AND status_delete='N'`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = results[0].credit;
                const balanceString = balanceUser.toString();
                if (action === 'get_balance') {
                    res.status(201).json({
                        error_code: "OK",
                        balance: balanceString
                    });
                } else if (action === 'bet') {
                    const game_id = req.body.game_id;
                    const round_id = req.body.round_id;
                    const tx_id = req.body.tx_id;
                    const free = req.body.game_id;
                    const sessionid = req.body.round_id;
                    const bet_amt = req.body.bet_amt;
                    const amount = parseFloat(bet_amt);
                    const balanceNum = parseFloat(balanceUser);
                    const balanceNow = balanceNum - amount
                    const balanceString = balanceNow.toString();

                    let postTurnover = results[0].turnover - amount;
                    if (postTurnover < 0) {
                        postTurnover = 0;
                    }
                    const post = {
                        username: account_name, gameid: game_id, bet: amount, win: 0, balance_credit: balanceNow, userAgent: userAgent, platform: userAgent, trans_id: sessionid
                    }
                    let repost = repostGame.uploadLogRepostGameAsk(post)
                    const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${amount}', turnover='${postTurnover}'
                    WHERE phonenumber ='${account_name}'`;
                    connection.query(sql_update, (error, resultsGame) => {
                        res.status(201).json({
                            error_code: "OK",
                            balance: balanceString,
                            time: time
                        });
                    });
                } else if (action === 'payout') {
                    const game_id = req.body.game_id;
                    const round_id = req.body.round_id;
                    const tx_id = req.body.tx_id;
                    const free = req.body.game_id;
                    const sessionid = req.body.round_id;
                    const bet_amt = req.body.bet_amt;
                    const payout_amt = req.body.payout_amt;
                    const sum_payout_amt = req.body.sum_payout_amt;
                    const amount = parseFloat(sum_payout_amt);
                    const balanceNum = parseFloat(balanceUser);
                    const balanceNow = balanceNum + amount
                    const balanceString = balanceNow.toString();
                    const post = {
                        username: account_name, gameid: game_id, bet: 0, win: amount, balance_credit: balanceNow, userAgent: userAgent, platform: userAgent, trans_id: sessionid
                    }
                    let repost = repostGame.uploadLogRepostGameAsk(post)
                    const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${amount}' WHERE phonenumber ='${account_name}'`;
                    connection.query(sql_update, (error, resultsGame) => {
                        res.status(201).json({
                            error_code: "OK",
                            balance: balanceString,
                            time: time
                        });
                    });
                } else {
                    const game_id = req.body.game_id;
                    const round_id = req.body.round_id;
                    const tx_id = req.body.tx_id;
                    const free = req.body.game_id;
                    const sessionid = req.body.round_id;
                    const bet_amt = req.body.bet_amt;
                    const amount0 = data.amount
                    const amount = parseFloat(bet_amt);
                    const balanceNum = parseFloat(balanceUser);
                    const balanceNow = balanceNum + amount
                    const balanceString = balanceNow.toString();
                    const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${amount}' WHERE phonenumber ='${account_name}'`;
                    connection.query(sql_update, (error, resultsGame) => {
                        res.status(201).json({
                            error_code: "OK",
                            balance: balanceString,
                            time: time
                        });
                    });
                }
            }
        })
    } catch (err) {
        err.statusCode = 500;
        res.json({ status: "Not Data Request Body." });
    }
};

//Ambslot---------------------------------------------------------------------------------------------------------------------------------------------------------------------

http://localhost:5000/post/Ambslot/balance
exports.balanceAmbslot = async (req, res) => {
    const usernames = req.body.username;
    username = 'member001';
    let spl = `SELECT credit FROM member WHERE phonenumber ='${usernames}' AND status_delete='N'`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                res.status(201).json({
                    status: {
                        code: 0,
                        message: "Success"
                    },
                    data: {
                        balance: balanceUser
                    },
                });
            }
        })
    } catch (err) {
        err.statusCode = 500;
        res.json({ status: "Not Data Request Body." });
    }
};

http://localhost:5000/post/Ambslot/bet
exports.PlaceBetAmbslot = async (req, res) => {
    const usernames = req.body.username;
    const amount = req.body.amount;
    const featureBuy = req.body.featureBuy;
    const isEndRound = req.body.isEndRound;
    const roundAmount = req.body.roundAmount;
    const refId = req.body.refId;
    const gameId = req.body.gameId;
    const roundId = req.body.roundId;
    const now = new Date();
    const formattedDate = now.toISOString();

    let spl = `SELECT credit, turnover FROM member WHERE phonenumber ='${usernames}' AND status_delete='N' `;
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
                const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${amount}', turnover='${postTurnover}'
                WHERE phonenumber ='${usernames}'`;
                connection.query(sql_update, (error, resultsGame) => {
                    if (error) { console.log(error) }
                    else {
                        res.status(201).json({
                            status: {
                                code: 0,
                                message: "Success"
                            },
                            data: {
                                username: usernames,
                                wallet: {
                                    balance: balanceNow,
                                    lastUpdate: formattedDate
                                },
                                balance: {
                                    before: balanceUser,
                                    after: balanceNow
                                },
                                refId: refId
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

http://localhost:5000/post/Ambslot/payout
exports.PayoutAmbslot = async (req, res) => {
    const usernames = req.body.username;
    const amount = req.body.amount;
    const featureBuy = req.body.featureBuy;
    const isEndRound = req.body.isEndRound;
    const roundAmount = req.body.roundAmount;
    const refId = req.body.refId;
    const gameId = req.body.gameId;
    const roundId = req.body.roundId;
    const now = new Date();
    const formattedDate = now.toISOString();
    username = 'member001';
    let spl = `SELECT credit FROM member WHERE phonenumber ='${usernames}' AND status_delete='N'`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                const balanceNow = balanceUser + amount;
                const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${amount}' WHERE phonenumber ='${usernames}'`;
                connection.query(sql_update, (error, resultsGame) => {
                    if (error) { console.log(error) }
                    else {
                        res.status(201).json({
                            status: {
                                code: 0,
                                message: "Success"
                            },
                            data: {
                                username: usernames,
                                wallet: {
                                    balance: balanceNow,
                                    lastUpdate: formattedDate
                                },
                                balance: {
                                    before: balanceUser,
                                    after: balanceNow
                                },
                                refId: refId
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

http://localhost:5000/post/Ambslot/cancel
exports.CancelAmbslot = async (req, res) => {
    const usernames = req.body.username;
    const amount = req.body.amount;
    const refId = req.body.featureBuy;
    const gameId = req.body.isEndRound;
    const roundId = req.body.roundId;
    const now = new Date();
    const formattedDate = now.toISOString();
    username = 'member001';
    let spl = `SELECT credit FROM member WHERE phonenumber ='${usernames}' AND status_delete='N'`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                const balanceNow = balanceUser + amount;
                const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${amount}' WHERE phonenumber ='${usernames}'`;
                connection.query(sql_update, (error, resultsGame) => {
                    if (error) { console.log(error) }
                    else {
                        res.status(201).json({
                            status: {
                                code: 0,
                                message: "Success"
                            },
                            data: {
                                username: usernames,
                                wallet: {
                                    balance: balanceNow,
                                    lastUpdate: formattedDate
                                },
                                balance: {
                                    before: balanceUser,
                                    after: balanceNow
                                },
                                refId: refId
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

http://localhost:5000/post/Ambslot/void
exports.VoidAmb = async (req, res) => {
    const usernames = req.body.username;
    const amount = req.body.amount;
    const refId = req.body.featureBuy;
    const gameId = req.body.isEndRound;
    const roundId = req.body.roundId;
    const now = new Date();
    const formattedDate = now.toISOString();
    username = 'member001';
    let spl = `SELECT credit FROM member WHERE phonenumber ='${usernames}' AND status_delete='N'`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                const balanceNow = balanceUser + amount;
                const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${amount}' WHERE phonenumber ='${usernames}'`;
                connection.query(sql_update, (error, resultsGame) => {
                    if (error) { console.log(error) }
                    else {
                        res.status(201).json({
                            status: {
                                code: 0,
                                message: "Success"
                            },
                            data: {
                                username: usernames,
                                wallet: {
                                    balance: balanceNow,
                                    lastUpdate: formattedDate
                                },
                                balance: {
                                    before: balanceUser,
                                    after: balanceNow
                                },
                                refId: refId
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

//Spade Gaming -------------------------------------------------------------------------------------------------------------------------------------------------------------------

http://localhost:5000/post/Ameba  
exports.SpadeGaming = async (req, res) => {
    const acctId = req.body.acctId;
    const authHeaderApi = req.headers.api;
    const serialNo = req.body.serialNo;
    const userAgent = req.headers['user-agent'];

    let spl = `SELECT credit FROM member WHERE phonenumber ='${acctId}' AND status_delete='N'`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                if (authHeaderApi === 'authorize') {
                    const token = req.body.token;
                    res.status(201).json({
                        acctInfo: {
                            acctId: acctId,
                            balance: balanceUser,
                            userName: acctId,
                            currency: "THB",
                        },
                        msg: "success",
                        code: 0,
                        serialNo: serialNo
                    });
                } else if (authHeaderApi === 'getBalance') {
                    res.status(201).json({
                        acctInfo: {
                            acctId: acctId,
                            balance: balanceUser,
                            userName: acctId,
                            currency: "THB",
                        },
                        msg: "success",
                        code: 0,
                        serialNo: serialNo
                    });
                } else {
                    const transferId = req.body.transferId;
                    const currency = req.body.currency;
                    const amounts = req.body.amount;
                    const type = req.body.type;
                    const ticketId = req.body.ticketId;
                    const channel = req.body.channel;
                    const gameCode = req.body.amount;
                    const serialNo = req.body.type;
                    const referenceId = req.body.ticketId;
                    const specialGame = req.body.channel;
                    const refTicketIds = req.body.refTicketIds;
                    let balanceNow;
                    let postTurnover = results[0].turnover - amounts;
                    if (type === 1) {
                        balanceNow = balanceUser - amounts;
                        const post = {
                            username: acctId, gameid: gameCode, bet: amounts, win: 0, balance_credit: balanceNow, userAgent: userAgent, platform: userAgent, trans_id: transferId
                        }
                        let repost = repostGame.uploadLogRepostGameAsk(post)
                        if (postTurnover < 0) postTurnover = 0;
                    } else if (type === 2) {
                        balanceNow = balanceUser + amounts;
                        const post = {
                            username: acctId, gameid: gameCode, bet: 0, win: amounts, balance_credit: balanceNow, userAgent: userAgent, platform: userAgent, trans_id: transferId
                        }
                        let repost = repostGame.uploadLogRepostGameAsk(post)
                        if (postTurnover < 0) postTurnover = 0;
                    } else if (type === 4) {
                        balanceNow = balanceUser - amounts;
                        if (postTurnover < 0) postTurnover = 0;
                    } else {
                        balanceNow = balanceUser + amounts;
                        if (postTurnover < 0) postTurnover = 0;
                    }
                    const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${amounts}', turnover='${postTurnover}'
                    WHERE phonenumber ='${acctId}'`;
                    connection.query(sql_update, (error, resultsGame) => {
                        res.status(201).json({
                            transferId: transferId,
                            merchantTxId: serialNo,
                            acctId: acctId,
                            balance: balanceNow,
                            msg: "success",
                            code: 0,
                            serialNo: serialNo
                        });
                    });
                }
            }
        })
    } catch (err) {
        err.statusCode = 500;
        res.json({ status: "Not Data Request Body." });
    }
};