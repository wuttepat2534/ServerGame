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
const Finance = require('./Finance')
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

    static promotionDeposit(quantity, dataUser, idPromotion, bill_number, totaltopup, nameimg,
        statusFinance, qrcodeData, transRef, destinationAccount, destinationAccountNumber, formattedDate, formattedNumber) {
        return new Promise((resolve, reject) => {

            if (dataUser.passwordpromotion !== NULL){
                let rank = 'NewMember';
            const totaltopup = dataUser.total_top_up_amount + quantity;

            if (totaltopup >= 200000) {
                rank = "Bronze";
            } else if (totaltopup >= 1000000) {
                rank = "Silver";
            } else if (totaltopup >= 3000000) {
                rank = "Gold";
            } else if (totaltopup >= 10000000) {
                rank = "Diamond";
            } else {
                rank = "NewMember";
            }

            try {
                let sql_Promotion = `SELECT * FROM creditpromotion WHERE id ='${idPromotion}'`;
                connection.query(sql_Promotion, (error, resultPromotion) => {
                    if (error) {
                        console.log(error)
                    } else {
                        if (resultPromotion[0].receiving_data_type === "ฝากเงินครั้งแรก") {
                            if (dataUser.recharge_times === 0) {
                                if (resultPromotion[0].typebonus === "Percent") {
                                    if (quantity > resultPromotion[0].valusbunus) {
                                        const balancebunus = quantity * resultPromotion[0].bunus / 100;
                                        if (balancebunus > resultPromotion[0].maxbunus) {
                                            balancebunus = resultPromotion[0].maxbunus
                                        }
                                        const balance = quantity + balancebunus
                                        const turnover = balancebunus * resultPromotion[0].multiplier;

                                        let sql_before = `INSERT INTO logfinanceuser (idUser, agent_id, accountName, accountNumber, phonenumber, tpyefinance, quantity, creditbonus, 
                                            balance_before, balance, bill_number, numberbill, status, transaction_date, time, bank, imgBank, destinationAccount, destinationAccountNumber, trans_ref, qrcodeData, nameimg) value 
                                            ('${dataUser.id}','${dataUser.agent_id}','${dataUser.accountName}','${accountNumber}','${phonenumber}','${'ฝาก'}','${quantity}','${0}','${dataUser.credit}'
                                            ,'${balance}','${formattedDate}${formattedNumber}','${billnum}','${statusFinance}',now(),now(),'${dataUser.bank}','${dataUser.imgBank}'
                                            ,'${destinationAccount}','${destinationAccountNumber}','${transRef}', '${qrcodeData}', '${nameimg}')`;
                                        if (statusFinance === "สำเร็จ") {
                                            let totalamountdaily = logTotalAmount(resultUser, formattedDate, 'ฝาก', destinationAccount, destinationAccountNumber, quantity, statusFinance)
                                            connection.query(sql_before, (error, result) => {
                                                if (error) {
                                                    console.log(error)
                                                } else {

                                                    let sql = `UPDATE member set credit = '${balance}', bonususer = '${balancebunus}', recharge_times = '${resultvalusUserDeposit[0].recharge_times + 1}', turnover = '${turnover}',
                                                    total_top_up_amount = '${totaltopup}' groupmember = '${rank}', promotionuser = '${resultPromotion[0].namepromotion}'  
                                                    WHERE id='${dataUser.id}'`;
                                                    connection.query(sql, (error, resultAfter) => {
                                                        if (error) {
                                                            console.log(error);
                                                        }
                                                        let updateRepostFinance = Finance.UpdateLogRepostFinance(dataUser.username, 'ฝาก', quantity)
                                                        const post = [
                                                            {
                                                                username: resultUser[0].username,
                                                                deposit_member: quantity,
                                                                message: "มีการแจ้งฝากเงินจำนวน"
                                                            }]

                                                        let jsArray = { status: "รับโปรโมชั่นเรียบร้อย" };
                                                        resolve(jsArray);
                                                    });

                                                }
                                            });
                                        } else {
                                            let jsArray = { status: "ไม่สามารถรับโปรโมชั่นได้" };
                                            resolve(jsArray);
                                        }
                                    }
                                } else {
                                    if (quantity > resultPromotion[0].valusbunus) {
                                        let sql_before = `INSERT INTO logfinanceuser (idUser, agent_id, accountName, accountNumber, phonenumber, tpyefinance, quantity, creditbonus, 
                                            balance_before, balance, bill_number, numberbill, status, transaction_date, time, bank, imgBank, destinationAccount, destinationAccountNumber, trans_ref, qrcodeData, nameimg) value 
                                            ('${dataUser.id}','${dataUser.agent_id}','${dataUser.accountName}','${accountNumber}','${phonenumber}','${'ฝาก'}','${quantity}','${0}','${dataUser.credit}'
                                            ,'${balance}','${formattedDate}${formattedNumber}','${billnum}','${statusFinance}',now(),now(),'${dataUser.bank}','${dataUser.imgBank}'
                                            ,'${destinationAccount}','${destinationAccountNumber}','${transRef}', '${qrcodeData}', '${nameimg}')`;
                                        if (statusFinance === "สำเร็จ") {
                                            let totalamountdaily = logTotalAmount(resultUser, formattedDate, 'ฝาก', destinationAccount, destinationAccountNumber, quantity, statusFinance)

                                            connection.query(sql_before, (error, result) => {
                                                if (error) {
                                                    console.log(error)
                                                } else {

                                                    let sql = `UPDATE member set credit = '${balance}', bonususer = '${balancebunus}', recharge_times = '${resultvalusUserDeposit[0].recharge_times + 1}', turnover = '${turnover}',
                                                    total_top_up_amount = '${totaltopup}' groupmember = '${rank}', promotionuser = '${resultPromotion[0].namepromotion}'  
                                                    WHERE id='${dataUser.id}'`;
                                                    connection.query(sql, (error, resultAfter) => {
                                                        if (error) {
                                                            console.log(error);
                                                        }
                                                        let updateRepostFinance = Finance.UpdateLogRepostFinance(dataUser.username, 'ฝาก', quantity)
                                                        const post = [
                                                            {
                                                                username: resultUser[0].username,
                                                                deposit_member: quantity,
                                                                message: "มีการแจ้งฝากเงินจำนวน"
                                                            }]

                                                        let jsArray = { status: "รับโปรโมชั่นเรียบร้อย" };
                                                        resolve(jsArray);
                                                    });

                                                }
                                            });
                                        } else {
                                            let jsArray = { status: "ไม่สามารถรับโปรโมชั่นได้" };
                                            resolve(jsArray);
                                        }
                                    }
                                }
                            } else {
                                let jsArray = { status: "ไม่สามารถรับโปรโมชั่นได้" };
                                resolve(jsArray);
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
                                                            let jsArray = { status: "รับโปรโมชั่นเรียบร้อย" };
                                                            resolve(jsArray);
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
                                                            let jsArray = { status: "รับโปรโมชั่นเรียบร้อย" };
                                                            resolve(jsArray);
                                                        });
                                                    }
                                                });
                                            }
                                        }
                                    } else {
                                        let jsArray = { status: "ไม่สามารถรับโปรโมชั่นได้" };
                                        resolve(jsArray);
                                    }
                                }
                            })
                        } else {
                            let jsArray = { status: "ไม่สามารถรับโปรโมชั่นได้" };
                            resolve(jsArray);
                        }
                    }
                })
            } catch (err) {
                if (!err.statusCode) {
                    err.statusCode = 500;
                }
                next(err);
            }} else {
                let jsArray = { status: "ไม่สามารถรับโปรโมชั่นได้" };
                resolve(jsArray);
            }
        })
    }

    static promotionDay(quantity, dataUser, idPromotion, bill_number) {

    }
};

