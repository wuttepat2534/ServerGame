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


http://localhost:5000/signupMember Add Member//Toonta
exports.signupMember = async (req, res, next) => {
    const agent_id = req.body.agent_id;
    const member_code = req.body.member_code;
    const username = req.body.username;
    const password = req.body.password;
    const credit = req.body.credit;
    const firstName = req.body.accountName;
    const lastName = req.body.accountName;
    const customerGroup = "NEW ALL";
    const Rank = "Bronze";
    const contact_number = req.body.contact_number;
    const IDLIne = "";
    const note = "สมัครจากหน้าเว็บไซต์";
    const currency = "บาท";
    const bank = req.body.bank;
    const accountName = req.body.accountName;
    const accountNumber = req.body.accountNumber;

    //const checkboxListv2 = req.body.checkboxListv2;
    let statuScheck = 'Y';

    const hashedPassword = md5(password);
    let sql_agent = `SELECT username FROM agent WHERE id='${agent_id}'`;
    connection.query(sql_agent, (error, usernameAgent) => {
        try {
            if (error) { console.log(error) }
            else {
                let sql = `INSERT INTO member (agent_id, username_agent, member_code, name, username, password, credit, created_at, updated_at, customerGroup, 	userrank, lineid, status,
                        note, currency, bank, accountName, accountNumber, phonenumber, lastName) 
                value ('${agent_id}','${usernameAgent[0].username}','${agent_id}','${firstName}','${username}','${hashedPassword}','${credit}',now(), now(), '${customerGroup}', '${Rank}',
                '${IDLIne}','${statuScheck}', '${note}', '${currency}','${bank}', '${accountName}', '${accountNumber}', '${contact_number}', '${lastName}')`;
                connection.query(sql, (error, result) => {
                    if (error) { console.log(error) }
                    res.send({
                        message: "Data created Success"
                    });
                    res.end();
                });
            }
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }
    })
};

http://localhost:5000/post/checkUsernameMember  Check Username Member Toonta
exports.checkUsernameMember = async (req, res, next) => {
    const username = req.body.username;
    let sql_check = `SELECT * FROM member WHERE username='${username}' ORDER BY username ASC`;
    connection.query(sql_check, async (error, results) => {
        try {
            const data = results;
            if (data.length !== 1 || data.length < 1) {
                res.send({
                    message: "This username is available."
                });
            }
            else {
                res.send({
                    message: "This username is not available."
                });
                res.end();
            }
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }
    })
};


http://localhost:5000/post/creditPromotion Add creditPromotion
exports.creditPromotion = async (req, res, next) => {
    const agnetidcreate = req.body.agnetidcreate;
    const repost = req.body.repost;
    const startpromotion = req.body.startpromotion;
    const endpromotion = req.body.endpromotion;
    const typebonus = req.body.typebonus;
    const bunus = req.body.bunus;
    const maxbunus = req.body.maxbunus;
    const valusbunus = req.body.valusbunus;
    const groupuser = req.body.groupuser;
    const afterPromotion = req.body.afterPromotion;
    const receiving_data_type = req.body.receiving_data_type;
    const valus_receiving = req.body.valus_receiving;
    const data_type = req.body.data_type;
    const valus_day = req.body.valus_day;
    const numberoftimes_person = req.body.numberoftimes_person;
    const ipAddress_attempts = req.body.ipAddress_attempts;
    const reset = req.body.reset;
    const withdrawalType = req.body.withdrawalType;
    const withdraw_data_type = req.body.withdraw_data_type;
    const withdraw_max = req.body.withdraw_max;
    const withdraw_valus = req.body.withdraw_valus;
    const multiplier = req.body.multiplier;
    const statuspromotion = req.body.statuspromotion;
    const promotiontype = req.body.promotiontype;
    const namepromotion = req.body.namepromotion;
    const leakedPro = req.body.leakedPro;

    let sql = `INSERT INTO creditpromotion (agnetidcreate, repost, startpromotion, endpromotion, typebonus, bunus, maxbunus, valusbunus, groupuser, afterPromotion, receiving_data_type, valus_receiving, data_type,
         valus_day, numberoftimes_person, ipAddress_attempts, reset, withdrawalType, withdraw_data_type, withdraw_max, withdraw_valus, statuspromotion, promotiontype, namepromotion, leakedPro, multiplier) 
 value ('${agnetidcreate}','${repost}','${startpromotion}','${endpromotion}','${typebonus}','${bunus}','${maxbunus}','${valusbunus}','${groupuser}',
 '${afterPromotion}','${receiving_data_type}','${valus_receiving}','${data_type}','${valus_day}','${numberoftimes_person}','${ipAddress_attempts}',
 '${reset}','${withdrawalType}','${withdraw_data_type}','${withdraw_max}','${withdraw_valus}','${statuspromotion}','${promotiontype}','${namepromotion}','${leakedPro}','${multiplier}')`;
    connection.query(sql, (error, result) => {
        try {
            if (error) { console.log(error) }
            res.send({
                message: "Data created Success"
            });
            res.end();
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }

    });
};

