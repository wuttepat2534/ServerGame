const express = require('express');
const { response } = require("express");
const mysql = require('mysql2') //npm install mysql2
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
const os = require('os');
const md5 = require('md5');
const multer = require('multer');
const upload = multer({ dest: 'uploads/' });

const app = express();
app.use(express.static('public'));
require('dotenv').config()

const connection = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    database: process.env.DB_DATABASE,
    password: process.env.DB_PASSWORD
});

module.exports = class Post {
    constructor(email, password, role) {
        this.email = email;
        this.password = password;
        this.role = role;
    }

    static uploadLogRepostGame(post) {

        let browser;
        if (post.userAgent.includes('Chrome')) {
            browser = 'Google Chrome';
        } else if (post.userAgent.indexOf('Firefox') > -1) {
            browser = 'Mozilla Firefox';
        } else if (post.userAgent.indexOf('Safari') > -1) {
            browser = 'Apple Safari';
        } else if (post.userAgent.indexOf('Opera') > -1) {
            browser = 'Opera';
        } else if (post.userAgent.indexOf('Edg') > -1) {
            browser = 'Microsoft Edge';
        } else if (post.userAgent.indexOf('Trident') > -1) {
            browser = 'Microsoft Internet Explorer';
        }
        else {
            browser = 'Google Chrome';
        }
        const isMobile = /Mobile|Android/.test(post.userAgent);
        let platform = 'Mobile';
        if (isMobile) {
            platform = 'Mobile';
        } else {
            platform = 'PC';
        }

        const sql = `SELECT * FROM member WHERE username = ?`;
        connection.query(sql, [post.username], (error, result) => {
            try {
                if (error) { console.log(error) }
                else {
                    let turnoverrepostfun = turnoverrepost(post)
                    let datausername = result[0];
                    let sql_before = `INSERT INTO repostgame (iduser, username, gameid, bet, win, balance_credit, get_browser, platform, created_atdate, created_attime) value 
              ('${datausername.id}','${post.username}','${post.gameid}','${post.bet}','${post.win}','${post.balance_credit}','${browser}','${platform}',now(), now())`;
                    connection.query(sql_before, (error, resultAfter) => {
                        if (error) { console.log(error); }
                        return 'OK';
                    });
                }

            } catch (err) {
                if (!err.statusCode) {
                    err.statusCode = 500;
                }
            }
        });
    }

    static uploadLogRepostGameAsk(post) {
        let browser;
        if (post.userAgent.includes('Chrome')) {
            browser = 'Google Chrome';
        } else if (post.userAgent.indexOf('Firefox') > -1) {
            browser = 'Mozilla Firefox';
        } else if (post.userAgent.indexOf('Safari') > -1) {
            browser = 'Apple Safari';
        } else if (post.userAgent.indexOf('Opera') > -1) {
            browser = 'Opera';
        } else if (post.userAgent.indexOf('Edg') > -1) {
            browser = 'Microsoft Edge';
        } else if (post.userAgent.indexOf('Trident') > -1) {
            browser = 'Microsoft Internet Explorer';
        }
        else {
            browser = 'Google Chrome';
        }

        const isMobile = /Mobile|Android/.test(post.userAgent);
        let platform = 'Mobile';
        if (isMobile) {
            platform = 'Mobile';
        } else {
            platform = 'PC';
        }

        const sql = `SELECT * FROM member WHERE username = ?`;
        connection.query(sql, [post.username], (error, result) => {
            try {
                if (error) { console.log(error) }
                else {
                    let datausername = result[0];
                    const sql = `SELECT * FROM repostgame WHERE trans_id = ?`;
                    connection.query(sql, [post.trans_id], (error, resulttransID) => {
                        if (error) { console.log(error) }
                        else {
                            console.log(resulttransID.length);
                            if (resulttransID.length !== 0) {
                                let turnoverrepostfun = turnoverrepost(post)
                                let sql = `UPDATE repostgame set  win = '${post.win}', balance_credit = '${post.balance_credit}' WHERE trans_id = "${post.trans_id}"`;
                                connection.query(sql, (error, resultAfter) => {
                                    if (error) { console.log(error); }
                                    return 'OK';
                                });
                            } else {
                                let sql_before = `INSERT INTO repostgame (iduser, username, gameid, bet, win, balance_credit, get_browser, platform, trans_id, created_atdate, created_attime) value 
                                ('${datausername.id}','${post.username}','${post.gameid}','${post.bet}','${0}','${post.balance_credit}','${browser}','${platform}','${post.trans_id}',now(), now())`;
                                connection.query(sql_before, (error, resultAfter) => {
                                    if (error) { console.log(error); }
                                    return 'OK';
                                });
                            }
                        }
                    })

                }

            } catch (err) {
                if (!err.statusCode) {
                    err.statusCode = 500;
                }
            }
        });
    }

    /*--------------------------------------------------------------------------------- reports Game All*/
    static async valuewinbet(post) {
        return new Promise((resolve, reject) => {
            let sql = `SELECT * FROM repostgame WHERE created_atdate >='${post.startdate}' AND created_atdate <= '${post.endDate}'`;
            connection.query(sql, (error, results) => {
                if (error) {
                    console.log(error);
                    reject(error);
                } else {
                    if (results.length !== 0) {
                        let betvalue = 0;
                        let winvalue = 0;
                        for (let i = 0; i < results.length; i++) {
                            betvalue += results[i].bet;
                            winvalue += results[i].win;
                        }
                        let jsArray = { "bet": betvalue, "win": winvalue };
                        resolve(jsArray);
                    } else {
                        let jsArray = { "bet": 0, "win": 0 };
                        resolve(jsArray);
                    }
                }
            });
        });
    }

    static async valuedailyRegisterMamber(post) {
        return new Promise((resolve, reject) => {
            let sql = `SELECT * FROM member WHERE created_at >='${post.startdate}' AND created_at <= '${post.endDate}'`;
            connection.query(sql, (error, results) => {
                if (error) {
                    console.log(error);
                    reject(error);
                } else {
                    const totalCount = `SELECT COUNT(*) as count FROM member`
                    connection.query(totalCount, (error, res) => {
                        let value = results.length;
                        let total = res[0].count
                        let jsArray = { "membervalue": value, "allmember": total };
                        resolve(jsArray);
                    })
                }
            });
        });
    }

    static async valuedailyFinanceDeposit(post) {
        return new Promise((resolve, reject) => {
            let sql = `SELECT * FROM logfinanceuser WHERE tpyefinance = 'ฝาก' AND transaction_date >='${post.startdate}' AND transaction_date <= '${post.endDate}'`;
            connection.query(sql, (error, results) => {
                if (error) {
                    console.log(error);
                    reject(error);
                } else {
                    if (results.length !== 0) {
                        let depositvalue = 0;
                        for (let i = 0; i < results.length; i++) {
                            depositvalue += results[i].quantity;
                        }
                        let jsArray = { "depositvalut": depositvalue };
                        resolve(jsArray);
                    } else {
                        let jsArray = { "depositvalut": 0 };
                        resolve(jsArray);
                    }
                }
            });
        });
    }

    static async valuedailyFinanceWithdraw(post) {
        return new Promise((resolve, reject) => {
            let sql = `SELECT * FROM logfinanceuser WHERE tpyefinance = 'ถอน' AND transaction_date >='${post.startdate}' AND transaction_date <= '${post.endDate}'`;
            connection.query(sql, (error, results) => {
                if (error) {
                    console.log(error);
                    reject(error);
                } else {
                    if (results.length !== 0) {
                        let withdrawvalue = 0;
                        for (let i = 0; i < results.length; i++) {
                            withdrawvalue += results[i].quantity;
                        }
                        let jsArray = { "withdrawvalue": withdrawvalue };
                        resolve(jsArray);
                    } else {
                        let jsArray = { "withdrawvalue": 0 };
                        resolve(jsArray);
                    }
                }
            });
        });
    }

    static async valuedailyFinanceDepositTotal() {
        return new Promise((resolve, reject) => {
            let sql = `SELECT * FROM logfinanceuser WHERE tpyefinance = 'ฝาก'`;
            connection.query(sql, (error, results) => {
                if (error) {
                    console.log(error);
                    reject(error);
                } else {
                    if (results.length !== 0) {
                        let depositvalueTolal = 0;
                        for (let i = 0; i < results.length; i++) {
                            depositvalueTolal += results[i].quantity;
                        }
                        let jsArray = { "depositvalutTotal": depositvalueTolal };
                        resolve(jsArray);
                    } else {
                        let jsArray = { "depositvalutTotal": 0 };
                        resolve(jsArray);
                    }
                }
            });
        });
    }

    static async valuedailyFinanceWithdrawTotal() {
        return new Promise((resolve, reject) => {
            let sql = `SELECT * FROM logfinanceuser WHERE tpyefinance = 'ถอน'`;
            connection.query(sql, (error, results) => {
                if (error) {
                    console.log(error);
                    reject(error);
                } else {
                    if (results.length !== 0) {
                        let withdrawvalueTotal = 0;
                        for (let i = 0; i < results.length; i++) {
                            withdrawvalueTotal += results[i].quantity;
                        }
                        let jsArray = { "withdrawvalueTotal": withdrawvalueTotal };
                        resolve(jsArray);
                    } else {
                        let jsArray = { "withdrawvalueTotal": 0 };
                        resolve(jsArray);
                    }
                }
            });
        });
    }

    static async topwit(post) {
        return new Promise((resolve, reject) => {
            const sql = 'SELECT * FROM totalturnoverrepost WHERE created_atdate = ? ORDER BY win DESC LIMIT 20';
            connection.query(sql, [post.startdate], (err, results) => {
                if (error) {
                    console.log(error);
                    reject(error);
                } else {
                    if (results.length !== 0) {
                        results.forEach((row, index) => {
                            //console.log(`${index + 1}. Account: ${row.username}, Balance: ${row.win}`);
                            let jsArray = { "topwit": row };
                            resolve(jsArray);
                        });
                    } else {
                        let jsArray = { "topwit": "วันนี้ยังไม่มีผู้เล่น" };
                        resolve(jsArray);
                    }
                }
            });
        });
    }

    static async toplose() {
        return new Promise((resolve, reject) => {
            const sql = 'SELECT * FROM totalturnoverrepost WHERE created_atdate = ? ORDER BY lose DESC LIMIT 20';
            connection.query(sql, [post.startdate], (err, results) => {
                if (error) {
                    console.log(error);
                    reject(error);
                } else {
                    if (results.length !== 0) {
                        results.forEach((row, index) => {
                            let jsArray = { "toplose": row };
                            resolve(jsArray);
                        });
                    } else {
                        let jsArray = { "toplose": "วันนี้ยังไม่มีผู้เล่น" };
                        resolve(jsArray);
                    }
                }
            });
        });
    }

    static async topturnover() {
        return new Promise((resolve, reject) => {
            const sql = 'SELECT * FROM totalturnoverrepost WHERE created_atdate = ? ORDER BY turnover DESC LIMIT 20';
            connection.query(sql, [post.startdate], (err, results) => {
                if (error) {
                    console.log(error);
                    reject(error);
                } else {
                    if (results.length !== 0) {
                        results.forEach((row, index) => {
                            let jsArray = { "topturnover": row };
                            resolve(jsArray);
                        });
                    } else {
                        let jsArray = { "topturnover": "วันนี้ยังไม่มีผู้เล่น" };
                        resolve(jsArray);
                    }
                }
            });
        });
    }
    /*--------------------------------------------------------------------------------- reports Game All End*/
};