function automaticFunctionTest() {
    console.log('Automatic function is running at 03:54 PM.');
}


function logTotalAmount(resultUser, formattedDateBill, type, destinationAccount, destinationAccountNumber, quantity, statusFinance) {
    let sql_deposit = `SELECT billmatched, complated, bankName, balance, imgbank FROM depositaccount WHERE accountName ='${destinationAccount}' OR accountNumber = '${destinationAccountNumber}' ORDER BY accountNumber ASC`;
    let sql_before = `SELECT * FROM totalamountdaily WHERE date ='${formattedDateBill}' AND typeaction = '${type}' ORDER BY date ASC`;
    connection.query(sql_before, (error, resulttotal) => {
        if (error) {
            console.log(error)
        } else {
            connection.query(sql_deposit, (error, resulttotaldeposit) => {
                if (resulttotal.length === 0) {
                    if (statusFinance === ('สำเร็จ')) {
                        //console.log(destinationAccount, destinationAccountNumber)
                        let sql = `UPDATE depositaccount set balance = '${resulttotaldeposit[0].billmatched + quantity}', billmatched = '${resulttotaldeposit[0].billmatched + quantity}', complated = '${resulttotaldeposit[0].complated + quantity}'
                    WHERE accountName ='${destinationAccount}' AND accountNumber = '${destinationAccountNumber}' ORDER BY accountName ASC`;
                        connection.query(sql, (error, result) => {
                            if (error) {
                                console.log(error)
                            } else {
                                let sql_before = `INSERT INTO totalamountdaily (agentid, accountName, accountNumber, billmatched, complated, balance, bankname, date, time, typeaction, imgbank) value 
                                ('${resultUser[0].agent_id}','${destinationAccount}','${destinationAccountNumber}','${quantity}','${quantity}','${resulttotaldeposit[0].balance}','${resulttotaldeposit[0].bankName}',now() ,now(),'${type}','${resulttotaldeposit[0].imgbank}')`;

                                connection.query(sql_before, (error, resultDeposit) => {
                                    if (error) {
                                        console.log(error);
                                    } else {
                                        let success = 'Success'
                                        return success
                                    }
                                });
                            }
                        });

                    } else {
                        let sql = `UPDATE depositaccount set balance = '${resulttotaldeposit[0].billmatched + quantity}', billmatched = '${resulttotaldeposit[0].billmatched + quantity}', complated = '${resulttotaldeposit[0].complated}'
                        WHERE accountName ='${destinationAccount}' AND accountNumber = '${destinationAccountNumber}' ORDER BY accountName ASC`;
                        connection.query(sql, (error, result) => {
                            if (error) {
                                console.log(error)
                            } else {
                                let sql_before = `INSERT INTO totalamountdaily (agentid, accountName, accountNumber, billmatched, complated, balance, bankname, date, time, typeaction, imgbank) value 
                                    ('${resultUser[0].agent_id}','${destinationAccount}','${destinationAccountNumber}','${quantity}','${0}','${resulttotaldeposit[0].balance}','${resulttotaldeposit[0].bankName}',now() ,now(),'${type}','${resulttotaldeposit[0].imgbank}')`;

                                connection.query(sql_before, (error, resultDeposit) => {
                                    if (error) {
                                        console.log(error);
                                    } else {
                                        let success = 'Success'
                                        return success
                                    }
                                });
                            }
                        });
                    }

                } else {
                    if (statusFinance === ('สำเร็จ')) {
                        let sql = `UPDATE totalamountdaily set billmatched = '${resulttotal[0].billmatched + quantity}', complated = '${resulttotal[0].complated + quantity}',
                        balance = '${resulttotal[0].complated + quantity}' WHERE date ='${formattedDateBill}' AND typeaction = '${type}' ORDER BY date ASC`;
                        connection.query(sql, (error, resultUpdate) => {
                            if (error) {
                                console.log(error);
                            } else {
                                connection.query(sql_deposit, (error, resulttotaldeposit) => {
                                    if (error) {
                                        console.log(error)
                                    } else {
                                        console.log(resulttotaldeposit)
                                        let sql = `UPDATE depositaccount set balance = '${resulttotaldeposit[0].billmatched + quantity}', billmatched = '${resulttotaldeposit[0].billmatched + quantity}', complated = '${resulttotaldeposit[0].complated + quantity}'
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
                        let sql = `UPDATE totalamountdaily set billmatched = '${resulttotal[0].billmatched + quantity}', complated = '${resulttotal[0].complated + 0}',
                        balance = '${resulttotal[0].complated + 0}' WHERE date ='${formattedDateBill}' AND typeaction = '${type}' ORDER BY date ASC`;
                        connection.query(sql, (error, resultUpdate) => {
                            if (error) {
                                console.log(error);
                            } else {
                                connection.query(sql_deposit, (error, resulttotaldeposit) => {
                                    if (error) {
                                        console.log(error)
                                    } else {
                                        console.log(resulttotaldeposit)
                                        let sql = `UPDATE depositaccount set balance = '${resulttotaldeposit[0].billmatched + 0}', billmatched = '${resulttotaldeposit[0].billmatched + quantity}', complated = '${resulttotaldeposit[0].complated + 0}'
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
            })
        }
    })
}

function logTotalAmountWithdraw(resultUser, formattedDateBill, type, destinationAccount, destinationAccountNumber, quantity, statusFinance) {
    let sql_deposit = `SELECT billmatched, complated, bankName, balance, imgbank FROM withdrawalaccount WHERE accountName ='${destinationAccount}' AND accountNumber = '${destinationAccountNumber}' ORDER BY accountName ASC`;
    let sql_before = `SELECT * FROM totalamountdaily WHERE date ='${formattedDateBill}' AND typeaction = '${type}' ORDER BY date ASC`;
    connection.query(sql_before, (error, resulttotal) => {
        if (error) {
            console.log(error)
        } else {
            connection.query(sql_deposit, (error, resulttotaldeposit) => {
                if (resulttotal.length === 0) {
                    if (statusFinance === ('สำเร็จ')) {
                        let sql = `UPDATE withdrawalaccount set balance = '${resulttotaldeposit[0].billmatched + quantity}', billmatched = '${resulttotaldeposit[0].billmatched + quantity}', complated = '${resulttotaldeposit[0].complated + quantity}'
                    WHERE accountName ='${destinationAccount}' AND accountNumber = '${destinationAccountNumber}' ORDER BY accountName ASC`;
                        connection.query(sql, (error, result) => {
                            if (error) {
                                console.log(error)
                            } else {
                                let sql_before = `INSERT INTO totalamountdaily (agentid, accountName, accountNumber, billmatched, complated, bankname, balance, date, time, typeaction, imgbank) value 
                                ('${resultUser[0].agent_id}','${destinationAccount}','${destinationAccountNumber}','${quantity}','${quantity}','${resulttotaldeposit[0].bankName}','${resulttotaldeposit[0].balance}',now() ,now(),'${type}','${resulttotaldeposit[0].imgbank}')`;

                                connection.query(sql_before, (error, resultDeposit) => {
                                    if (error) {
                                        console.log(error);
                                    } else {
                                        let success = 'Success'
                                        return success
                                    }
                                });
                            }
                        });

                    } else {
                        let sql = `UPDATE withdrawalaccount set balance = '${resulttotaldeposit[0].billmatched + quantity}', billmatched = '${resulttotaldeposit[0].billmatched + quantity}', complated = '${resulttotaldeposit[0].complated}'
                        WHERE accountName ='${destinationAccount}' AND accountNumber = '${destinationAccountNumber}' ORDER BY accountName ASC`;
                        connection.query(sql, (error, result) => {
                            if (error) {
                                console.log(error)
                            } else {
                                let sql_before = `INSERT INTO totalamountdaily (agentid, accountName, accountNumber, billmatched, complated, bankname, balance, date, time, typeaction, imgbank) value 
                                    ('${resultUser[0].agent_id}','${destinationAccount}','${destinationAccountNumber}','${quantity}','${0}','${resulttotaldeposit[0].bankName}','${resulttotaldeposit[0].balance}',now() ,now(),'${type}','${resulttotaldeposit[0].imgbank}')`;

                                connection.query(sql_before, (error, resultDeposit) => {
                                    if (error) {
                                        console.log(error);
                                    } else {
                                        let success = 'Success'
                                        return success
                                    }
                                });
                            }
                        });

                    }

                } else {
                    if (statusFinance === ('สำเร็จ')) {
                        let sql = `UPDATE totalamountdaily set billmatched = '${resulttotal[0].billmatched + quantity}', complated = '${resulttotal[0].complated + quantity}',
                        balance = '${resulttotal[0].complated + quantity}' WHERE date ='${formattedDateBill}' AND typeaction = '${type}' ORDER BY date ASC`;
                        connection.query(sql, (error, resultUpdate) => {
                            if (error) {
                                console.log(error);
                            } else {
                                connection.query(sql_deposit, (error, resulttotaldeposit) => {
                                    if (error) {
                                        console.log(error)
                                    } else {
                                        console.log(resulttotaldeposit)
                                        let sql = `UPDATE withdrawalaccount set balance = '${resulttotaldeposit[0].billmatched + quantity}', billmatched = '${resulttotaldeposit[0].billmatched + quantity}', complated = '${resulttotaldeposit[0].complated + quantity}'
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
                        let sql = `UPDATE totalamountdaily set billmatched = '${resulttotal[0].billmatched + quantity}', complated = '${resulttotal[0].complated + 0}',
                        balance = '${resulttotal[0].complated + 0}' WHERE date ='${formattedDateBill}' AND typeaction = '${type}' ORDER BY date ASC`;
                        connection.query(sql, (error, resultUpdate) => {
                            if (error) {
                                console.log(error);
                            } else {
                                connection.query(sql_deposit, (error, resulttotaldeposit) => {
                                    if (error) {
                                        console.log(error)
                                    } else {
                                        console.log(resulttotaldeposit)
                                        let sql = `UPDATE withdrawalaccount set balance = '${resulttotaldeposit[0].billmatched + 0}', billmatched = '${resulttotaldeposit[0].billmatched + quantity}', complated = '${resulttotaldeposit[0].complated + 0}'
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
            })
        }
    })
}