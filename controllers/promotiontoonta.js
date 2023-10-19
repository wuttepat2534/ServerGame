const express = require('express');
const { response } = require("express");
const mysql = require('mysql2') //npm install mysql2
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
const os = require('os');
const md5 = require('md5');
const multer = require('multer');
const upload = multer({ dest: 'uploads/' });
const cron = require('node-cron');
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

    static promotionPlayLoseMoneyBack(post) {
        console.log('Automatic function is running at 03:33 PM.');
        cron.schedule('54 15 * * *', () => {
            automaticFunctionTest();
        });
    }  

    static promotionDeposit(quantity, dataUser, idPromotion, bill_number, totaltopup) {
        try {
            let sql_Promotion = `SELECT * FROM creditpromotion WHERE id ='${idPromotion}'`;
            connection.query(sql_Promotion, (error, resultPromotion) => {
                if (error) {
                    console.log(error)
                } else {
                    if (resultPromotion[0].receiving_data_type === "เติมเงินครั้งแรก") {
                        if (dataUser.recharge_times === 0) {
                            if (resultPromotion[0].typebonus === "Percent") {
                                if (quantity > resultPromotion[0].valusbunus) {
                                    const balancebunus = quantity * resultPromotion[0].bunus / 100;
                                    if (balancebunus > resultPromotion[0].maxbunus) {
                                        balancebunus = resultPromotion[0].maxbunus
                                    }
                                    const balance = quantity + balancebunus
                                    const turnover = balancebunus * resultPromotion[0].multiplier;
                                    let rank = 'NewMember';
                                    if (totaltopup >= 200000){
                                        rank = "Bronze";
                                    } else if (totaltopup >= 1000000){
                                        rank = "Silver";
                                    } else if (totaltopup >= 3000000){
                                        rank = "Gold";
                                    } else if (totaltopup >= 10000000){
                                        rank = "Diamond";
                                    } else {
                                        rank = "NewMember";
                                    }
                                    let sql = `UPDATE member set credit = '${balance}', bonususer = '${balancebunus}', recharge_times = '${resultvalusUserDeposit[0].recharge_times + 1}', turnover = '${turnover}',
                                    total_top_up_amount = '${totaltopup}' groupmember = '${rank}', promotionuser = '${resultPromotion[0].namepromotion}'  
                                    WHERE id='${dataUser.id}'`;
                                    connection.query(sql, (error, result) => {
                                        if (error) {
                                            console.log(error)
                                        } else {
                                            let sqlBound = `UPDATE logfinanceuser set credit = '${balance}',  creditbonus = '${balancebunus}' WHERE bill_number='${bill_number}'`;
                                            connection.query(sqlBound, (error, sqlBound) => {
                                                if (error) {
                                                    console.log(error);
                                                }
                                                res.send({
                                                    message: "ฝากเงินสำเร็จ",
                                                });
                                                res.end();
                                            });
                                        }
                                    });
                                }
                            } else {
                                if (quantity > resultPromotion[0].valusbunus) {
                                    const balancebunus = quantity + resultPromotion[0].bunus;
                                    const turnover = balancebunus * resultPromotion[0].multiplier;
                                    let sql = `UPDATE member set credit = '${balance}', bonususer = '${balancebunus}', recharge_times = '${resultvalusUserDeposit[0].recharge_times + 1}', turnover = '${turnover} 
                                    WHERE id='${dataUser.id}'`;
                                    connection.query(sql, (error, result) => {
                                        if (error) {
                                            console.log(error)
                                        } else {
                                            let sqlBound = `UPDATE logfinanceuser set credit = '${quantity}', creditbonus = '${balancebunus}' WHERE bill_number='${bill_number}'`;
                                            connection.query(sqlBound, (error, resultAfter) => {
                                                if (error) {
                                                    console.log(error);
                                                }
                                                res.send({
                                                    message: "ฝากเงินสำเร็จ",
                                                });
                                                res.end();
                                            });
                                        }
                                    });
                                }
                            }
                        } else {
                            res.send({
                                message: "คุณไม่สามารถรับโปรโมชั่นนี่ได้",
                            });
                        }
                    } else if (resultPromotion[0].receiving_data_type === "รายวัน") {
                        let sql_DipositDay = `SELECT * FROM logfinanceuser WHERE idUser ='${dataUser.id}' AND transaction_date = now()`;
                        connection.query(sql_DipositDay, (error, result) => {
                            if (error) {
                                console.log(error)
                            } else {
                                if (result.length === 0 && result.length < 1) {
                                    if (resultPromotion[0].typebonus === "Percent") {
                                        if (quantity > resultPromotion[0].valusbunus) {
                                            const balancebunus = quantity * resultPromotion[0].bunus / 100;
                                            if (balancebunus > resultPromotion[0].maxbunus) {
                                                balancebunus = resultPromotion[0].maxbunus
                                            }
                                            const balance = quantity + balancebunus
                                            let sql = `UPDATE member set credit = '${balance}', bonususer = '${balancebunus}', recharge_times = '${resultvalusUserDeposit[0].recharge_times + 1}' WHERE id='${dataUser.id}'`;
                                            connection.query(sql, (error, result) => {
                                                if (error) {
                                                    console.log(error)
                                                } else {
                                                    let sqlBound = `UPDATE logfinanceuser set credit = '${balance}', creditbonus = '${balancebunus}' WHERE bill_number='${bill_number}'`;
                                                    connection.query(sql_before, (error, sqlBound) => {
                                                        if (error) {
                                                            console.log(error);
                                                        }
                                                        res.send({
                                                            message: "ฝากเงินสำเร็จ",
                                                        });
                                                        res.end();
                                                    });
                                                }
                                            });
                                        }
                                    } else {
                                        if (quantity > resultPromotion[0].valusbunus) {
                                            const balancebunus = quantity * resultPromotion[0].bunus;
                                            const balance = quantity + balancebunus
                                            let sql = `UPDATE member set credit = '${balance}', bonususer = '${balancebunus}', recharge_times = '${resultvalusUserDeposit[0].recharge_times + 1}',  
                                            WHERE id='${dataUser.id}'`;
                                            connection.query(sql, (error, result) => {
                                                if (error) {
                                                    console.log(error)
                                                } else {
                                                    let sqlBound = `UPDATE logfinanceuser set credit = '${balance}', creditbonus = '${balancebunus}' WHERE bill_number='${bill_number}'`;
                                                    connection.query(sql_before, (error, sqlBound) => {
                                                        if (error) {
                                                            console.log(error);
                                                        }
                                                        res.send({
                                                            message: "ฝากเงินสำเร็จ",
                                                        });
                                                        res.end();
                                                    });
                                                }
                                            });
                                        }
                                    }
                                } else {
                                    res.send({
                                        message: "คุณไม่สามารถรับโปรโมชั่นนี่ได้",
                                    });
                                }
                            }
                        })
                    } else {
                        res.send({
                            message: "เลขบัญชีไม่ถูกต้อง",
                        });
                    }
                }
            })
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }
    }

    static promotionDay(quantity, dataUser, idPromotion, bill_number) {

    }
};

function automaticFunctionTest() {
    console.log('Automatic function is running at 03:54 PM.');
}