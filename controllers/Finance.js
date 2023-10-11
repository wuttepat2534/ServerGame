const express = require('express');
const { response } = require("express");
const mysql = require('mysql2') //npm install mysql2
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
const os = require('os');
const md5 = require('md5');
const multer = require('multer');
const upload = multer({ dest: 'uploads/' });
const axios = require('axios'); //npm install axios
const app = express();
app.use(express.static('public'));
require('dotenv').config()

const connection = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    database: process.env.DB_DATABASE,
    password: process.env.DB_PASSWORD
});

function formatNumber(num) {
    return String(num).padStart(5, '0');
}

module.exports = class Post {
    constructor(email, password, role) {
        this.email = email;
        this.password = password;
        this.role = role;
    }

    static CheckInformation(restest, dataUser) {
        return new Promise((resolve, reject) => {

            const resFinance = restest;
            const dataUsers = dataUser;

            let Bank;

            switch (resFinance.data.sendingBank) {
                case '002':
                    Bank = "ธนาคารกรุงเทพ";
                    break;
                case '004':
                    Bank = "ธนาคารกสิกรไทย";
                    break;
                case '006':
                    Bank = "ธนาคารกรุงไทย";
                    break;
                case '011':
                    Bank = "ธนาคารทหารไทยธนชาต";
                    break;
                case '014':
                    Bank = "ธนาคารไทยพาณิชย์";
                    break;
                case '025':
                    Bank = "ธนาคารกรุงศรีอยุธยา";
                    break;
                case '069':
                    Bank = "ธนาคารเกียรตินาคินภัทร";
                    break;
                case '022':
                    Bank = "ธนาคารซีไอเอ็มบีไทย";
                    break;
                case '071':
                    Bank = "ธนาคารไทยเครดิตเพื่อรายย่อย";
                    break;
                case '067':
                    Bank = "ธนาคารทิสโก้";
                    break;
                case '024':
                    Bank = "ธนาคารยูโอบี";
                    break;
                case '070':
                    Bank = 'ธนาคารไอซีบีซี (ไทย)';
                    break;
                case '098':
                    Bank = "ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย";
                    break;
                case '034':
                    Bank = "ธนาคารเพื่อการเกษตรและสหกรณ์การเกษตร";
                    break;
                case '035':
                    Bank = "ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย";
                    break;
                case '030':
                    Bank = "ธนาคารออมสิน";
                    break;
                case '033':
                    Bank = 'ธนาคารอาคารสงเคราะห์';
                    break;
                default:
                    Bank = "ธนาคารไทยพาณิชย์";
            }

            const inputString = resFinance.data.sender.account.value;
            const last4Digits = inputString.replace(/\D/g, '').slice(-4);

            const inputStringUser = resFinance.data.receiver.account.value;
            const last4DigitsUser = inputStringUser.replace(/\D/g, '').slice(-4);

            if (Bank !== "ธนาคารกสิกรไทย" && Bank !== "ธนาคารกรุงศรีอยุธยา") {
                let sql_deposit = `SELECT * FROM depositaccount WHERE activestatus = "เปิดใช้งาน" AND RIGHT(accountNumber, 4) LIKE ?`;
                connection.query(sql_deposit, ['%' + last4DigitsUser], (error, depositData) => {
                    try {
                        if (error) {
                            console.log(error);
                            reject("ผิดพลาด");
                        }
                        else {
                            const data = depositData;
                            if (data.length !== 0 || data.length > 0) {
                                let sql_LogDeposit = `SELECT * FROM logfinanceuser WHERE trans_ref ='${resFinance.data.transRef}'`;
                                connection.query(sql_LogDeposit, async (error, logDeposit_transRef) => {
                                    if (error) {
                                        console.log(error);
                                        reject(error);
                                    } else {
                                        const dataLog = logDeposit_transRef;
                                        if (dataLog.length < 1) {
                                            let sql_NameAccount = `SELECT * FROM member WHERE RIGHT(accountNumber, 4) LIKE ? AND bank = '${Bank}' AND phonenumber = '${dataUsers.phonenumber}'`;
                                            connection.query(sql_NameAccount, ['%' + last4Digits], async (error, nameAccount) => {
                                                if (error) {
                                                    console.log(error);
                                                    reject(error);
                                                } else {
                                                    const dataUserAccount = nameAccount;
                                                    if (dataUserAccount.length !== 0 || dataUserAccount.length > 0) {
                                                        const response = await axios.post("https://relaxtimecafe.fun/post/financeUser", {
                                                            resFinance: resFinance,
                                                            type: dataUsers.type,
                                                            quantity: resFinance.data.amount,
                                                            accountNumber: dataUserAccount[0].accountNumber,
                                                            destinationAccountName: resFinance.data.receiver.displayName,
                                                            destinationAccountNumber: data[0].accountNumber,
                                                            phonenumber: dataUsers.phonenumber,
                                                            statusFinance: 'สำเร็จ',
                                                            nameimg: dataUsers.filename,
                                                            transRef: resFinance.data.transRef,
                                                            qrcodeData: resFinance.data.qrcodeData,
                                                            agent_id : dataUsers.agent_id,
                                                        });
                                                        //console.log(response.data.message)
                                                        if (response.data.message === "เติมเงินสำเร็จ") {
                                                            resolve("ฝากเงินสำเสร็จ")
                                                        } else {
                                                            resolve("ฝากเงินไม่สำเร็จกรุณาติดต่อ Admin")
                                                        }
                                                    } else {
                                                        const response = await axios.post("https://relaxtimecafe.fun/post/financeUser", {
                                                            resFinance: resFinance,
                                                            type: dataUsers.type,
                                                            quantity: resFinance.data.amount,
                                                            accountNumber: "ไม่มีเลขบัญชีในระบบ",
                                                            destinationAccountName: resFinance.data.receiver.displayName,
                                                            destinationAccountNumber: data[0].accountNumber,
                                                            phonenumber: dataUsers.phonenumber,
                                                            statusFinance: 'รอ',
                                                            nameimg: dataUsers.filename,
                                                            transRef: resFinance.data.transRef,
                                                            qrcodeData: resFinance.data.qrcodeData,
                                                            agent_id : dataUsers.agent_id,
                                                        });
                                                        if (response.data.message === "บันทึกสำเร็จ") {
                                                            resolve("ชื่อบัญชีที่ได้ลงทะเบียนไม่ถูกต้อง กรุณาตรวจสอบ สลิปโอนเงิน ")
                                                        } else {
                                                            resolve("ล้มเหลวในการทำรายการ")
                                                        }
                                                    }
                                                }
                                            })
                                        } else {
                                            resolve("สลิปนี้เคยถูกใช้งานแล้ว")
                                        }
                                    }
                                })
                            } else {
                                resolve("ไม่มีชื่อบัญชีธนาคารของเว็บ Toonta ในระบบเงินฝาก")
                            }
                        }
                    } catch (err) {
                        if (!err.statusCode) {
                            err.statusCode = 500;
                        }
                    }
                })
            } else {
                console.log(last4DigitsUser)
                let sql_deposit = `SELECT * FROM depositaccount WHERE activestatus = "เปิดใช้งาน" AND SUBSTRING(accountNumber, LENGTH(accountNumber) - 4, 4) = ?`;
                //const searchPattern = searchText + '%';
                connection.query(sql_deposit, [last4DigitsUser], (error, depositData) => {
                    try {
                        if (error) {
                            console.log(error);
                            reject("ผิดพลาด");
                        }
                        else {
                            const data = depositData;
                            if (data.length !== 0 || data.length > 0) {
                                let sql_LogDeposit = `SELECT * FROM logfinanceuser WHERE trans_ref ='${resFinance.data.transRef}'`;
                                connection.query(sql_LogDeposit, async (error, logDeposit_transRef) => {
                                    if (error) {
                                        console.log(error);
                                        reject(error);
                                    } else {
                                        const dataLog = logDeposit_transRef;
                                        if (dataLog.length < 1) {

                                            let sql_NameAccount = `SELECT * FROM member WHERE SUBSTRING(accountNumber, LENGTH(accountNumber) - 4, 4) = ? 
                                            AND bank = '${Bank}' AND phonenumber = '${dataUsers.phonenumber}'`;

                                            connection.query(sql_NameAccount, [last4Digits], async (error, nameAccount) => {
                                                if (error) {
                                                    console.log(error);
                                                    reject(error);
                                                } else {
                                                    const dataUserAccount = nameAccount;
                                                    if (dataUserAccount.length !== 0 || dataUserAccount.length > 0) {
                                                        const response = await axios.post("https://relaxtimecafe.fun/post/financeUser", {
                                                            resFinance: resFinance,
                                                            type: dataUsers.type,
                                                            quantity: resFinance.data.amount,
                                                            accountNumber: dataUsers.accountNumber,
                                                            destinationAccountName: resFinance.data.receiver.displayName,
                                                            destinationAccountNumber: data[0].accountNumber,
                                                            phonenumber: dataUsers.phonenumber,
                                                            statusFinance: 'สำเร็จ',
                                                            nameimg: dataUsers.filename,
                                                            transRef: resFinance.data.transRef,
                                                            qrcodeData: resFinance.data.qrcodeData,
                                                            agent_id : dataUsers.agent_id,
                                                        });
                                                        if (response.data.message === "เติมเงินสำเร็จ") {
                                                            resolve("ฝากเงินสำเสร็จ")
                                                        } else {
                                                            resolve("ฝากเงินไม่สำเร็จกรุณาติดต่อ Admin")
                                                        }
                                                    } else {
                                                        const response = await axios.post("https://relaxtimecafe.fun/post/financeUser", {
                                                            resFinance: resFinance,
                                                            type: dataUsers.type,
                                                            quantity: resFinance.data.amount,
                                                            accountNumber: "ไม่มีเลขบัญชีในระบบ",
                                                            destinationAccountName: resFinance.data.receiver.displayName,
                                                            destinationAccountNumber: data[0].accountNumber,
                                                            phonenumber: dataUsers.phonenumber,
                                                            statusFinance: 'รอ',
                                                            nameimg: dataUsers.filename,
                                                            transRef: resFinance.data.transRef,
                                                            qrcodeData: resFinance.data.qrcodeData,
                                                            agent_id : dataUsers.agent_id,
                                                        });
                                                        if (response.data.message === "เติมเงินไม่สำเร็จ") {
                                                            resolve("ชื่อบัญชีที่ได้ลงทะเบียนไม่ถูกต้อง กรุณาตรวจสอบ สลิปโอนเงิน ")
                                                        } else {
                                                            resolve("ล้มเหลวในการทำรายการ")
                                                        }
                                                    }
                                                }
                                            })
                                        } else {
                                            resolve("สลิปนี้เคยถูกใช้งานแล้ว")
                                        }
                                    }
                                })
                            } else {
                                resolve("ไม่มีชื่อบัญชีธนาคารของเว็บ Toonta ในระบบเงินฝาก")
                            }
                        }
                    } catch (err) {
                        if (!err.statusCode) {
                            err.statusCode = 500;
                        }
                    }
                })
            }
        });
    }

    static Withdrawmoney(resultUser, formattedDate, formattedNumber, billnum, quantity, accountNumber, phonenumber, status) {
        return new Promise((resolve, reject) => {
            console.log(resultUser.bank);

            let Bank;

            switch (resultUser.bank) {
                case '002':
                    Bank = "ธนาคารกรุงเทพ";
                    break;
                case '004':
                    Bank = "ธนาคารกสิกรไทย";
                    break;
                case '006':
                    Bank = "ธนาคารกรุงไทย";
                    break;
                case '011':
                    Bank = "ธนาคารทหารไทยธนชาต";
                    break;
                case '014':
                    Bank = "ธนาคารไทยพาณิชย์";
                    break;
                case '025':
                    Bank = "ธนาคารกรุงศรีอยุธยา";
                    break;
                case '069':
                    Bank = "ธนาคารเกียรตินาคินภัทร";
                    break;
                case '022':
                    Bank = "ธนาคารซีไอเอ็มบีไทย";
                    break;
                case '071':
                    Bank = "ธนาคารไทยเครดิตเพื่อรายย่อย";
                    break;
                case '067':
                    Bank = "ธนาคารทิสโก้";
                    break;
                case '024':
                    Bank = "ธนาคารยูโอบี";
                    break;
                case '070':
                    Bank = 'ธนาคารไอซีบีซี (ไทย)';
                    break;
                case '098':
                    Bank = "ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย";
                    break;
                case '034':
                    Bank = "ธนาคารเพื่อการเกษตรและสหกรณ์การเกษตร";
                    break;
                case '035':
                    Bank = "ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย";
                    break;
                case '030':
                    Bank = "ธนาคารออมสิน";
                    break;
                case '033':
                    Bank = 'ธนาคารอาคารสงเคราะห์';
                    break;
                default:
                    Bank = "ธนาคารไทยพาณิชย์";
            }

            let sql_before = `INSERT INTO withdraw (agent_id, bill_number, numberbill, quantity, accountName, accountNumber, phonenumber, transaction_date, time, status_withdraw, bank ) value 
            ('${resultUser.agent_id}','T${formattedDate}${formattedNumber}','${billnum}','${quantity}','${resultUser.accountName}','${accountNumber}','${phonenumber}', now(), now(),'${status}','${Bank}')`;
            connection.query(sql_before, (error, result) => {
                let jsArray = "ระบบกำลังดำเนินการ";
                resolve(jsArray);
            });
        });
    }
};