function turnoverrepost(post) {
    const floatwit = parseFloat(post.win).toFixed(2);
    const floatbet = parseFloat(rpost.bet).toFixed(2);
    const lose = floatbet - floatwit;
    let total = totalTurnoverrepost(post);
    let totlgameCamp = gamecamptotal(post);
    const today = new Date();
    const date = today.toISOString().slice(0, 10);
    console.log(floatwit, floatbet);
    let sql = `SELECT * FROM turnoverrepost WHERE day = '${date}' AND usernameuser = '${post.username}' AND gamecamp = '${post.gameid}'`;
    connection.query(sql, (error, results) => {
        if (error) {
            console.log(error);
            reject(error);
        } else {
            console.log(date);
            if (results.length > 0) {
                const numberWin = floatwit + results[0].win;
                const turnover = floatbet + results[0].turnover;
                const numberlose = lose + results[0].lose;

                let sql = `UPDATE turnoverrepost set  turnover = '${turnover}',  win = '${numberWin}', lose = '${numberlose}' 
                WHERE day = '${date}' AND usernameuser = '${post.username}' AND gamecamp = '${post.gameid}'`;
                connection.query(sql, (error, resultAfter) => {
                    if (error) { console.log(error); }
                    return 'OK';
                });
            } else {
                let sql_before = `INSERT INTO turnoverrepost (usernameuser, gamecamp, turnover, win, lose, day) value 
                ('${post.username}','${post.gameid}','${floatbet}','${floatwit}','${lose}', now())`;
                connection.query(sql_before, (error, resultAfter) => {
                    if (error) { console.log(error); }
                    return 'OK';
                });
            }
        }
    })
}