http://localhost:5000/post/creditImgPromotion Add creditImgPromotion
exports.creditImgPromotion = (req, res) => {
    //console.log('Axios POST body: ', req.body);
    const data = JSON.parse(req.body.data);
    const { namepromotion, details } = data;
    const fileimg = req.file;

    let sql = `INSERT INTO imgpromotion (namepromotion, details, fieldname, originalname, encoding, mimetype, destination, filename, path, size) 
 value ('${namepromotion}','${details}','${fileimg.fieldname}','${fileimg.originalname}','${fileimg.encoding}','${fileimg.mimetype}','${fileimg.destination}',
 '${fileimg.filename}','${fileimg.path}','${fileimg.size}')`;

    connection.query(sql, (error, result) => {
        try {
            if (error) { console.log(error) }
            res.send({
                message: "Data created Success"
            });
            res.end();
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }

    });
};


http://localhost:5000/post/getPromotion Add getPromotion
exports.getPromotion = (require, response) => {
    const searchKeyword = require.body.name;
    const pageSize = require.body.pageSize;
    const pageNumber = require.body.pageIndex;
    const offset = (pageNumber - 1) * pageSize;
    if (searchKeyword === '') {
        let sql = `SELECT * FROM creditpromotion LIMIT ${pageSize} OFFSET ${offset}`;
        connection.query(sql, async (error, results) => {
            if (error) { console.log(error); }
            const totalCount = `SELECT COUNT(*) as count FROM creditpromotion`
            connection.query(totalCount, (error, res) => {
                if (error) { console.log(error); }
                response.send({
                    message: 'Success',
                    data: results,
                    total: res[0].count
                });

                response.end();
            });
        });
    } else {
        let sql = `SELECT * FROM creditpromotion WHERE repost LIKE '%${searchKeyword}%' OR namepromotion LIKE '%${searchKeyword}%' OR agnetidcreate LIKE '%${searchKeyword}%' OR promotiontype LIKE '%${searchKeyword}%'
        LIMIT ${pageSize} OFFSET ${offset}`;
        connection.query(sql, async (error, results) => {
            if (error) { console.log(error); }
            response.send({
                message: 'search_Success',
                data: results,
                total: results.length
            });
            response.end();
        });
    }
};

http://localhost:5000/post/getImgPromotion Get getImgPromotion
exports.getImgPromotion = (req, res) => {
    let sql = `SELECT * FROM imgpromotion `;
    connection.query(sql, async (error, results) => {
        try {
            if (error) { console.log(error) }
            res.send({
                img: results
            });
            res.end();
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }
    });

};

http://localhost:5000/post/getDatafinanceUser/:id  Get getDatafinanceUser
exports.getDatafinanceUser = (req, res) => {
    const id = req.params.id;
    let sql = `SELECT accountNumber, accountName FROM member WHERE id ='${id}' `;
    connection.query(sql, async (error, results) => {
        try {
            if (error) { console.log(error) }
            res.send({
                accountNumber: results
            });
            res.end();
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }
    });

};

//http://localhost:5000/post/financeUser financeUserMoney
exports.financeUser = (req, res) => {
    const id = req.body.id;
    const type = req.body.type;
    const quantity = req.body.quantity;
    const accountNumber = req.body.accountNumber;
    try {
        let sql_before = `SELECT credit, accountName, accountNumber, recharge_times FROM member WHERE id ='${id}' ORDER BY username ASC`;
        connection.query(sql_before, (error, resultUser) => {
            if (error) { console.log(error) }
            else {
                if (resultUser[0].accountNumber === accountNumber) {
                    if (type === 'deposit') {
                        const balance = quantity + resultUser[0].credit;
                        let sql = `UPDATE member set credit = '${balance}', recharge_times = '${resultUser[0].recharge_times + 1}' WHERE id='${id}'`;
                        connection.query(sql, (error, result) => {
                            if (error) { console.log(error) }
                            else {
                                let sql_before = `INSERT INTO logfinanceuser (idUser, accountName, accountNumber, tpyefinance, quantity, balance, transaction_date) value 
                            ('${id}','${resultUser[0].accountName}','${accountNumber}','${'ฝาก'}','${quantity}','${balance}',now())`;

                                connection.query(sql_before, (error, resultAfter) => {
                                    if (error) { console.log(error); }
                                    res.send({
                                        message: "ฝากเงินสำเร็จ",
                                    });
                                    res.end();
                                });
                            }
                        });
                    } else {
                        const balance = resultUser[0].credit - quantity;
                        let sql = `UPDATE member set credit = '${balance}' WHERE id='${id}'`;
                        connection.query(sql, (error, result) => {
                            if (error) { console.log(error) }
                            else {
                                let sql_before = `INSERT INTO logfinanceuser (idUser, accountName, accountNumber, tpyefinance, quantity, balance, transaction_date) value 
                            ('${id}','${resultUser[0].accountName}','${accountNumber}','${'ถอน'}','${quantity}','${balance}',now())`;
                                connection.query(sql_before, (error, resultAfter) => {
                                    if (error) { console.log(error); }
                                    res.send({
                                        message: "ถอนเงินสำเร็จ",
                                    });
                                    res.end();
                                });
                            }
                        });
                    }

                } else {
                    res.send({
                        message: "เลขบัญชีไม่ถูกต้อง",
                    });
                }
            }
        });
    } catch (err) {
        if (!err.statusCode) {
            err.statusCode = 500;
        }
        next(err);
    }
};


