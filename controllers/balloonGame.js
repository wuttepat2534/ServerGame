const { response } = require("express");
const mysql = require('mysql2') //npm install mysql2
const jwt = require('jsonwebtoken');
const os = require('os');
const axios = require('axios'); //npm install axios
require('dotenv').config()

const connection = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    database: process.env.DB_DATABASE,
    password: process.env.DB_PASSWORD
});

const crypto = require('crypto');
function generateRandomPassword(length) {
    const charset = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    let password = '';

    for (let i = 0; i < length; i++) {
        const randomIndex = crypto.randomInt(0, charset.length);
        password += charset[randomIndex];
    }

    return password;
}
exports.saveTestGame = async (require, response) => {
    const stateGame = require.params.state;
    const user_id = require.params.user_id;
    const bet = require.params.bet;
    const game_id = require.params.game_id;
    const authHeader = require.body.Authorization;
    const paaswordRound = require.body.paaswordRound;
    const choose = require.params.choose;
    const today = new Date();
    const date = today.toISOString().slice(0, 10);
    console.log(authHeader);
    switch (stateGame) {
        case '0':
            let state_Start = stareOne(authHeader)
                .then(data => {
                    const randomPassword = generateRandomPassword(13);
                    const multipliers = [1.84, 2.76, 3.68, 4.60];
                    const allBalloonId = [0, 1, 2, 3, 4];
                    const idUser = data.id;
                    let sql_insert = `INSERT INTO user_play (member_id, game_id, bet, win, tiles, winline, winstyle, winCount, credit, created_at, game_feespin) 
                 value ('${idUser}','${game_id}','${bet}','${0}','${allBalloonId}','${0}','${randomPassword}','${0}','${data.credit}',now(), '${false}')`;
                    connection.query(sql_insert, (error, result_feesPin) => {
                        if (error) {
                            response.sendStatus(500);
                            return;
                        } else {
                            console.log(data);
                            response.status(200).json({
                                multipliers: multipliers,
                                gameVersion: 1.0,
                                balance: data.credit,
                                paaswordRound: randomPassword,
                                userId: idUser
                            });
                            response.end();
                        }
                    });
                })
                .catch(error => {
                    console.error("Error:", error);
                });
            break;
        case '3':
            const randomPassword = generateRandomPassword(13);
            
            const multipliers = [1.84, 2.76, 3.68, 4.60]
            const allBalloonId = [0, 1, 2, 3, 4]
            let sql_insert = `INSERT INTO user_play (member_id, game_id, bet, win, tiles, winline, winstyle, winCount, credit, created_at, game_feespin) 
                value ('${user_id}','${game_id}','${bet}','${0}','${allBalloonId}','${0}','${randomPassword}','${0}','${0}',now(), '${false}')`;
            connection.query(sql_insert, (error, result_feesPin) => {
                if (error) {
                    response.sendStatus(500);
                    return;
                } else {
                    response.status(200).json({
                        multipliers: multipliers,
                        gameVersion: 1.0,
                        paaswordRound: randomPassword
                    });
                    response.end();
                }
            });
            break;
        case '1':
            let state_delete = DeleteBalloon(paaswordRound)
                .then(data => {
                    const arrayBalloonid = data.allBalloonId;
                    const deleteBalloon = data.deleteBalloonId;
                    response.status(200).json({
                        allBalloonId: arrayBalloonid,
                        deleteBalloonId: deleteBalloon,
                        paaswordRound: paaswordRound
                    });
                    response.end();
                })
                .catch(error => {
                    console.error("Error:", error);
                });
            break;
        case '2':
            let state_shoot = ShootBalloon(user_id, bet, choose, paaswordRound)
                .then(data => {
                    const winBalloonId = data.winBalloonId;
                    const allBalloonId = data.allBalloonId;
                    const isWin = data.isWinUser;
                    const win = data.winGame;
                    const balance = data.balanceNow;

                    response.status(200).json({
                        winBalloonId: winBalloonId,
                        allBalloonId: allBalloonId,
                        isWin: isWin,
                        win: win,
                        balance: balance
                    });
                    response.end();
                })
                .catch(error => {
                    console.error("Error:", error);
                });
            break;
    }
};

async function stareOne(token) {
    try {
        const response = await axios.post("https://relaxtimecafe.fun/post/convertToken", {
            Authorization: token,
        });

        const jsArray = {
            id: response.data.id,
            credit: response.data.credit,
            name: response.data.name,
        };
        return jsArray;
    } catch (error) {
        console.error("Error:", error);
        throw error; // Re-throw the error to handle it elsewhere, if needed
    }
}

