const { response } = require("express");
const mysql = require('mysql2') //npm install mysql2
const jwt = require('jsonwebtoken');
const os = require('os');
require('dotenv').config()
const useragent = require('express-useragent')

const repostGame = require('./repostGame')

const connection = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    database: process.env.DB_DATABASE,
    password: process.env.DB_PASSWORD
});

//Ninja Slot/918 Kiss-------------------------------------------------------------------------------------------------------------------------------------------------------------------

http://localhost:5000/post/Ninja918/transaction  
exports.FishingNinja918 = async (req, res) => {
    const id = req.body.id;
    const productId = req.body.productId;
    const usernames = req.body.username;
    const currency = req.body.currency;
    const timestampMillis = req.body.timestampMillis;
    const txns = req.body.txns;

    //username = 'member001';
    let spl = `SELECT credit FROM member WHERE phonenumber ='${usernames}' AND status_delete='N'`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                if (txns[0].betAmount.playInfo === "FISHING-Transaction") {
                    const amount = txns[0].betAmount - txns[0].payoutAmount
                    const balanceNow = balanceUser + amount;
                    res.status(201).json({
                        id: id,
                        statusCode: 0,
                        productId: productId,
                        timestampMillis: timestampMillis,
                        username: usernames,
                        currency: currency,
                        balanceBefore: balanceUser,
                        balanceAfter: balanceNow
                    });
                } else if (txns[0].betAmount.playInfo === "Fishing-deposit") {
                    const amount = txns[0].betAmount - txns[0].payoutAmount
                    const balanceNow = balanceUser + amount;
                    res.status(201).json({
                        id: id,
                        statusCode: 0,
                        productId: productId,
                        timestampMillis: timestampMillis,
                        username: usernames,
                        currency: currency,
                        balanceBefore: balanceUser,
                        balanceAfter: balanceNow
                    });
                } else {
                    const amount = txns[0].betAmount
                    const balanceNow = balanceUser + amount;
                    res.status(201).json({
                        id: id,
                        statusCode: 0,
                        productId: productId,
                        timestampMillis: timestampMillis,
                        username: usernames,
                        currency: currency,
                        balanceBefore: balanceUser,
                        balanceAfter: balanceNow
                    });
                }
            }
        })
    } catch (err) {
        err.statusCode = 500;
        res.json({ status: "Not Data Request Body." });
    }
};
// -------------------------------------------------------------------------------------------------------------------------------------------------------------------

http://localhost:5000/post/game/checkBalance 
exports.GameCheckBalance = async (req, res) => {
    const id = req.body.id;
    const timestampMillis = req.body.timestampMillis;
    const productId = req.body.productId;
    const currency = req.body.currency;
    const usernameGame = req.body.username;

    console.log('Requested URL:', req.url);
    console.log('Original URL:', req.originalUrl);
    
    let spl = `SELECT credit FROM member WHERE phonenumber ='${usernameGame}' AND status_delete='N'`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                //console.log(results)
                const balanceUser = parseFloat(results[0].credit);
                //console.log(usernameGame, results[0].credit, balanceUser)
                res.status(201).json({
                    id: id,
                    statusCode: 0,
                    timestampMillis: timestampMillis,
                    productId: productId,
                    currency: currency,
                    balance: balanceUser,
                    username: usernameGame
                });
            }
        })
    } catch (err) {
        err.statusCode = 500;
        res.json({ status: "Not Data Request Body." });
    }
};