//http://localhost:5000/post/depositUserPromotion financeUserMoney
exports.depositUserPromotion = (req, res) => {
    const id = req.body.id;
    const idPromotion = req.body.idPromotion;
    const type = req.body.type;
    const quantity = req.body.quantity;
    const accountNumber = req.body.accountNumber;
    const accountName = req.body.accountName;
    try {
        let sql_Promotion = `SELECT * FROM creditpromotion WHERE id ='${idPromotion}'`;
        connection.query(sql_Promotion, (error, resultPromotion) => {
            if (error) { console.log(error) }
            else {
                if (resultPromotion[0].receiving_data_type === "เติมเงินครั้งแรก") {
                    let sql_valusUserDeposit = `SELECT recharge_times FROM member WHERE id ='${id}'`;
                    connection.query(sql_valusUserDeposit, (error, resultvalusUserDeposit) => {
                        if (error) { console.log(error) }
                        else {
                            if (resultvalusUserDeposit[0].recharge_times === 0) {
                                if (resultPromotion[0].typebonus === "Percent") {
                                    if (quantity > resultPromotion[0].valusbunus) {
                                        const balancebunus = quantity * resultPromotion[0].bunus / 100;
                                        if (balancebunus > resultPromotion[0].maxbunus){
                                            balancebunus = resultPromotion[0].maxbunus
                                        }
                                        const balance = quantity + balancebunus
                                        let sql = `UPDATE member set credit = '${balance}', bonususer = '${balancebunus}', recharge_times = '${resultvalusUserDeposit[0].recharge_times + 1}' WHERE id='${id}'`;
                                        connection.query(sql, (error, result) => {
                                            if (error) { console.log(error) }
                                            else {
                                                let sql_before = `INSERT INTO logfinanceuser (idUser, accountName, accountNumber, tpyefinance, quantity, balance, creditbonus, transaction_date) value 
                                                ('${id}','${accountName}','${accountNumber}','${'ฝาก'}','${quantity}','${balance}','${balancebunus}',now())`;
                                                connection.query(sql_before, (error, resultAfter) => {
                                                    if (error) { console.log(error); }
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
                                        let sql = `UPDATE member set credit = '${balance}', bonususer = '${balancebunus}', recharge_times = '${resultvalusUserDeposit[0].recharge_times + 1}' WHERE id='${id}'`;
                                        connection.query(sql, (error, result) => {
                                            if (error) { console.log(error) }
                                            else {
                                                let sql_before = `INSERT INTO logfinanceuser (idUser, accountName, accountNumber, tpyefinance, quantity, balance, creditbonus, transaction_date) value 
                                                ('${id}','${accountName}','${accountNumber}','${'deposit'}','${quantity}','${balance}','${balancebunus}',now())`;
                                                connection.query(sql_before, (error, resultAfter) => {
                                                    if (error) { console.log(error); }
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
                    });
                } else {
                    res.send({
                        message: "เลขบัญชีไม่ถูกต้อง",
                    });
                }
            }
        });
    } catch (err) {
        if (!err.statusCode) {
            err.statusCode = 500;
        }
        next(err);
    }
};

/*
//http://localhost:5000/post/depositUserPromotion financeUserMoney
exports.depositUserPromotion = (req, res) => {
    const id = req.body.id;
    const type = req.body.type;
    const quantity = req.body.quantity;
    const accountNumber = req.body.accountNumber;
    try {
        let sql_before = `SELECT credit, accountName, accountNumber, recharge_times FROM member WHERE id ='${id}' ORDER BY username ASC`;
        connection.query(sql_before, (error, resultUser) => {
            if (error) { console.log(error) }
            else {
                if (resultUser[0].accountNumber === accountNumber) {
                    const balance = quantity + resultUser[0].credit;
                    let sql = `UPDATE member set credit = '${balance}', recharge_times = '${resultUser[0].recharge_times + 1}' WHERE id='${id}'`;
                    connection.query(sql, (error, result) => {
                        if (error) { console.log(error) }
                        else {
                            let sql_before = `INSERT INTO logfinanceuser (idUser, accountName, accountNumber, tpyefinance, quantity, balance, transaction_date) value 
                            ('${id}','${resultUser[0].accountName}','${accountNumber}','${'deposit'}','${quantity}','${balance}',now())`;

                            connection.query(sql_before, (error, resultAfter) => {
                                if (error) { console.log(error); }
                                res.send({
                                    message: "ฝากเงินสำเร็จ",
                                });
                                res.end();
                            });
                        }
                    });
                } else {
                    res.send({
                        message: "เลขบัญชีไม่ถูกต้อง",
                    });
                }
            }
        });
    } catch (err) {
        if (!err.statusCode) {
            err.statusCode = 500;
        }
        next(err);
    }
};*/