function totalTurnoverrepost(post) {
    const floatwit = parseFloat(post.win).toFixed(2);
    const floatbet = parseFloat(rpost.bet).toFixed(2);
    const lose = floatbet - floatwit;
    const today = new Date();
    const date = today.toISOString().slice(0, 10);
    let sql = `SELECT * FROM totalturnoverrepost WHERE day = '${date}' AND usernameuser = '${post.username}'`;
    connection.query(sql, (error, results) => {
        if (error) {
            console.log(error);
            reject(error);
        } else {
            if (results.length > 0) {
                const numberWin = floatwit + results[0].win;
                const turnover = floatbet + results[0].turnover;
                const numberlose = lose + results[0].lose;

                let sql = `UPDATE totalturnoverrepost set  turnover = '${turnover}',  win = '${numberWin}', lose = '${numberlose}' 
                WHERE day = '${date}' AND usernameuser = '${post.username}'`;
                connection.query(sql, (error, resultAfter) => {
                    if (error) { console.log(error); }
                    return 'OK';
                });
            } else {
                let sql_before = `INSERT INTO totalturnoverrepost (	usernameuser, turnover, win, lose, day) value 
                ('${post.username}','${floatbet}','${floatwit}','${lose}', now())`;
                connection.query(sql_before, (error, resultAfter) => {
                    if (error) { console.log(error); }
                    return 'OK';
                });
            }
        }
    })
}