http://localhost:5000/post/game/placeBets 
exports.GamePlaceBets = async (req, res) => {
    const id = req.body.id;
    const timestampMillis = req.body.timestampMillis;
    const productId = req.body.productId;
    const currency = req.body.currency;
    const usernameGame = req.body.username;
    const txnsGame = req.body.txns;

    let spl = `SELECT credit, turnover FROM member WHERE phonenumber ='${usernameGame}' AND status_delete='N' ORDER BY phonenumber ASC`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                console.log(results)
                const balanceUser = parseFloat(results[0].credit);
                const betPlay = txnsGame[0].betAmount;
                const balanceNow = balanceUser - betPlay;
                if(balanceNow < 0){
                    balanceNow = 0;
                }
                const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${betPlay}' WHERE phonenumber ='${usernameGame}'`;
                connection.query(sql_update, (error, resultsGame) => {
                    if (error) { console.log(error) }
                    else {
                        res.status(201).json({
                            id: id,
                            statusCode: 0,
                            timestampMillis: timestampMillis,
                            productId: productId,
                            currency: currency,
                            balanceBefore: balanceUser,
                            balanceAfter: balanceNow,
                            username: usernameGame
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

http://localhost:5000/post/game/settleBets 
exports.GameSettleBets = async (req, res) => {
    const id = req.body.id;
    const timestampMillis = req.body.timestampMillis;
    const productId = req.body.productId;
    const currency = req.body.currency;
    const usernameGame = req.body.username;
    const txnsGame = req.body.txns;
    const userAgent = req.headers['user-agent'];
    const userAgentt = req.useragent;

    let spl = `SELECT credit, turnover FROM member WHERE phonenumber ='${usernameGame}' AND status_delete='N'`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                const betAmount = txnsGame[0].payoutAmount;
                const betPlay = txnsGame[0].betAmount;
                const balanceNow = (balanceUser - betPlay) + betAmount;
                console.log(betAmount, betPlay)
                let postTurnover = results[0].turnover - betPlay;
                if (postTurnover < 0){
                    postTurnover = 0;
                }
                if(balanceNow < 0){
                    balanceNow = 0;
                }
                const post = {
                    username: usernameGame, gameid: productId, bet: betPlay, win: betAmount, balance_credit: balanceNow, userAgent: userAgent, platform: userAgentt
                }
                let repost = repostGame.uploadLogRepostGame(post)

                const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${betPlay}', turnover='${postTurnover}'
                WHERE phonenumber ='${usernameGame}'`;

                connection.query(sql_update, (error, resultsGame) => {
                    if (error) { console.log(error) }
                    else {
                        res.status(201).json({
                            id: id,
                            statusCode: 0,
                            timestampMillis: timestampMillis,
                            productId: productId,
                            currency: currency,
                            balanceBefore: balanceUser,
                            balanceAfter: balanceNow,
                            username: usernameGame
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

http://localhost:5000/post/game/cancelBets 
exports.GameCancelBets = async (req, res) => {
    const id = req.body.id;
    const timestampMillis = req.body.timestampMillis;
    const productId = req.body.productId;
    const currency = req.body.currency;
    const usernameGame = req.body.username;
    const txnsGame = req.body.txns;
    username = 'member001';
    let spl = `SELECT credit FROM member WHERE phonenumber ='${usernameGame}' AND status_delete='N'`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                const betPlay = txnsGame[0].betAmount;
                const balanceNow = balanceUser + betPlay;
                const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${txnsGame[0].betAmount}' WHERE phonenumber ='${usernameGame}'`;
                connection.query(sql_update, (error, resultsGame) => {
                    if (error) { console.log(error) }
                    else {
                        res.status(201).json({
                            id: id,
                            statusCode: 0,
                            timestampMillis: timestampMillis,
                            productId: productId,
                            currency: currency,
                            balanceBefore: balanceUser,
                            balanceAfter: balanceNow,
                            username: usernameGame
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

http://localhost:5000/post/game/adjustBets 
exports.GameAdjustBets = async (req, res) => {
    const id = req.body.id;
    const timestampMillis = req.body.timestampMillis;
    const productId = req.body.productId;
    const currency = req.body.currency;
    const usernameGame = req.body.username;
    const txnsGame = req.body.txns;
    //username = 'member001';
    let spl = `SELECT credit FROM member WHERE phonenumber ='${usernameGame}' AND status_delete='N'`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                const betPlay = txnsGame[0].betAmount;
                const balanceNow = balanceUser - betPlay;
                const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${txnsGame[0].betAmount}' WHERE phonenumber ='${usernameGame}'`;
                connection.query(sql_update, (error, resultsGame) => {
                    if (error) { console.log(error) }
                    else {
                        res.status(201).json({
                            id: id,
                            statusCode: 0,
                            timestampMillis: timestampMillis,
                            productId: productId,
                            currency: currency,
                            balanceBefore: balanceUser,
                            balanceAfter: balanceNow,
                            username: usernameGame
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

http://localhost:5000/post/game/unsettleBets 
exports.GameUnsettleBets = async (req, res) => {
    const id = req.body.id;
    const timestampMillis = req.body.timestampMillis;
    const productId = req.body.productId;
    const currency = req.body.currency;
    const usernameGame = req.body.username;
    const txnsGame = req.body.txns;
    username = 'member001';
    let spl = `SELECT credit FROM member WHERE phonenumber ='${usernameGame}' AND status_delete='N' 
  ORDER BY member_code ASC`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                res.status(201).json({
                    id: id,
                    statusCode: 0,
                    timestampMillis: timestampMillis,
                    productId: productId,
                    currency: currency,
                    balanceBefore: balanceUser,
                    balanceAfter: balanceUser,
                    username: usernameGame
                });
            }
        })
    } catch (err) {
        err.statusCode = 500;
        res.json({ status: "Not Data Request Body." });
    }
};

http://localhost:5000/post/game/winRewards 
exports.GameWinRewards = async (req, res) => {
    const id = req.body.id;
    const timestampMillis = req.body.timestampMillis;
    const productId = req.body.productId;
    const currency = req.body.currency;
    const usernameGame = req.body.username;
    const txnsGame = req.body.txns;
    username = 'member001';
    let spl = `SELECT credit FROM member WHERE phonenumber ='${usernameGame}' AND status_delete='N'`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                const betPlay = txnsGame[0].betAmount;
                const betpayoutAmount = txnsGame[0].payoutAmount;
                const balanceNow = balanceUser + betpayoutAmount - betPlay;
                const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${betPlay}' WHERE phonenumber ='${usernameGame}'`;
                connection.query(sql_update, (error, resultsGame) => {
                    if (error) { console.log(error) }
                    else {
                        res.status(201).json({
                            id: id,
                            statusCode: 0,
                            timestampMillis: timestampMillis,
                            productId: productId,
                            currency: currency,
                            balanceBefore: balanceUser,
                            balanceAfter: balanceNow,
                            username: usernameGame
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

http://localhost:5000/post/game/placeTips
exports.GamePayTips = async (req, res) => {
    const id = req.body.id;
    const timestampMillis = req.body.timestampMillis;
    const productId = req.body.productId;
    const currency = req.body.currency;
    const usernameGame = req.body.username;
    const txnsGame = req.body.txns;
    username = 'member001';
    let spl = `SELECT credit FROM member WHERE phonenumber ='${usernameGame}' AND status_delete='N'`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                const betPlay = txnsGame[0].betAmount;
                const balanceNow = balanceUser - betPlay;
                const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${betPlay}' WHERE phonenumber ='${usernameGame}'`;
                connection.query(sql_update, (error, resultsGame) => {
                    if (error) { console.log(error) }
                    else {
                        res.status(201).json({
                            id: id,
                            statusCode: 0,
                            timestampMillis: timestampMillis,
                            productId: productId,
                            currency: currency,
                            balanceBefore: balanceUser,
                            balanceAfter: balanceNow,
                            username: usernameGame
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

http://localhost:5000/post/game/cancelTips
exports.GameTipsCancel = async (req, res) => {
    const id = req.body.id;
    const timestampMillis = req.body.timestampMillis;
    const productId = req.body.productId;
    const currency = req.body.currency;
    const usernameGame = req.body.username;
    const txnsGame = req.body.txns;
    username = 'member001';
    let spl = `SELECT credit FROM member WHERE phonenumber ='${usernameGame}' AND status_delete='N'`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                const betPlay = txnsGame[0].betAmount;
                const balanceNow = balanceUser + betPlay;
                const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${betPlay}' WHERE phonenumber ='${usernameGame}'`;
                connection.query(sql_update, (error, resultsGame) => {
                    if (error) { console.log(error) }
                    else {
                        res.status(201).json({
                            id: id,
                            statusCode: 0,
                            timestampMillis: timestampMillis,
                            productId: productId,
                            currency: currency,
                            balanceBefore: balanceUser,
                            balanceAfter: balanceNow,
                            username: usernameGame
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

http://localhost:5000/post/game/voidBets
exports.GameVoidBets = async (req, res) => {
    const id = req.body.id;
    const timestampMillis = req.body.timestampMillis;
    const productId = req.body.productId;
    const currency = req.body.currency;
    const usernameGame = req.body.username;
    const txnsGame = req.body.txns;
    username = 'member001';
    let spl = `SELECT credit FROM member WHERE phonenumber ='${usernameGame}' AND status_delete='N'`;
    try {
        connection.query(spl, (error, results) => {
            if (error) { console.log(error) }
            else {
                const balanceUser = parseFloat(results[0].credit);
                const betPlay = txnsGame[0].betAmount;
                const betpayoutAmount = txnsGame[0].payoutAmount;
                const balanceNow = balanceUser + betpayoutAmount;
                const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${betPlay}' WHERE phonenumber ='${usernameGame}'`;
                connection.query(sql_update, (error, resultsGame) => {
                    if (error) { console.log(error) }
                    else {
                        res.status(201).json({
                            id: id,
                            statusCode: 0,
                            timestampMillis: timestampMillis,
                            productId: productId,
                            currency: currency,
                            balanceBefore: balanceUser,
                            balanceAfter: balanceNow,
                            username: usernameGame
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