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

http: //localhost:5000/signupMember Add Member//Toonta
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
            if (error) {
                console.log(error)
            } else {
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

http: //localhost:5000/post/checkUsernameMember  Check Username Member Toonta
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
            } else {
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

http: //localhost:5000/post/creditPromotion Add creditPromotion
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

http: //localhost:5000/post/creditImgPromotion Add creditImgPromotion
exports.creditImgPromotion = (req, res) => {
    //console.log('Axios POST body: ', req.body);
    const data = JSON.parse(req.body.data);
    const {
        namepromotion,
        details
    } = data;
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
            if (!err.statusCode) { err.statusCode = 500; }
            next(err);
        }
    });
};

http: //localhost:5000/post/getPromotion Add getPromotion
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

http: //localhost:5000/post/getlistPromotion Add getPromotion
exports.getlistPromotion = (require, response) => {
    let sql = `SELECT * FROM creditpromotion`;
    connection.query(sql, async (error, results) => {
        if (error) { console.log(error); }
        response.send({
            message: 'Success',
            data: results,
        });
        response.end();
    });
};

http: //localhost:5000/post/getImgPromotion Get getImgPromotion
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


http: //localhost:5000/post/getDatafinanceUser/:id  Get getDatafinanceUser
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

function formatNumber(num) {
    return String(num).padStart(5, '0');
}
//http://localhost:5000/post/financeUser financeUserMoney
exports.financeUser = (req, res) => {
    const type = req.body.type;
    const quantity = req.body.quantity;
    const accountNumber = req.body.accountNumber;
    const destinationAccount = req.body.destinationAccountName
    const destinationAccountNumber = req.body.destinationAccountNumber
    const phonenumber = req.body.phonenumber
    const accountNumberInt = parseInt(accountNumber);
    const statusFinance = req.body.statusFinance
    const today = new Date();
    // Format the date as "ddmmyyyy"
    const day = String(today.getDate()).padStart(2, '0');
    const month = String(today.getMonth() + 1).padStart(2, '0'); // JavaScript months are 0-based, so we add 1
    const year = today.getFullYear();
    const formattedDate = year + month + day;
    const formattedDateBill = `${year}-${month}-${day}`;

    try {
        let sql_before = `SELECT id, agent_id, credit, accountName, accountNumber, recharge_times, bank, imgBank FROM member WHERE phonenumber ='${phonenumber}' ORDER BY phonenumber ASC`;
        connection.query(sql_before, (error, resultUser) => {
            if (error) {
                console.log(error)
            } else {
                if (resultUser[0].accountNumber === accountNumberInt) {
                    if (type === 'deposit') {
                        let bill = `SELECT numberbill FROM logfinanceuser WHERE transaction_date = ?  AND tpyefinance = 'ฝาก' ORDER BY numberbill DESC LIMIT 1`;
                        connection.query(bill, [formattedDateBill], (error, resultBill) => {
                            if (error) {
                                console.log(error)
                            } else {
                                let totalamountdaily = logTotalAmount(resultUser, formattedDateBill, 'ฝาก', destinationAccount, destinationAccountNumber, quantity, statusFinance)
                                let billnum = 0
                                if (resultBill.length !== 0) {
                                    billnum = resultBill[0].numberbill + 1;
                                } else {
                                    billnum += 1;
                                }
                                const formattedNumber = formatNumber(billnum);
                                const balance = quantity + resultUser[0].credit;
                                let sql_before = `INSERT INTO logfinanceuser (idUser, agent_id, accountName, accountNumber, phonenumber, tpyefinance, quantity, creditbonus, 
                            balance_before, balance, bill_number, numberbill, status, transaction_date, time, bank, imgBank, destinationAccount, destinationAccountNumber) value 
                            ('${resultUser[0].id}','${resultUser[0].agent_id}','${resultUser[0].accountName}','${accountNumber}','${phonenumber}','${'ฝาก'}','${quantity}','${0}','${resultUser[0].credit}'
                            ,'${balance}','T${formattedDate}${formattedNumber}','${billnum}','${statusFinance}',now(),now(),'${resultUser[0].bank}','${resultUser[0].imgBank}'
                            ,'${destinationAccount}','${destinationAccountNumber}')`;
                                if (statusFinance === "สำเร็จ") {
                                    connection.query(sql_before, (error, result) => {
                                        if (error) {
                                            console.log(error)
                                        } else {
                                            let sql = `UPDATE member set credit = '${balance}', recharge_times = '${resultUser[0].recharge_times + 1}' WHERE phonenumber ='${phonenumber}'`;
                                            connection.query(sql, (error, resultAfter) => {
                                                if (error) {
                                                    console.log(error);
                                                }
                                                res.send({
                                                    message: "เติมเงินสำเร็จ",
                                                });
                                                res.end();
                                            });
                                        }
                                    });
                                } else {
                                    res.send({
                                        message: "เติมเงินไม่สำเร็จ",
                                    });
                                }
                            }
                        })
                    } else {
                        if (resultUser[0].credit > quantity) {
                            let totalamountdaily = logTotalAmountWithdraw(resultUser, formattedDateBill, 'ถอน', destinationAccount, destinationAccountNumber, quantity, statusFinance)
                            let bill = `SELECT numberbill FROM logfinanceuser WHERE transaction_date = ? AND tpyefinance = 'ถอน' ORDER BY numberbill DESC LIMIT 1`;
                            connection.query(bill, [formattedDateBill], (error, resultBill) => {
                                if (error) {
                                    console.log(error)
                                } else {
                                    let billnum = 0
                                    if (resultBill.length !== 0) {
                                        billnum = resultBill[0].numberbill + 1;
                                    } else { billnum += 1; }
                                    const formattedNumber = formatNumber(billnum);
                                    const balance = resultUser[0].credit - quantity;
                                    let sql_before = `INSERT INTO logfinanceuser (idUser, agent_id, accountName, accountNumber, phonenumber, tpyefinance, quantity, creditbonus, 
                                    balance_before, balance, bill_number, numberbill, status, transaction_date, time, bank, imgBank, destinationAccount, destinationAccountNumber) value 
                                ('${resultUser[0].id}','${resultUser[0].agent_id}','${resultUser[0].accountName}','${accountNumber}','${phonenumber}','${'ถอน'}','${quantity}','${0}','${resultUser[0].credit}'
                                ,'${balance}','T${formattedDate}${formattedNumber}','${billnum}','${statusFinance}',now(),now(),'${resultUser[0].bank}','${resultUser[0].imgBank}'
                                ,'${destinationAccount}','${destinationAccountNumber}')`;
                                    if (statusFinance === "สำเร็จ") {
                                        connection.query(sql_before, (error, result) => {
                                            if (error) {
                                                console.log(error)
                                            } else {
                                                let sql = `UPDATE member set credit = '${balance}', recharge_times = '${resultUser[0].recharge_times + 1}' WHERE phonenumber ='${phonenumber}'`;
                                                connection.query(sql, (error, resultAfter) => {
                                                    if (error) {
                                                        console.log(error);
                                                    }
                                                    res.send({
                                                        message: "ถอนเงินสำเร็จ",
                                                    });
                                                    res.end();
                                                });
                                            }
                                        });
                                    } else {
                                        res.send({
                                            message: "ยอดเงินมีไม่เพียงพอ",
                                        });
                                    }
                                }
                            })
                        } else {
                            res.send({
                                message: "ยอดเงินมีไม่เพียงพอ",
                            });
                        }
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

function logTotalAmount(resultUser, formattedDateBill, type, destinationAccount, destinationAccountNumber, quantity, statusFinance) {
    console.log(destinationAccount, destinationAccountNumber);
    let sql_deposit = `SELECT * FROM depositaccount WHERE accountName ='${destinationAccount}' AND accountNumber = '${destinationAccountNumber}' ORDER BY accountName ASC`;
    let sql_before = `SELECT * FROM totalamountdaily WHERE date ='${formattedDateBill}' AND typeaction = '${type}' ORDER BY date ASC`;
    connection.query(sql_before, (error, resulttotal) => {
        if (error) {
            console.log(error)
        } else {
            if (resulttotal.length === 0) {
                if (statusFinance === ('สำเร็จ')) {
                    let sql_before = `INSERT INTO totalamountdaily (agentid, accountName, accountNumber, billmatched, complated, date, time, typeaction) value 
                    ('${resultUser[0].agent_id}','${destinationAccount}','${destinationAccountNumber}','${quantity}','${quantity}',now() ,now(),'${type}')`;
                    connection.query(sql_before, (error, result) => {
                        if (error) {
                            console.log(error)
                        } else {
                            connection.query(sql_deposit, (error, resulttotaldeposit) => {
                                if (error) {
                                    console.log(error)
                                } else {
                                    console.log(resulttotaldeposit);
                                    let sql = `UPDATE depositaccount set billmatched = '${resulttotaldeposit[0].billmatched + quantity}', complated = '${resulttotaldeposit[0].complated + quantity}'
                                    WHERE accountName ='${destinationAccount}' AND accountNumber = '${destinationAccountNumber}' ORDER BY accountName ASC`;
                                    connection.query(sql, (error, resultDeposit) => {
                                        if (error) {
                                            console.log(error);
                                        } else {
                                            let success = 'Success'
                                            return success
                                        }
                                    });
                                }
                            })
                        }
                    });
                } else {
                    let sql_before = `INSERT INTO totalamountdaily (agentid, accountName, accountNumber, billmatched, complated, date, time, typeaction) value 
                    ('${resultUser[0].agent_id}','${destinationAccount}','${destinationAccountNumber}','${quantity}','${0}',now() ,now(),'${type}')`;
                    connection.query(sql_before, (error, result) => {
                        if (error) {
                            console.log(error)
                        } else {
                            connection.query(sql_deposit, (error, resulttotaldeposit) => {
                                if (error) {
                                    console.log(error)
                                } else {
                                    let sql = `UPDATE depositaccount set billmatched = '${resulttotaldeposit[0].billmatched + quantity}', complated = '${resulttotaldeposit[0].complated}'
                                    WHERE accountName ='${destinationAccount}' AND accountNumber = '${destinationAccountNumber}' ORDER BY accountName ASC`;
                                    connection.query(sql, (error, resultDeposit) => {
                                        if (error) {
                                            console.log(error);
                                        } else {
                                            let success = 'Success'
                                            return success
                                        }
                                    });
                                }
                            })
                        }
                    });
                }

            } else {
                if (statusFinance === ('สำเร็จ')) {
                    let sql = `UPDATE totalamountdaily set billmatched = '${resulttotal[0].billmatched + quantity}', complated = '${resulttotal[0].complated + quantity}'
                    WHERE date ='${formattedDateBill}' AND typeaction = '${type}' ORDER BY date ASC`;
                    connection.query(sql, (error, resultUpdate) => {
                        console.log(resultUpdate)
                        if (error) {
                            console.log(error);
                        } else {
                            connection.query(sql_deposit, (error, resulttotaldeposit) => {
                                if (error) {
                                    console.log(error)
                                } else {
                                    let sql = `UPDATE depositaccount set billmatched = '${resulttotaldeposit[0].billmatched + quantity}', complated = '${resulttotaldeposit[0].complated + quantity}'
                                    WHERE accountName ='${destinationAccount}' AND accountNumber = '${destinationAccountNumber}' ORDER BY accountName ASC`;
                                    connection.query(sql, (error, resultDeposit) => {
                                        if (error) {
                                            console.log(error);
                                        } else {
                                            let success = 'Success'
                                            return success
                                        }
                                    });
                                }
                            })
                        }
                    });
                } else {
                    let sql = `UPDATE totalamountdaily set billmatched = '${resulttotal[0].billmatched + quantity}', complated = '${resulttotal[0].complated}',
                    WHERE date ='${formattedDateBill}' AND typeaction = '${type}' ORDER BY date ASC`;
                    connection.query(sql, (error, resultUpdate) => {
                        if (error) {
                            console.log(error);
                        } else {
                            connection.query(sql_deposit, (error, resulttotaldeposit) => {
                                if (error) {
                                    console.log(error)
                                } else {
                                    let sql = `UPDATE depositaccount set billmatched = '${resulttotaldeposit[0].billmatched + quantity}', complated = '${resulttotaldeposit[0].complated}'
                                    WHERE accountName ='${destinationAccount}' AND accountNumber = '${destinationAccountNumber}' ORDER BY accountName ASC`;
                                    connection.query(sql, (error, resultDeposit) => {
                                        if (error) {
                                            console.log(error);
                                        } else {
                                            let success = 'Success'
                                            return success
                                        }
                                    });
                                }
                            })
                        }
                    });
                }
            }
        }
    });
}

function logTotalAmountWithdraw(resultUser, formattedDateBill, type, destinationAccount, destinationAccountNumber, quantity, statusFinance) {
    let sql_deposit = `SELECT billmatched, complated FROM withdrawalaccount WHERE accountName ='${destinationAccount}' AND 	accountNumber = '${destinationAccountNumber}' ORDER BY accountName ASC`;
    let sql_before = `SELECT * FROM totalamountdaily WHERE date ='${formattedDateBill}' AND typeaction = '${type}' ORDER BY date ASC`;
    connection.query(sql_before, (error, resulttotal) => {
        if (error) {
            console.log(error)
        } else {
            if (resulttotal.length === 0) {
                if (statusFinance === ('สำเร็จ')) {
                    let sql_before = `INSERT INTO totalamountdaily (agentid, accountName, accountNumber, billmatched, complated, date, time, typeaction) value 
                    ('${resultUser[0].agent_id}','${destinationAccount}','${destinationAccountNumber}','${quantity}','${quantity}',now() ,now(),'${type}')`;
                    connection.query(sql_before, (error, result) => {
                        if (error) {
                            console.log(error)
                        } else {
                            connection.query(sql_deposit, (error, resulttotaldeposit) => {
                                if (error) {
                                    console.log(error)
                                } else {

                                    let sql = `UPDATE withdrawalaccount set billmatched = '${resulttotaldeposit[0].billmatched + quantity}', complated = '${resulttotaldeposit[0].complated + quantity}'
                                    WHERE accountName ='${destinationAccount}' AND accountNumber = '${destinationAccountNumber}' ORDER BY accountName ASC`;
                                    connection.query(sql, (error, resultDeposit) => {
                                        if (error) {
                                            console.log(error);
                                        } else {
                                            let success = 'Success'
                                            return success
                                        }
                                    });
                                }
                            })
                        }
                    });
                } else {
                    let sql_before = `INSERT INTO totalamountdaily (agentid, accountName, accountNumber, billmatched, complated, date, time, typeaction) value 
                    ('${resultUser[0].agent_id}','${destinationAccount}','${destinationAccountNumber}','${quantity}','${0}',now() ,now(),'${type}')`;
                    connection.query(sql_before, (error, result) => {
                        if (error) {
                            console.log(error)
                        } else {
                            connection.query(sql_deposit, (error, resulttotaldeposit) => {
                                if (error) {
                                    console.log(error)
                                } else {
                                    let sql = `UPDATE withdrawalaccount set billmatched = '${resulttotaldeposit[0].billmatched + quantity}', complated = '${resulttotaldeposit[0].complated}'
                                    WHERE accountName ='${destinationAccount}' AND accountNumber = '${destinationAccountNumber}' ORDER BY accountName ASC`;
                                    connection.query(sql, (error, resultDeposit) => {
                                        if (error) {
                                            console.log(error);
                                        } else {
                                            let success = 'Success'
                                            return success
                                        }
                                    });
                                }
                            })
                        }
                    });
                }

            } else {
                if (statusFinance === ('สำเร็จ')) {
                    let sql = `UPDATE totalamountdaily set billmatched = '${resulttotal[0].billmatched + quantity}', complated = '${resulttotal[0].complated + quantity}'
                    WHERE date ='${formattedDateBill}' AND typeaction = '${type}' ORDER BY date ASC`;
                    connection.query(sql, (error, resultUpdate) => {
                        if (error) {
                            console.log(error);
                        } else {
                            connection.query(sql_deposit, (error, resulttotaldeposit) => {
                                if (error) {
                                    console.log(error)
                                } else {
                                    console.log(resulttotaldeposit)
                                    let sql = `UPDATE withdrawalaccount set billmatched = '${resulttotaldeposit[0].billmatched + quantity}', complated = '${resulttotaldeposit[0].complated + quantity}'
                                    WHERE accountName ='${destinationAccount}' AND accountNumber = '${destinationAccountNumber}' ORDER BY accountName ASC`;
                                    connection.query(sql, (error, resultDeposit) => {
                                        if (error) {
                                            console.log(error);
                                        } else {
                                            let success = 'Success'
                                            return success
                                        }
                                    });
                                }
                            })
                        }
                    });
                } else {
                    let sql = `UPDATE totalamountdaily set billmatched = '${resulttotal[0].billmatched + quantity}', complated = '${resulttotal[0].complated}',
                    WHERE date ='${formattedDateBill}' AND typeaction = '${type}' ORDER BY date ASC`;
                    connection.query(sql, (error, resultUpdate) => {
                        if (error) {
                            console.log(error);
                        } else {
                            connection.query(sql_deposit, (error, resulttotaldeposit) => {
                                if (error) {
                                    console.log(error)
                                } else {
                                    let sql = `UPDATE withdrawalaccount set billmatched = '${resulttotaldeposit[0].billmatched + quantity}', complated = '${resulttotaldeposit[0].complated}'
                                    WHERE accountName ='${destinationAccount}' AND accountNumber = '${destinationAccountNumber}' ORDER BY accountName ASC`;
                                    connection.query(sql, (error, resultDeposit) => {
                                        if (error) {
                                            console.log(error);
                                        } else {
                                            let success = 'Success'
                                            return success
                                        }
                                    });
                                }
                            })
                        }
                    });
                }
            }
        }
    });
}

//http://localhost:5000/post/depositUserPromotion financeUserMoney
exports.depositUserPromotion = (req, res) => {
    const quantity = req.body.quantity;
    const accountNumber = req.body.accountNumber;
    const destinationAccount = req.body.destinationAccountName
    const destinationAccountNumber = req.body.destinationAccountNumber
    const phonenumber = req.body.phonenumber
    const accountNumberInt = parseInt(accountNumber);
    const statusFinance = req.body.statusFinance
    const idPromotion = req.body.idPromotion;
    const today = new Date();
    // Format the date as "ddmmyyyy"
    const day = String(today.getDate()).padStart(2, '0');
    const month = String(today.getMonth() + 1).padStart(2, '0'); // JavaScript months are 0-based, so we add 1
    const year = today.getFullYear();
    const formattedDate = year + month + day;
    const formattedDateBill = `${year}-${month}-${day}`;

    try {
        let sql_Promotion = `SELECT * FROM creditpromotion WHERE id ='${idPromotion}'`;
        connection.query(sql_Promotion, (error, resultPromotion) => {
            if (error) {
                console.log(error)
            } else {
                if (resultPromotion[0].receiving_data_type === "เติมเงินครั้งแรก") {
                    let sql_valusUserDeposit = `SELECT * FROM member WHERE phonenumber ='${phonenumber}'`;
                    connection.query(sql_valusUserDeposit, (error, resultvalusUserDeposit) => {
                        if (error) {
                            console.log(error)
                        } else {
                            if (resultvalusUserDeposit[0].recharge_times === 0) {
                                if (resultPromotion[0].typebonus === "Percent") {
                                    if (quantity > resultPromotion[0].valusbunus) {
                                        const balancebunus = quantity * resultPromotion[0].bunus / 100;
                                        if (balancebunus > resultPromotion[0].maxbunus) {
                                            balancebunus = resultPromotion[0].maxbunus
                                        }
                                        const balance = quantity + balancebunus
                                        let totalamountdaily = logTotalAmount(sql_valusUserDeposit, formattedDateBill, 'ฝาก', destinationAccount, destinationAccountNumber, quantity, statusFinance)
                                        let sql = `UPDATE member set credit = '${balance}', bonususer = '${balancebunus}', recharge_times = '${resultvalusUserDeposit[0].recharge_times + 1}' WHERE id='${id}'`;
                                        connection.query(sql, (error, result) => {
                                            if (error) {
                                                console.log(error)
                                            } else {
                                                let sql_before = `INSERT INTO logfinanceuser (idUser, agent_id, accountName, accountNumber, phonenumber, tpyefinance, quantity, creditbonus, 
                                                    balance_before, balance, bill_number, numberbill, status, transaction_date, time, bank, imgBank, destinationAccount, destinationAccountNumber) value 
                                                    ('${resultUser[0].id}','${resultUser[0].agent_id}','${resultUser[0].accountName}','${accountNumber}','${phonenumber}','${'ฝาก'}','${quantity}','${balancebunus}','${resultUser[0].credit}'
                                                    ,'${balance}','T${formattedDate}${formattedNumber}','${billnum}','${statusFinance}',now(),now(),'${resultUser[0].bank}','${resultUser[0].imgBank}'
                                                    ,'${destinationAccount}','${destinationAccountNumber}')`;
                                                connection.query(sql_before, (error, resultAfter) => {
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
                                        let totalamountdaily = logTotalAmount(sql_valusUserDeposit, formattedDateBill, 'ฝาก', destinationAccount, destinationAccountNumber, quantity, statusFinance)
                                        let sql = `UPDATE member set credit = '${balance}', bonususer = '${balancebunus}', recharge_times = '${resultvalusUserDeposit[0].recharge_times + 1}' WHERE id='${id}'`;
                                        connection.query(sql, (error, result) => {
                                            if (error) {
                                                console.log(error)
                                            } else {
                                                let sql_before = `INSERT INTO logfinanceuser (idUser, agent_id, accountName, accountNumber, phonenumber, tpyefinance, quantity, creditbonus, 
                                                    balance_before, balance, bill_number, numberbill, status, transaction_date, time, bank, imgBank, destinationAccount, destinationAccountNumber) value 
                                                    ('${resultUser[0].id}','${resultUser[0].agent_id}','${resultUser[0].accountName}','${accountNumber}','${phonenumber}','${'ฝาก'}','${quantity}','${balancebunus}','${resultUser[0].credit}'
                                                    ,'${balance}','T${formattedDate}${formattedNumber}','${billnum}','${statusFinance}',now(),now(),'${resultUser[0].bank}','${resultUser[0].imgBank}'
                                                    ,'${destinationAccount}','${destinationAccountNumber}')`;

                                                connection.query(sql_before, (error, resultAfter) => {
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


//http://localhost:5000/post/getDataDepositStatementBank getDataStatementBankUsers
exports.getDataDepositStatementBank = (req, res) => {
    const depositwithdrawal = req.body.depositwithdrawal;
    const searchKeyword = req.body.searchKeyword;
    const searchPhones = req.body.searchPhone;
    const pageSize = req.body.pageSize;
    const pageNumber = req.body.pageIndex;
    const offset = (pageNumber - 1) * pageSize;
    const date = req.body.dataDate;
    const agent_ID = req.body.agent_ID;
    // Format the date as "ddmmyyyy"
    const today = new Date();
    const day = String(today.getDate()).padStart(2, '0');
    const month = String(today.getMonth() + 1).padStart(2, '0'); // JavaScript months are 0-based, so we add 1
    const year = today.getFullYear();
    const formattedDateBill = `${year}-${month}-${day}`;

    if (searchPhones === '' && searchKeyword === '') {
        try {
            let sql_deposit = `SELECT * FROM logfinanceuser WHERE tpyefinance = '${depositwithdrawal}' AND transaction_date ='${date}'  LIMIT ${pageSize} OFFSET ${offset}`;
            connection.query(sql_deposit, (error, resultDeposit) => {
                if (error) {
                    console.log(error)
                } else {
                    let sql_statusTrue = `SELECT * FROM logfinanceuser WHERE tpyefinance = '${depositwithdrawal}' AND status ='สำเร็จ' AND transaction_date ='${date}' LIMIT ${pageSize} OFFSET ${offset}`;
                    connection.query(sql_statusTrue, (error, resultstatusTrue) => {
                        if (error) {
                            console.log(error)
                        } else {
                            let sql_statusFalse = `SELECT * FROM logfinanceuser WHERE tpyefinance = '${depositwithdrawal}' AND status ='ไม่สำเส็จ' AND transaction_date ='${date}' LIMIT ${pageSize} OFFSET ${offset}`;
                            connection.query(sql_statusFalse, (error, resultstatusFalse) => {
                                if (error) {
                                    console.log(error)
                                } else {
                                    let sql_statusUnbound = `SELECT * FROM logfinanceuser WHERE tpyefinance = '${depositwithdrawal}' AND status ='ที่ยังไม่ผูก' AND transaction_date ='${date}' LIMIT ${pageSize} OFFSET ${offset}`;
                                    connection.query(sql_statusUnbound, (error, resultstatusUnbound) => {
                                        if (error) {
                                            console.log(error)
                                        } else {
                                            let sql_statusWait = `SELECT * FROM logfinanceuser WHERE tpyefinance = '${depositwithdrawal}' AND status ='รอ' AND transaction_date ='${date}' LIMIT ${pageSize} OFFSET ${offset}`;
                                            connection.query(sql_statusWait, (error, resultstatusWait) => {
                                                if (error) {
                                                    console.log(error)
                                                } else {
                                                    let sql_statusNotready = `SELECT * FROM logfinanceuser WHERE tpyefinance = '${depositwithdrawal}' AND status ='ยังไม่เรียบร้อย' AND transaction_date ='${date}' LIMIT ${pageSize} OFFSET ${offset}`;
                                                    connection.query(sql_statusNotready, (error, resultstatusNotready) => {
                                                        if (error) {
                                                            console.log(error)
                                                        } else {
                                                            const totalCount = `SELECT * FROM logfinanceuser WHERE tpyefinance = '${depositwithdrawal}' AND transaction_date ='${date}'`
                                                            connection.query(totalCount, (error, restotal) => {
                                                                if (error) {
                                                                    console.log(error);
                                                                } else {
                                                                    let sql = `SELECT * FROM totalamountdaily WHERE agentid = '${agent_ID}' AND date = '${date}' AND typeaction = '${depositwithdrawal}'`;
                                                                    connection.query(sql, (error, results) => {
                                                                        res.send({
                                                                            dataDeposit: resultDeposit,
                                                                            datastatusTrue: resultstatusTrue,
                                                                            datastatusFalse: resultstatusFalse,
                                                                            dataUnbound: resultstatusUnbound,
                                                                            datastatusWait: resultstatusWait,
                                                                            datastatusNotready: resultstatusNotready,
                                                                            valusDataDeposit: resultDeposit.length,
                                                                            valusDatastatusTrue: resultstatusTrue.length,
                                                                            valusDatastatusFalse: resultstatusFalse.length,
                                                                            valusdataUnbound: resultstatusUnbound.length,
                                                                            valusdatastatusWait: resultstatusWait.length,
                                                                            valusdatastatusNotready: resultstatusNotready.length,
                                                                            total: restotal.length,
                                                                            accountreport: results
                                                                        });
                                                                        res.end();
                                                                    });
                                                                }
                                                            });
                                                        }
                                                    });
                                                }
                                            });
                                        }
                                    });
                                }
                            });
                        }
                    });

                }
            });
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }

    } else if (searchPhones !== "" && searchKeyword === "") {
        if (searchPhones.length === 10) {
            try {
                let sql_deposit = `SELECT * FROM logfinanceuser WHERE tpyefinance = ? AND transaction_date = ? AND phonenumber LIKE ?
                LIMIT ? OFFSET ?`;
                const searchPattern = `%${searchPhones}%`;
                const values = [depositwithdrawal, date, searchPattern, pageSize, offset];
                connection.query(sql_deposit, values, (error, resultDeposit) => {
                    if (error) {
                        console.log(error)
                    } else {
                        let sql_statusTrue = `SELECT * FROM logfinanceuser WHERE tpyefinance = ? AND transaction_date = ? AND status = ?
                        AND phonenumber LIKE ? LIMIT ? OFFSET ?`;
                        const searchPattern = `%${searchPhones}%`;
                        const values = [depositwithdrawal, date, "สำเร็จ", searchPattern, pageSize, offset];
                        connection.query(sql_statusTrue, values, (error, resultstatusTrue) => {
                            if (error) {
                                console.log(error)
                            } else {
                                let sql_statusFalse = `SELECT * FROM logfinanceuser WHERE tpyefinance = ? AND transaction_date = ? AND status = ?
                                AND phonenumber LIKE ? LIMIT ? OFFSET ?`;
                                const searchPattern = `%${searchPhones}%`;
                                const values = [depositwithdrawal, date, "ไม่สำเส็จ", searchPattern, pageSize, offset];
                                connection.query(sql_statusFalse, values, (error, resultstatusFalse) => {
                                    if (error) {
                                        console.log(error);
                                    } else {
                                        let sql_statusUnbound = `SELECT * FROM logfinanceuser WHERE tpyefinance = ? AND transaction_date = ? AND status = ?
                                AND phonenumber LIKE ? LIMIT ? OFFSET ?`;
                                        const searchPattern = `%${searchPhones}%`;
                                        const values = [depositwithdrawal, date, "ที่ยังไม่ผูก", searchPattern, pageSize, offset];
                                        connection.query(sql_statusUnbound, values, (error, resultstatusUnbound) => {
                                            if (error) {
                                                console.log(error)
                                            } else {
                                                let sql_statusWait = `SELECT * FROM logfinanceuser WHERE tpyefinance = ? AND transaction_date = ? AND status = ?
                                        AND phonenumber LIKE ? LIMIT ? OFFSET ?`;
                                                const searchPattern = `%${searchPhones}%`;
                                                const values = [depositwithdrawal, date, "รอ", searchPattern, pageSize, offset];
                                                connection.query(sql_statusWait, values, (error, resultstatusWait) => {
                                                    if (error) {
                                                        console.log(error)
                                                    } else {
                                                        let sql_statusNotready = `SELECT * FROM logfinanceuser WHERE tpyefinance = ? AND transaction_date = ? AND status = ?
                                            AND phonenumber LIKE ? LIMIT ? OFFSET ?`;
                                                        const searchPattern = `%${searchPhones}%`;
                                                        const values = [depositwithdrawal, date, "ยังไม่เรียบร้อย", searchPattern, pageSize, offset];
                                                        connection.query(sql_statusNotready, values, (error, resultstatusNotready) => {
                                                            if (error) {
                                                                console.log(error);
                                                            } else {
                                                                let sql = `SELECT * FROM totalamountdaily WHERE agentid = '${agent_ID}' AND date = '${date}' AND typeaction = '${depositwithdrawal}'`;
                                                                connection.query(sql, (error, results) => {
                                                                    res.send({
                                                                        dataDeposit: resultDeposit,
                                                                        datastatusTrue: resultstatusTrue,
                                                                        datastatusFalse: resultstatusFalse,
                                                                        dataUnbound: resultstatusUnbound,
                                                                        datastatusWait: resultstatusWait,
                                                                        datastatusNotready: resultstatusNotready,
                                                                        valusDataDeposit: resultDeposit.length,
                                                                        valusDatastatusTrue: resultstatusTrue.length,
                                                                        valusDatastatusFalse: resultstatusFalse.length,
                                                                        valusdataUnbound: resultstatusUnbound.length,
                                                                        valusdatastatusWait: resultstatusWait.length,
                                                                        valusdatastatusNotready: resultstatusNotready.length,
                                                                        total: resultDeposit.length,
                                                                        accountreport: results
                                                                    });
                                                                    res.end();
                                                                });
                                                            }
                                                        });
                                                    }
                                                });
                                            }
                                        });
                                    }
                                });
                            }
                        });
                    }
                });
            } catch (err) {
                if (!err.statusCode) {
                    err.statusCode = 500;
                }
                next(err);
            }
        } else {
            let sql = `SELECT * FROM totalamountdaily WHERE agentid = '${agent_ID}' AND date = '${date}' AND typeaction = '${depositwithdrawal}'`;
            connection.query(sql, (error, results) => {
                res.send({
                    dataDeposit: [],
                    datastatusTrue: [],
                    datastatusFalse: [],
                    dataUnbound: [],
                    datastatusWait: [],
                    datastatusNotready: [],
                    valusDataDeposit: 0,
                    valusDatastatusTrue: 0,
                    valusDatastatusFalse: 0,
                    valusdataUnbound: 0,
                    valusdatastatusWait: 0,
                    valusdatastatusNotready: 0,
                    total: 0,
                    accountreport: results
                });
                res.end();
            });
        }

    } else if (searchKeyword !== '' && searchPhones === '') {
        try {
            let sql_deposit = `SELECT * FROM logfinanceuser WHERE tpyefinance = '${depositwithdrawal}' AND transaction_date ='${date}' AND accountName LIKE '%${searchKeyword}%' 
            OR accountNumber LIKE '%${searchKeyword}%' LIMIT ${pageSize} OFFSET ${offset}`;
            connection.query(sql_deposit, (error, resultDeposit) => {
                if (error) {
                    console.log(error)
                } else {
                    let sql_statusTrue = `SELECT * FROM logfinanceuser WHERE tpyefinance = '${depositwithdrawal}' AND transaction_date ='${date}' AND status ='สำเร็จ'
                            AND accountName LIKE '%${searchKeyword}%' OR accountNumber LIKE '%${searchKeyword}%' LIMIT ${pageSize} OFFSET ${offset}`;
                    connection.query(sql_statusTrue, (error, resultstatusTrue) => {
                        if (error) {
                            console.log(error)
                        } else {
                            let sql_statusFalse = `SELECT * FROM logfinanceuser WHERE tpyefinance = '${depositwithdrawal}' AND transaction_date ='${date}' AND status ='ไม่สำเส็จ'
                                    AND accountName LIKE '%${searchKeyword}%' OR accountNumber LIKE '%${searchKeyword}%' LIMIT ${pageSize} OFFSET ${offset}`;
                            connection.query(sql_statusFalse, (error, resultstatusFalse) => {
                                if (error) {
                                    console.log(error)
                                } 
                                else {
                                    let sql_statusUnbound = `SELECT * FROM logfinanceuser WHERE tpyefinance = '${depositwithdrawal}' AND transaction_date ='${date}' AND status ='ที่ยังไม่ผูก'
                                    AND accountName LIKE '%${searchKeyword}%' OR accountNumber LIKE '%${searchKeyword}%'LIMIT ${pageSize} OFFSET ${offset}`;
                                    connection.query(sql_statusUnbound, (error, resultstatusUnbound) => {
                                        if (error) {
                                            console.log(error)
                                        } else {
                                            let sql_statusWait = `SELECT * FROM logfinanceuser WHERE tpyefinance = '${depositwithdrawal}' AND transaction_date ='${date}' AND status ='รอ'
                                                    AND accountName LIKE '%${searchKeyword}%' OR accountNumber LIKE '%${searchKeyword}%' LIMIT ${pageSize} OFFSET ${offset}`;
                                            connection.query(sql_statusWait, (error, resultstatusWait) => {
                                                if (error) {
                                                    console.log(error)
                                                } else {
                                                    let sql_statusNotready = `SELECT * FROM logfinanceuser WHERE tpyefinance = '${depositwithdrawal}' AND transaction_date ='${date}' AND status ='ยังไม่เรียบร้อย'
                                                            AND accountName LIKE '%${searchKeyword}%' OR accountNumber LIKE '%${searchKeyword}%' LIMIT ${pageSize} OFFSET ${offset}`;
                                                    connection.query(sql_statusNotready, (error, resultstatusNotready) => {
                                                        if (error) {
                                                            console.log(error)
                                                        } else {
                                                            let sql = `SELECT * FROM totalamountdaily WHERE agentid = '${agent_ID}' AND date = '${date}' AND typeaction = '${depositwithdrawal}'`;
                                                            connection.query(sql, (error, results) => {
                                                                res.send({
                                                                    dataDeposit: resultDeposit,
                                                                    datastatusTrue: resultstatusTrue,
                                                                    datastatusFalse: resultstatusFalse,
                                                                    dataUnbound: resultstatusUnbound,
                                                                    datastatusWait: resultstatusWait,
                                                                    datastatusNotready: resultstatusNotready,
                                                                    valusDataDeposit: resultDeposit.length,
                                                                    valusDatastatusTrue: resultstatusTrue.length,
                                                                    valusDatastatusFalse: resultstatusFalse.length,
                                                                    valusdataUnbound: resultstatusUnbound.length,
                                                                    valusdatastatusWait: resultstatusWait.length,
                                                                    valusdatastatusNotready: resultstatusNotready.length,
                                                                    total: resultDeposit.length,
                                                                    accountreport: results
                                                                });
                                                                res.end();
                                                            });
                                                        }
                                                    });
                                                }
                                            });
                                        }
                                    });
                                }
                            });
                        }
                    });
                }
            });
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }
    } else {
        if (searchPhones.length === 10) {
            try {
                let sql_deposit = `SELECT * FROM logfinanceuser WHERE tpyefinance = ? AND transaction_date = ? AND accountName LIKE ?
                OR accountNumber ? OR phonenumber LIKE ? LIMIT ? OFFSET ?`;
                const searchPattern = `%${searchPhones}%`;
                const values = [depositwithdrawal, date, searchKeyword, searchKeyword, searchPattern, pageSize, offset];
                connection.query(sql_deposit, values, (error, resultDeposit) => {
                    if (error) {
                        console.log(error)
                    } else {
                        let sql_statusTrue = `SELECT * FROM logfinanceuser WHERE tpyefinance = ? AND transaction_date = ? AND status = ?
                                AND accountName LIKE ? OR accountNumber LIKE ? OR phonenumber LIKE ? LIMIT ? OFFSET ?`;
                        const searchPattern = `%${searchPhones}%`;
                        const values = [depositwithdrawal, date, "สำเร็จ", searchKeyword, searchKeyword, searchPattern, pageSize, offset];
                        connection.query(sql_statusTrue, values, (error, resultstatusTrue) => {
                            if (error) {
                                console.log(error)
                            } else {
                                let sql_statusFalse = `SELECT * FROM logfinanceuser WHERE tpyefinance = ? AND transaction_date = ? AND status = ?
                                AND accountName LIKE ? OR accountNumber LIKE ? OR phonenumber LIKE ? LIMIT ? OFFSET ?`;
                                const searchPattern = `%${searchPhones}%`;
                                const values = [depositwithdrawal, date, "ไม่สำเส็จ", searchKeyword, searchKeyword, searchPattern, pageSize, offset];
                                connection.query(sql_statusFalse, values, (error, resultstatusFalse) => {
                                    if (error) {
                                        console.log(error);
                                    } else {
                                        let sql_statusUnbound = `SELECT * FROM logfinanceuser WHERE tpyefinance = ? AND transaction_date = ? AND status = ?
                                        AND accountName LIKE ? OR accountNumber LIKE ? OR phonenumber LIKE ? LIMIT ? OFFSET ?`;
                                        const searchPattern = `%${searchPhones}%`;
                                        const values = [depositwithdrawal, date, "ที่ยังไม่ผูก", searchKeyword, searchKeyword, searchPattern, pageSize, offset];
                                        connection.query(sql_statusUnbound, values, (error, resultstatusUnbound) => {
                                            if (error) {
                                                console.log(error)
                                            } else {
                                                let sql_statusWait = `SELECT * FROM logfinanceuser WHERE tpyefinance = ? AND transaction_date = ? AND status = ?
                                                        AND accountName LIKE ? OR accountNumber LIKE ? OR phonenumber LIKE ? LIMIT ? OFFSET ?`;
                                                const searchPattern = `%${searchPhones}%`;
                                                const values = [depositwithdrawal, date, "รอ", searchKeyword, searchKeyword, searchPattern, pageSize, offset];
                                                connection.query(sql_statusWait, values, (error, resultstatusWait) => {
                                                    if (error) {
                                                        console.log(error)
                                                    } else {
                                                        let sql_statusNotready = `SELECT * FROM logfinanceuser WHERE tpyefinance = ? AND transaction_date = ? AND status = ?
                                                            AND accountName LIKE ? OR accountNumber LIKE ? OR phonenumber LIKE ? LIMIT ? OFFSET ?`;
                                                        const searchPattern = `%${searchPhones}%`;
                                                        const values = [depositwithdrawal, date, "ยังไม่เรียบร้อย", searchKeyword, searchKeyword, searchPattern, pageSize, offset];
                                                        connection.query(sql_statusNotready, values, (error, resultstatusNotready) => {
                                                            if (error) {
                                                                console.log(error);
                                                            } else {
                                                                let sql = `SELECT * FROM totalamountdaily WHERE agentid = '${agent_ID}' AND date = '${date}' AND typeaction = '${depositwithdrawal}'`;
                                                                connection.query(sql, (error, results) => {
                                                                    res.send({
                                                                        dataDeposit: resultDeposit,
                                                                        datastatusTrue: resultstatusTrue,
                                                                        datastatusFalse: resultstatusFalse,
                                                                        dataUnbound: resultstatusUnbound,
                                                                        datastatusWait: resultstatusWait,
                                                                        datastatusNotready: resultstatusNotready,
                                                                        valusDataDeposit: resultDeposit.length,
                                                                        valusDatastatusTrue: resultstatusTrue.length,
                                                                        valusDatastatusFalse: resultstatusFalse.length,
                                                                        valusdataUnbound: resultstatusUnbound.length,
                                                                        valusdatastatusWait: resultstatusWait.length,
                                                                        valusdatastatusNotready: resultstatusNotready.length,
                                                                        total: resultDeposit.length,
                                                                        accountreport: results
                                                                    });
                                                                    res.end();
                                                                });
                                                            }
                                                        });
                                                    }
                                                });
                                            }
                                        });
                                    }
                                });
                            }
                        });
                    }
                });
            } catch (err) {
                if (!err.statusCode) {
                    err.statusCode = 500;
                }
                next(err);
            }
        } else {
            let sql = `SELECT * FROM totalamountdaily WHERE agentid = '${agent_ID}' AND date = '${date}' AND typeaction = '${depositwithdrawal}'`;
            connection.query(sql, (error, results) => {
                res.send({
                    dataDeposit: [],
                    datastatusTrue: [],
                    datastatusFalse: [],
                    dataUnbound: [],
                    datastatusWait: [],
                    datastatusNotready: [],
                    valusDataDeposit: 0,
                    valusDatastatusTrue: 0,
                    valusDatastatusFalse: 0,
                    valusdataUnbound: 0,
                    valusdatastatusWait: 0,
                    valusdatastatusNotready: 0,
                    total: 0,
                    accountreport: results
                });
                res.end();
            });
        }
    }
};

//http://localhost:5000/post/getDepositaccount/:agent_id getDepositaccount
exports.getDepositaccount = (req, res) => {
    const agent_id = req.params.agent_id;
    let sql = `SELECT * FROM depositaccount WHERE agent_id = "${agent_id}"`;
    connection.query(sql, (error, results) => {
        if (error) { console.log(error) }
        res.send({
            data: results
        });
        res.end();
    });
}

//http://localhost:5000/post/getOneDepositaccount getOneDepositaccount
exports.getOneDepositaccount = (req, res) => {
    const numberAccount = req.params.numberAccount;
    let sql = `SELECT * FROM depositaccount WHERE accountNumber = ${numberAccount}`;
    connection.query(sql, (error, results) => {
        if (error) { console.log(error) }
        res.send({
            data: results
        });

        res.end();
    });
}

http: //localhost:5000/post/creditPromotion Add creditPromotion
exports.createDepositaccount = async (req, res, next) => {
    const agent_ID = req.body.agent_ID;
    const account_name = req.body.account_name;
    const amount = req.body.Amount;
    const bank = req.body.bank;
    const nameAccount = req.body.nameAccount;
    const leakedPro = req.body.leakedPro;
    const numberAccount = req.body.numberAccount;
    const imgbank = req.body.imgbank;
    const active = req.body.active;
    let sql = `INSERT INTO depositaccount (bankName, status, accountNumber, algorithm, activestatus, accountRocked, autorocker, imgbank, accountName, nameAccount) 
 value ('${bank}','${"แก้ไขไม่ได้ เนื่องจากผูก Api"}','${numberAccount}','${leakedPro}','${active}','${"Test"}','${amount}','${imgbank}','${account_name}','${nameAccount}')`;
    connection.query(sql, (error, result) => {
        try {
            if (error) { console.log(error) }
            res.send({
                message: "Data created Success"
            });
            res.end();
        } catch (err) {
            if (!err.statusCode) { err.statusCode = 500; }
            next(err);
        }
    });
};

http: //localhost:5000/post/updateDepositaccount UpdateDepositaccount
exports.updateDepositaccount = async (req, res, next) => {
    const account_name = req.body.account_name;
    const amount = req.body.Amount;
    const bank = req.body.bank;
    const nameAccount = req.body.nameAccount;
    const imgbank = req.body.imgbank;
    const numberAccount = req.body.numberAccount;

    let sql = `UPDATE depositaccount set bankName = '${bank}', autorocker = '${amount}', imgbank = '${imgbank}', accountName = '${account_name}', nameAccount = '${nameAccount}' 
    WHERE accountNumber ='${numberAccount}'`;
    connection.query(sql, (error, result) => {
        try {
            if (error) { console.log(error) }
            res.send({
                message: "Data update Success"
            });
            res.end();
        } catch (err) {
            if (!err.statusCode) { err.statusCode = 500; }
            next(err);
        }

    });
};

http: //localhost:5000/post/createWithdrawalaccount Add createWithdrawalaccount
exports.createWithdrawalaccount = async (req, res, next) => {
    const agent_ID = req.body.agent_ID;
    const account_name = req.body.account_name;
    const bank = req.body.bank;
    const nameAccount = req.body.nameAccount;
    const leakedPro = req.body.leakedPro;
    const numberAccount = req.body.numberAccount;
    const imgbank = req.body.imgbank;
    const active = req.body.active;
    const checkboxLcondition = req.body.checkboxLcondition;
    const checkboxListauto = req.body.checkboxListauto;
    const checkboxListbillPage = req.body.checkboxListbillPage;
    const checkboxListsavings = req.body.checkboxListsavings;
    const checkboxPromotion = req.body.checkboxPromotion;
    const groupBronze = req.body.groupBronze;
    const groupDiamond = req.body.groupDiamond;
    const groupGold = req.body.groupGold;
    const groupNewMember = req.body.groupNewMember;
    const groupSilver = req.body.groupSilver;
    const withdrawOver = req.body.withdrawOver;

    let sql = `INSERT INTO withdrawalaccount (bankName, status, accountNumber, algorithm, activestatus, imgbank, accountName, nameAccount, groupNewMember, groupBronze, groupSilver, groupGold,
        groupDiamond, auto_withdrawal, savingaccount, use_condition, for_promotion, billingpage, withdraw_over) 
 value ('${bank}','${"แก้ไขไม่ได้ เนื่องจากผูก Api"}','${numberAccount}','${leakedPro}','${active}','${imgbank}','${account_name}','${nameAccount}','${groupNewMember}','${groupBronze}',
 '${groupSilver}','${groupGold}','${groupDiamond}','${checkboxListauto}','${checkboxListsavings}','${checkboxLcondition}','${checkboxPromotion}','${checkboxListbillPage}','${withdrawOver}')`;
    connection.query(sql, (error, result) => {
        try {
            if (error) { console.log(error) }
            res.send({
                message: "Data created Success"
            });
            res.end();
        } catch (err) {
            if (!err.statusCode) { err.statusCode = 500; }
            next(err);
        }
    });
};

http: //localhost:5000/post/updateWithdrawalaccount UpdateWithdrawalaccount
exports.updateWithdrawalaccount = async (req, res, next) => {
    const agent_ID = req.body.agent_ID;
    const account_name = req.body.account_name;
    const bank = req.body.bank;
    const nameAccount = req.body.nameAccount;
    const leakedPro = req.body.leakedPro;
    const numberAccount = req.body.numberAccount;
    const imgbank = req.body.imgbank;
    const active = req.body.active;
    const checkboxLcondition = req.body.checkboxLcondition;
    const checkboxListauto = req.body.checkboxListauto;
    const checkboxListbillPage = req.body.checkboxListbillPage;
    const checkboxListsavings = req.body.checkboxListsavings;
    const checkboxPromotion = req.body.checkboxPromotion;
    const groupBronze = req.body.groupBronze;
    const groupDiamond = req.body.groupDiamond;
    const groupGold = req.body.groupGold;
    const groupNewMember = req.body.groupNewMember;
    const groupSilver = req.body.groupSilver;
    const withdrawOver = req.body.withdrawOver;

    let sql = `UPDATE withdrawalaccount set bankName = '${bank}', imgbank = '${imgbank}', accountName = '${account_name}', nameAccount = '${nameAccount}',
    auto_withdrawal = '${checkboxListauto}', savingaccount = '${checkboxListsavings}', use_condition = '${checkboxLcondition}', for_promotion = '${checkboxPromotion}', billingpage = '${checkboxListbillPage}', withdraw_over = '${withdrawOver}', 
    groupNewMember = '${groupNewMember}', groupBronze = '${groupBronze}', groupSilver = '${groupSilver}', groupGold = '${groupGold}', groupDiamond = '${groupDiamond}', activestatus = '${active}'
    WHERE accountNumber ='${numberAccount}'`;
    connection.query(sql, (error, result) => {
        try {
            if (error) { console.log(error) }
            res.send({
                message: "Data update Success"
            });
            res.end();
        } catch (err) {
            if (!err.statusCode) { err.statusCode = 500; }
            next(err);
        }
    });
};

//http://localhost:5000/post/getWithdrawalaccount getWithdrawalaccount
exports.getWithdrawalaccount = (req, res) => {
    let sql = `SELECT * FROM withdrawalaccount`;
    connection.query(sql, (error, results) => {
        if (error) { console.log(error) }
        res.send({
            data: results
        });
        res.end();
    });
}

//http://localhost:5000/post/getOneWithdrawalaccount getOneWithdrawalaccount
exports.getOneWithdrawalaccount = (req, res) => {
    const numberAccount = req.params.numberAccount;
    let sql = `SELECT * FROM withdrawalaccount WHERE accountNumber = ${numberAccount}`;
    connection.query(sql, (error, results) => {
        if (error) { console.log(error) }
        res.send({
            data: results
        });
        res.end();
    });
}

http: //localhost:5000/post/addUserGroupInformation Add addUserGroupInformation
exports.addUserGroupInformation = async (req, res, next) => {
    const agent_id = req.body.agent_id;
    const color = req.body.color;
    const password = req.body.password;
    const minimumWithdrawal = req.body.minimumWithdrawal;
    const withdrawalday = req.body.withdrawalday;
    const nameaccoun = req.body.nameaccoun;
    const minimumDeposit = req.body.minimumDeposit;
    const withdrawalsperday = req.body.withdrawalsperday;
    const groupmaster = req.body.groupmaster;
    const secondaryaccount = req.body.secondaryaccount;
    const secondaryaccountII = req.body.secondaryaccountII;
    const secondaryaccountIII = req.body.secondaryaccountIII;
    const account_number = req.body.account_number;

    let sql_depositaccount = `SELECT * FROM depositaccount WHERE accountNumber = "${account_number}"`;
    connection.query(sql_depositaccount, (error, results) => {
        if (error) { console.log(error) } else {
            let sql = `INSERT INTO mastergroup (agent_id, color, password, minwithdrawal, withdrawalday, nameaccoun, mindeposit, withdrawalsperday, groupmaster,
            depositaccount, secondaryaccount, secondaryaccountII, secondaryaccountIII, account_name, account_number, imgbank) 
            value ('${agent_id}','${color}','${password}','${minimumWithdrawal}','${withdrawalday}','${nameaccoun}','${minimumDeposit}','${withdrawalsperday}','${groupmaster}',
            '${results[0].accountName}','${secondaryaccount}','${secondaryaccountII}','${secondaryaccountIII}','${results[0].accountName}','${account_number}','${results[0].imgbank}')`;
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
        }
    });
};

//http://localhost:5000/post/getGroupccount/:agent_id getGroupccount
exports.getGroup = (require, response) => {
    const agent_id = require.body.agent_id;
    const searchKeyword = require.body.searchKeyword;
    const pageSize = require.body.pageSize;
    const pageNumber = require.body.pageIndex;
    const offset = (pageNumber - 1) * pageSize;
    //console.log(agent_id)
    if (searchKeyword === '') {
        let sql = `SELECT * FROM mastergroup WHERE agent_id = "${agent_id}" LIMIT ${pageSize} OFFSET ${offset}`;
        connection.query(sql, async (error, results) => {
            if (error) { console.log(error); }
            const totalCount = `SELECT COUNT(*) as count FROM admin WHERE status_delete='N' `
            connection.query(totalCount, (error, res) => {
                if (error) { console.log(error); }
                response.send({
                    data: results,
                    total: res[0].count
                });

                response.end();
            });
        });
    } else {
        let sql = `SELECT * FROM mastergroup WHERE agent_id = "${agent_id}" AND 
        depositaccount LIKE '%${searchKeyword}%' OR account_number LIKE '%${searchKeyword}%' LIMIT ${pageSize} OFFSET ${offset}`;
        connection.query(sql, async (error, results) => {
            if (error) { console.log(error); }
            response.send({
                data: results,
                total: results.length
            });
            response.end();
        });
    }
}