async function DeleteBalloon(paaswordRound) {
    return new Promise((resolve, reject) => {
        let sql = `SELECT tiles FROM user_play WHERE winstyle='${paaswordRound}'`;
        connection.query(sql, (error, results) => {
            if (error) {
                response.sendStatus(500);
                return;
            } else {
                const allBalloonId = results[0].tiles;
                const tilesArray = allBalloonId.split(',').map(Number);

                let r = Math.random()//between 0 (inclusive) and 1 (exclusive)
                let rand = Math.floor(r * tilesArray.length);//สุ่ม index ตามจำนวนลูกโป่งที่เหลืออยู่

                deleteBalloonId = tilesArray[rand]//เก็บ id ที่ถูกลบไป
                tilesArray.splice(rand, 1)//remove from array
                const tilesString = tilesArray.join(',');

                const sql_update = `UPDATE user_play set tiles='${tilesString}' WHERE winstyle='${paaswordRound}'`;
                connection.query(sql_update, (error, resultsGame) => {
                    if (error) { console.log(error) }
                    const jsArray = {
                        allBalloonId: tilesArray,
                        deleteBalloonId: deleteBalloonId
                    };
                    resolve(jsArray);
                });
            }
        });
    })

}

function ShootBalloon(userId, bet, choose, paaswordRound) {
    return new Promise((resolve, reject) => {
        let sql_check = `SELECT * FROM member WHERE id ='${userId}' AND status_delete='N'`;
        connection.query(sql_check, (error, results_check) => {
            if (results_check.length > 0) {
                let user_credit = results_check[0].credit;
                let turnover = results_check[0].turnover;
                if (user_credit >= bet) {
                    const multipliers = [1.84, 2.76, 3.68, 4.60]//ตัวคูณตอนชนะ
                    //when shoot
                    let winBalloonId//id ของลูกโป่งที่ชนะ
                    let isWin//ชนะมั้ย
                    let win = 0//เงินที่ชนะในรอบนี้

                    user_credit -= bet//หักเงิน

                    let postTurnover = turnover -= bet;

                    if (postTurnover < 0) {
                        postTurnover = 0;
                    }

                    let sql = `SELECT tiles FROM user_play WHERE winstyle='${paaswordRound}'`;
                    connection.query(sql, (error, results) => {
                        if (error) {
                            response.sendStatus(500);
                            return;
                        } else {
                            const allBalloonId = results[0].tiles;
                            const tilesArray = allBalloonId.split(',').map(Number);

                            let r = Math.random()//between 0 (inclusive) and 1 (exclusive)
                            let rand = Math.floor(r * tilesArray.length);//สุ่ม index ตามจำนวนลูกโป่งที่เหลืออยู่

                            winBalloonId = tilesArray[rand]//เก็บ id ที่ชนะไว้
                            tilesArray.splice(rand, 1)//remove from array
                            const tilesString = tilesArray.join(',');
                            const num = parseInt(choose, 10);
                            //console.log(winBalloonId , num)
                            if (winBalloonId === num) {
                                win = bet * multipliers[tilesArray.length - 2];//win = bet*ตัวคูณตามจำนวนลูกโป่งที่เหลืออยู่
                                isWin = true;
                                user_credit += win;//บวกเงิน

                                const sql_update = `UPDATE user_play set tiles='${tilesString}', win ='${win}', winline ='${winBalloonId}', credit ='${user_credit}', bet ='${bet}'
                                WHERE winstyle='${paaswordRound}'`;
                                connection.query(sql_update, (error, resultsGame) => {
                                    if (error) { console.log(error) }
                                    else {
                                        const sql_update = `UPDATE member set credit ='${user_credit}', bet_latest ='${bet}', turnover ='${postTurnover}'
                                        WHERE id ='${userId}'`;
                                        connection.query(sql_update, (error, resultsGame) => {
                                            if (error) { console.log(error) }
                                            else {
                                                const jsArray = {
                                                    balanceNow: user_credit,
                                                    winBalloonId: winBalloonId,
                                                    isWinUser: isWin,
                                                    winGame: win,
                                                    allBalloonId: tilesArray,
                                                };

                                                resolve(jsArray);
                                            }
                                        })
                                    }
                                });
                            }
                            else {
                                win = 0;
                                isWin = false;
                                const jsArray = {
                                    balanceNow: user_credit,
                                    winBalloonId: winBalloonId,
                                    isWinUser: isWin,
                                    winGame: win,
                                    allBalloonId: tilesArray,
                                };
                                const sql_update = `UPDATE user_play set tiles='${tilesString}', win ='${win}', winline ='${jsArray.winBalloonId}', credit ='${user_credit}', bet ='${bet}'
                                WHERE winstyle='${paaswordRound}'`;
                                connection.query(sql_update, (error, resultsGame) => {
                                    if (error) { console.log(error) }
                                    else {
                                        const sql_update = `UPDATE member set credit ='${user_credit}', bet_latest ='${bet}', turnover ='${postTurnover}'
                                        WHERE id ='${userId}'`;
                                        connection.query(sql_update, (error, resultsGame) => {
                                            if (error) { console.log(error) }
                                            else {
                                                resolve(jsArray);
                                            }
                                        })
                                    }
                                });
                            }
                        }
                    });
                } else {
                    resolve('ยอดเงินไม่เพียงพอ')
                }
            }
        })
    })
}

function ResetData() {
    allBalloonId = [0, 1, 2, 3, 4]
    isWin = undefined
    deleteBalloonId = undefined
    winBalloonId = undefined
    let bet = undefined
    let win = 0
}