function gamecamptotal(post) {
    const floatwit = parseFloat(post.win).toFixed(2);
    const floatbet = parseFloat(rpost.bet).toFixed(2);
    const lose = floatbet - floatwit;
    const today = new Date();
    const date = today.toISOString().slice(0, 10);
    let sql = `SELECT * FROM gamecamptotal WHERE day = '${date}' AND namegamecamp = '${post.gameid}'`;
    connection.query(sql, (error, results) => {
        if (error) {
            console.log(error);
            reject(error);
        } else {
            if (results.length > 0) {
                const numberWin = floatwit + results[0].win;
                const turnover = floatbet + results[0].turnover;
                const numberlose = lose + results[0].lose;

                let sql = `UPDATE gamecamptotal set grossComm = '${0.00}', turnover = '${turnover}',  win = '${numberWin}', lose = '${numberlose}', commmember = '${0.00}', totalmamber = '${0.00}',
                w_l_agent = '${0.00}', comm_agent = '${0.00}', tatal_agent = '${0.00}', w_l_commny = '${0.00}', comm_commny = '${0.00}', tatal_commny = '${0.00}',
                WHERE day = '${date}' AND namegamecamp = '${post.gameid}'`;
                connection.query(sql, (error, resultAfter) => {
                    if (error) { console.log(error); }
                    return 'OK';
                });
            } else {
                let sql_before = `INSERT INTO gamecamptotal (namegamecamp, grossComm, turnover, win, lose, commmember, totalmamber, w_l_agent, 
                comm_agent, tatal_agent, w_l_commny, comm_commny, tatal_commny, day) value 
                ('${post.gameid}','${0.00}','${floatwit}','${floatwit}','${lose}','${0.00}','${0.00}','${0.00}','${0.00}','${0.00}','${0.00}','${0.00}','${0.00}', now())`;
                connection.query(sql_before, (error, resultAfter) => {
                    if (error) { console.log(error); }
                    return 'OK';
                });
            }
        }
    })
}