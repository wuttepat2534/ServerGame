const { response } = require("express");
const mysql = require('mysql2') //npm install mysql2
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
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

http://localhost:5000/post/checkBalance 
exports.checkBalance = async (req, res) => {
  const id = req.body.id;
  const timestampMillis = req.body.timestampMillis;
  const productId = req.body.productId;
  const currency = req.body.currency;
  const authHeader = req.body.sessionToken;
  const usernameGame = req.body.username;

  username = 'member001';

  if (!authHeader) {
    const error = new Error('Not authenticated!');
    error.statusCode = 500;
  }

  let spl = `SELECT credit FROM member WHERE username ='${usernameGame}' AND status_delete='N' 
  ORDER BY member_code ASC`;
  try {
    connection.query(spl, (error, results) => {
      if (error) { console.log(error) }
      else {
        const timestamp = parseInt(timestampMillis);
        const balanceUser = parseFloat(results[0].credit);
        res.status(201).json({
          id: id,
          statusCode: 0,
          timestampMillis: timestamp,
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

http://localhost:5000/post/settleBets 
exports.settleBets = async (req, res) => {
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
        const timestamp = parseInt(timestampMillis);
        const balanceUser = parseFloat(results[0].credit);
        const betPlay = txnsGame[0].betAmount;
        const betPlayOut = txnsGame[0].payoutAmount;
        const balanceNow = balanceUser - betPlay + betPlayOut;
        const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${betPlay}' WHERE phonenumber ='${usernameGame}'`;

        connection.query(sql_update, (error, resultsGame) => {
          if (error) { console.log(error) }
          else {
            res.status(201).json({
              id: id,
              statusCode: 0,
              timestampMillis: timestamp,
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

//SlotXO-------------------------------------------------------------------------------------------------------------------------------------------------------------------
http://localhost:5000/post/authenticate-token 
exports.authenticate = async (req, res) => {
  const authHeader = req.body.token;
  const ip = req.body.ip;
  const timestamp = req.body.timestamp;
  let username = '0990825941';
  console.log(authHeader)
  let spl = `SELECT credit FROM member WHERE phonenumber ='${username}' AND status_delete='N' 
  ORDER BY member_code ASC`;
  try {
    connection.query(spl, (error, results) => {
      if (error) { console.log(error) }
      else {
        const balanceUser = parseFloat(results[0].credit);
        res.status(201).json({
          Status: 0,
          Message: "Success",
          Username: "victest2",
          Balance: 10000
        });
      }
    })
  } catch (err) {
    err.statusCode = 500;
    res.json({ status: "Not Data Request Body." });
  }
};

http://localhost:5000/post/balance 
exports.balanceXO = async (req, res) => {
  const timestamp = req.body.timestamp;
  const usernameGame = req.body.username;
  username = 'member001';
  let spl = `SELECT credit FROM member WHERE phonenumber ='${usernameGame}' AND status_delete='N'`;
  try {
    connection.query(spl, (error, results) => {
      if (error) { console.log(error) }
      else {
        const balanceUser = parseFloat(results[0].credit);
        res.status(201).json({
          Status: 0,
          Message: "Success",
          Username: usernameGame,
          Balance: balanceUser
        });
      }
    })
  } catch (err) {
    err.statusCode = 500;
    res.json({ status: "Not Data Request Body." });
  }
};

http://localhost:5000/post/bet 
exports.PlaceBetSlotXo = async (req, res) => {
  const id = req.body.id;
  const amount = req.body.amount;
  const timestamp = req.body.timestamp;
  const roundid = req.body.roundid;
  const usernameGame = req.body.username;
  const gamecode = req.body.gamecode;
  username = 'member001';

  let spl = `SELECT credit, turnover FROM member WHERE phonenumber ='${usernameGame}' AND status_delete='N'`;
  try {
    connection.query(spl, (error, results) => {
      if (error) { console.log(error) }
      else {
        const balanceUser = parseFloat(results[0].credit);
        const balanceNow = balanceUser - amount;
        let postTurnover = results[0].turnover - amount;
        if (postTurnover < 0) { postTurnover = 0; }

        const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${amount}', turnover='${postTurnover}'
        WHERE phonenumber ='${usernameGame}'`;
        connection.query(sql_update, (error, resultsGame) => {
          if (error) { console.log(error) }
          else {
            res.status(201).json({
              Status: 0,
              Message: "Success",
              Username: usernameGame,
              Balance: balanceNow
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

http://localhost:5000/post/settle-bet 
exports.SettlePlaySlotXo = async (req, res) => {
  const amount = req.body.amount;
  const usernameGame = req.body.username;
  username = 'member001';

  let spl = `SELECT credit FROM member WHERE phonenumber ='${usernameGame}' AND status_delete='N'`;
  try {
    connection.query(spl, (error, results) => {
      if (error) { console.log(error) }
      else {
        const balanceUser = parseFloat(results[0].credit);
        const balanceNow = balanceUser + amount;
        const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${amount}' WHERE phonenumber ='${usernameGame}'`;
        connection.query(sql_update, (error, resultsGame) => {
          if (error) { console.log(error) }
          else {
            res.status(201).json({
              Status: 0,
              Message: "Success",
              Username: usernameGame,
              Balance: balanceNow
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

http://localhost:5000/post/cancel-bet
exports.CancelPlaySlotXo = async (req, res) => {
  const usernameGame = req.body.username;
  username = 'member001';

  let spl = `SELECT credit FROM member WHERE phonenumber ='${usernameGame}' AND status_delete='N'`;
  try {
    connection.query(spl, (error, results) => {
      if (error) { console.log(error) }
      else {
        const balanceUser = parseFloat(results[0].credit);
        connection.query(sql_update, (error, resultsGame) => {
          if (error) { console.log(error) }
          else {
            res.status(201).json({
              Status: 0,
              Message: "Success",
              Username: usernameGame,
              Balance: balanceUser
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

http://localhost:5000/post/bonus-win
exports.bonusPlaySlotXo = async (req, res) => {
  const amount = req.body.amount;
  const usernameGame = req.body.username;
  username = 'member001';

  let spl = `SELECT credit FROM member WHERE phonenumber ='${usernameGame}' AND status_delete='N'`;
  try {
    connection.query(spl, (error, results) => {
      if (error) { console.log(error) }
      else {
        const balanceUser = parseFloat(results[0].credit);
        const balanceNow = balanceUser + amount;
        const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${amount}' WHERE phonenumber ='${usernameGame}'`;
        connection.query(sql_update, (error, resultsGame) => {
          if (error) { console.log(error) }
          else {
            res.status(201).json({
              Status: 0,
              Message: "Success",
              Username: usernameGame,
              Balance: balanceNow
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

http://localhost:5000/post/jackpot-win
exports.JackpotPlaySlotXo = async (req, res) => {
  const amount = req.body.amount;
  const usernameGame = req.body.username;
  username = 'member001';

  let spl = `SELECT credit FROM member WHERE phonenumber ='${usernameGame}' AND status_delete='N'`;
  try {
    connection.query(spl, (error, results) => {
      if (error) { console.log(error) }
      else {
        const balanceUser = parseFloat(results[0].credit);
        const balanceNow = balanceUser + amount;
        const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${amount}' WHERE username ='${usernameGame}'`;
        connection.query(sql_update, (error, resultsGame) => {
          if (error) { console.log(error) }
          else {
            res.status(201).json({
              Status: 0,
              Message: "Success",
              Username: usernameGame,
              Balance: balanceNow
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

http://localhost:5000/post/transaction
exports.TransactionSlotXo = async (req, res) => {
  const amount = req.body.amount;
  const usernameGame = req.body.username;
  username = 'member001';

  let spl = `SELECT credit FROM member WHERE phonenumber ='${usernameGame}' AND status_delete='N'`;
  try {
    connection.query(spl, (error, results) => {
      if (error) { console.log(error) }
      else {
        const balanceUser = parseFloat(results[0].credit);
        const balanceNow = balanceUser + amount;
        const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${amount}' WHERE phonenumber ='${usernameGame}'`;
        connection.query(sql_update, (error, resultsGame) => {
          if (error) { console.log(error) }
          else {
            res.status(201).json({
              Status: 0,
              Message: "Success",
              Username: usernameGame,
              Balance: balanceNow
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

http://localhost:5000/post/withdraw
exports.WithdrawSlotXo = async (req, res) => {
  const amount = req.body.amount;
  const usernameGame = req.body.username;
  username = 'member001';

  let spl = `SELECT credit FROM member WHERE phonenumber ='${usernameGame}' AND status_delete='N'`;
  try {
    connection.query(spl, (error, results) => {
      if (error) { console.log(error) }
      else {
        const balanceUser = parseFloat(results[0].credit);
        const balanceNow = balanceUser - amount;
        const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${0}' WHERE phonenumber ='${usernameGame}'`;
        connection.query(sql_update, (error, resultsGame) => {
          if (error) { console.log(error) }
          else {
            res.status(201).json({
              Status: 0,
              Message: "Success",
              Username: usernameGame,
              Balance: balanceNow
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

http://localhost:5000/post/deposit
exports.DepositSlotXo = async (req, res) => {
  const amount = req.body.amount;
  const usernameGame = req.body.username;
  username = 'member001';

  let spl = `SELECT credit FROM member WHERE phonenumber ='${usernameGame}' AND status_delete='N'`;
  try {
    connection.query(spl, (error, results) => {
      if (error) { console.log(error) }
      else {
        const balanceUser = parseFloat(results[0].credit);
        const balanceNow = balanceUser + amount;
        const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${0}' WHERE phonenumber ='${usernameGame}'`;
        connection.query(sql_update, (error, resultsGame) => {
          if (error) { console.log(error) }
          else {
            res.status(201).json({
              Status: 0,
              Message: "Success",
              Username: usernameGame,
              Balance: balanceNow
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

http://localhost:5000/post/authenticate
exports.MobileauthenticateXoJo = async (req, res) => {
  const password = req.body.password;
  const ip = req.body.ip;
  const timestamp = req.body.timestamp;
  const userUsername = username
  let username = 'member001';
  const token = jwt.sign(
    {
      userUsername: userUsername,
      password: password,
      timestamp: timestamp,
      ip: ip
    },
    'secretfortoken',
    { expiresIn: '48h' }
  );
  let spl = `SELECT credit FROM member WHERE phonenumber ='${userUsername}' AND status_delete='N'`;
  try {
    connection.query(spl, (error, results) => {
      if (error) { console.log(error) }
      else {
        const balanceUser = parseFloat(results[0].credit);
        res.status(201).json({
          Status: 0,
          Token: token,
          Balance: balanceUser,
          Message: "Success",
        });
      }
    })
  } catch (err) {
    err.statusCode = 500;
    res.json({ status: "Not Data Request Body." });
  }
};

http://localhost:5000/post/seamless/getAppUsername
exports.GetMobileauthenticateXoJo = async (req, res) => {
  const productId = req.body.productId;
  const password = req.body.password;
  const userUsername = req.body.username
  let username = 'member001';
  let spl = `SELECT credit FROM member WHERE phonenumber ='${userUsername}' AND status_delete='N'`;
  try {
    connection.query(spl, (error, results) => {
      if (error) { console.log(error) }
      else {
        const balanceUser = parseFloat(results[0].credit);
        res.status(201).json({
          reqId: "f47e5065-412c-40d1-9e4c-f6c248919509",
          code: 0,
          message: "Success",
          data: {
            applicationUsername: "TFY1.001CJE2WC"
          }
        });
      }
    })
  } catch (err) {
    err.statusCode = 500;
    res.json({ status: "Not Data Request Body." });
  }
};

//Askmebet-------------------------------------------------------------------------------------------------------------------------------------------------------------

http://localhost:5000/post/api/wallet/balance
exports.GetBalanceAsk = async (req, res) => {
  const agent = req.body.agent;
  const account = req.body.account;
  const authHeader = req.body.token;
  username = 'member001';

  let spl = `SELECT credit FROM member WHERE phonenumber ='${account}' AND status_delete='N'`;
  try {
    connection.query(spl, (error, results) => {
      if (error) { console.log(error) }
      else {
        const balanceUser = parseFloat(results[0].credit);
        res.status(201).json({
          "status": 1,
          "balance": balanceUser
        });
      }
    })
  } catch (err) {
    err.statusCode = 500;
    res.json({ status: "Not Data Request Body." });
  }
};

http://localhost:5000/post/api/wallet/bet
exports.PlaceBetAsk = async (req, res) => {
  const trans_id = req.body.trans_id;
  const agent = req.body.agent;
  const account = req.body.account;
  const game_id = req.body.game_id;
  const amount = req.body.amount;
  const authHeader = req.body.token;
  username = 'member001';
  //console.log(trans_id);
  let spl = `SELECT credit, turnover FROM member WHERE phonenumber ='${account}' AND status_delete='N'`;
  try {
    connection.query(spl, (error, results) => {
      if (error) { console.log(error) }
      else {
        const balanceUser = parseFloat(results[0].credit);
        const balanceNow = balanceUser - amount;

        const userAgent = req.headers['user-agent'];
        const isMobile = /Mobile|Android/.test(userAgent);
        let platform = 'mobile';
        if (isMobile) {
          platform = 'mobile';
        } else {
          platform = 'computer pc';
        }

        const post = {
          username: account, gameid: game_id, bet: amount, win: amount, balance_credit: balanceNow, userAgent: userAgent, platform: platform, trans_id: trans_id
        }
        let repost = repostGame.uploadLogRepostGameAsk(post)

        let postTurnover = results[0].turnover - amount;
        if (postTurnover < 0) {
          postTurnover = 0;
        }

        const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${amount}', turnover='${postTurnover}'
        WHERE phonenumber ='${account}'`;
        connection.query(sql_update, (error, resultsGame) => {
          if (error) { console.log(error) }
          else {
            res.status(201).json({
              status: 1,
              trans_id: trans_id,
              balance: balanceNow
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

http://localhost:5000/post/api/wallet/payout
exports.SettleBetAsk = async (req, res) => {
  const trans_id = req.body.trans_id;
  const agent = req.body.agent;
  const account = req.body.account;
  const game_id = req.body.game_id;
  const amount = req.body.amount;
  const authHeader = req.body.token;
  const userAgent = req.headers['user-agent'];
  const userAgentt = req.useragent;
  username = 'member001';
  let spl = `SELECT credit FROM member WHERE phonenumber ='${account}' AND status_delete='N'`;
  try {
    connection.query(spl, (error, results) => {
      if (error) { console.log(error) }
      else {
        const balanceUser = parseFloat(results[0].credit);
        const balanceNow = balanceUser + amount;
        const post = {
          username: account, gameid: game_id, bet: 0, win: amount, balance_credit: balanceNow, userAgent: userAgent, platform: userAgentt, trans_id: trans_id
        }
        let repost = repostGame.uploadLogRepostGameAsk(post)

        const sql_update = `UPDATE member set credit='${balanceNow}',bet_latest='${0}' WHERE phonenumber ='${account}'`;
        connection.query(sql_update, (error, resultsGame) => {
          if (error) { console.log(error) }
          else {
            res.status(201).json({
              status: 1,
              trans_id: trans_id,
              balance: balanceNow
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

http://localhost:5000/post/api/wallet/cancel
exports.CancelBetAsk = async (req, res) => {
  const trans_id = req.body.trans_id;
  const agent = req.body.agent;
  const account = req.body.account;
  const game_id = req.body.game_id;
  username = 'member001';

  let spl = `SELECT credit FROM member WHERE phonenumber ='${account}' AND status_delete='N'`;
  try {
    connection.query(spl, (error, results) => {
      if (error) { console.log(error) }
      else {
        const balanceUser = parseFloat(results[0].credit);
        res.status(201).json({
          status: 1,
          trans_id: trans_id,
          balance: balanceUser
        });
      }
    })
  } catch (err) {
    err.statusCode = 500;
    res.json({ status: "Not Data Request Body." });
  }
};

//JILI Seamless Integration APIs

http://localhost:5000/post/Jili/auth
exports.PlayerAuthenticationJili = async (req, res) => {
  const reqId = req.body.reqId;
  const authHeader = req.body.token;
  username = 'member001';

  let spl = `SELECT credit FROM member WHERE phonenumber ='${username}' AND status_delete='N'`;
  try {
    connection.query(spl, (error, results) => {
      if (error) { console.log(error) }
      else {
        const balanceUser = parseFloat(results[0].credit);
        res.status(201).json({
          errorCode: 0,
          message: "success",
          username: "victest2",
          currency: "THB",
          balance: balanceUser,
          token: authHeader
        });
      }
    })
  } catch (err) {
    err.statusCode = 500;
    res.json({ status: "Not Data Request Body." });
  }
};

http://localhost:5000/post/Jili/bet
exports.PlayerBetJili = async (req, res) => {
  const reqId = req.body.reqId;
  const authHeader = req.body.token;
  const round = req.body.round;
  username = 'member001';

  let spl = `SELECT credit FROM member WHERE phonenumber ='${username}' AND status_delete='N'`;
  try {
    connection.query(spl, (error, results) => {
      if (error) { console.log(error) }
      else {
        const balanceUser = parseFloat(results[0].credit);
        res.status(201).json({
          errorCode: 0,
          message: "success",
          username: "victest2",
          currency: "THB",
          balance: balanceUser,
          txId: round,
          token: authHeader
        });
      }
    })
  } catch (err) {
    err.statusCode = 500;
    res.json({ status: "Not Data Request Body." });
  }
};

http://localhost:5000/post/Jili/cancelBet
exports.CancelBetJili = async (req, res) => {
  const reqId = req.body.reqId;
  const authHeader = req.body.token;
  const round = req.body.round;
  username = 'member001';

  let spl = `SELECT credit FROM member WHERE phonenumber ='${username}' AND status_delete='N'`;
  try {
    connection.query(spl, (error, results) => {
      if (error) { console.log(error) }
      else {
        const balanceUser = parseFloat(results[0].credit);
        res.status(201).json({
          errorCode: 0,
          message: "Success",
          username: "victest2",
          currency: "THB",
          balance: balanceUser,
          txId: round,
        });
      }
    })
  } catch (err) {
    err.statusCode = 500;
    res.json({ status: "Not Data Request Body." });
  }
};