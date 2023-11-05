const express = require('express');
const { response } = require("express");
const mysql = require('mysql2') //npm install mysql2
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
const os = require('os');
const md5 = require('md5');
const multer = require('multer');
const upload = multer({ dest: 'uploads/' });
const useragent = require('express-useragent')

const logEdit = require('./logEditAll')
const promotiontoonta = require('./promotiontoonta')
const repostGame = require('./repostGame')
const Finance = require('./Finance')
const app = express();
app.use(express.static('public'));
require('dotenv').config()
const connection = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    database: process.env.DB_DATABASE,
    password: process.env.DB_PASSWORD
});

http: //localhost:5000/GetWithdrawStatus Get GetWithdrawStatus
exports.GetWithdrawStatus = async (req, res, next) => {
    const agent_id = req.body.agent_id;
    const phonenumber = req.body.phonenumber;
    let sql_agent = `SELECT * FROM withdraw WHERE phonenumber ='${phonenumber}' AND agent_id = '${agent_id}' AND status_withdraw = 'in_progress'`;
    connection.query(sql_agent, (error, usernameAgent) => {
        try {
            if (error) {
                console.log(error)
            } else {
                if (usernameAgent.length !== 0) {
                    res.send({
                        message: 'sentData',
                        data: usernameAgent
                    });
                    res.end();
                } else {
                    let sql_uses = `SELECT credit,	turnover FROM member WHERE phonenumber ='${phonenumber}' AND agent_id = '${agent_id}'`;
                    connection.query(sql_uses, (error, usernameAgent) => {
                        if (error) {
                            console.log(error)
                        } else {
                            if (usernameAgent.length !== 0) {
                                res.send({
                                    message: 'sentDataWithDraw',
                                    data: usernameAgent
                                });
                                res.end();
                            }
                        }
                    })
                }
            }
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }
    })
};

http: //localhost:5000/GetWithdrawConfirmation Get GetWithdrawConfirmation
exports.GetWithdrawConfirmation = async (req, res, next) => {
    const pageSize = req.body.pageSize;
    const pageNumber = req.body.pageIndex;
    const offset = (pageNumber - 1) * pageSize;
    const statusWithdraw = req.body.statusWithdraw;

    let sql_agent = `SELECT * FROM withdraw WHERE status_withdraw = '${statusWithdraw}' LIMIT ${pageSize} OFFSET ${offset}`;
    connection.query(sql_agent, (error, usernameAgent) => {
        try {
            if (error) {
                console.log(error)
            } else {
                if (usernameAgent.length !== 0) {
                    const totalCount = `SELECT COUNT(*) as count FROM withdraw WHERE status_withdraw = '${statusWithdraw}'`
                    connection.query(totalCount, (error, resdata) => {
                        if (error) { console.log(error); }
                        else {
                            res.send({
                                message: 'sentData',
                                data: usernameAgent,
                                valusData: usernameAgent.length,
                                total: resdata[0].count
                            });
                            res.end();
                        }
                    })
                } else {
                    res.send({
                        message: 'NotConfirmation'
                    });
                    res.end();
                }
            }
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }
    })
};

http: //localhost:5000/ConfirmationWithdraw Get ConfirmationWithdraw
exports.ConfirmationWithdraw = async (req, res, next) => {
    const bill_number = req.body.bill_number;
    const statusWithdraw = req.body.statusWithdraw;
    const noteConfirmation = req.body.noteConfirmation;
    const usernameUser = req.body.username;
    const approval_person = req.body.approval_person
    const tpyeApproval_person = req.body.tpye_Approval_person
    const agent_id = req.body.agent_id;
    //statusWithdraw = success, failed

    let sql_agent = `SELECT * FROM member WHERE username ='${usernameUser}' AND agent_id ='${agent_id}'`;
    connection.query(sql_agent, (error, userMember) => {

        const convertedCredit = parseFloat(userMember[0].credit);
        const convertedLatest_withdrawal = parseFloat(userMember[0].latest_withdrawal);
        const convertedWithdraw_member = parseFloat(userMember[0].withdraw_member);

        let sql_Withdraw = `UPDATE withdraw set status_withdraw = '${statusWithdraw}', note = '${noteConfirmation}' WHERE bill_number ='${bill_number}'`;
        connection.query(sql_Withdraw, (error, withdraw) => {
            try {
                if (error) {
                    console.log(error)
                } else {
                    if (statusWithdraw === 'failed') {
                        let sql_Withdraw = `UPDATE logfinanceuser set status = 'ไม่สำเร็จ',trans_ref = '${approval_person}',qrcodeData = '${tpyeApproval_person}'
                        WHERE bill_number ='${bill_number}'`;
                        connection.query(sql_Withdraw, (error, withdraw) => {
                            let sql = `UPDATE member set credit = '${convertedCredit + convertedLatest_withdrawal}', latest_withdrawal = '${0.00}',
                            withdraw_member = '${convertedWithdraw_member - convertedLatest_withdrawal}'  WHERE username ='${usernameUser}' AND agent_id ='${agent_id}'`;
                            connection.query(sql, (error, resultAfter) => {
                                if (error) {
                                    console.log(error);
                                }
                                res.send({
                                    message: "รอการอนุมัติการถอนเงิน",
                                });
                                res.end();
                            });
                        })

                    } else {
                        let sql_Withdraw = `UPDATE logfinanceuser set status = 'สำเร็จ',trans_ref = '${approval_person}',qrcodeData = '${tpyeApproval_person}' 
                        WHERE bill_number ='${bill_number}'`;
                        connection.query(sql_Withdraw, (error, withdraw) => {
                            let updateRepostFinance = Finance.UpdateLogRepostFinance(usernameUser, 'ถอน', convertedLatest_withdrawal)
                            res.send({
                                message: "ถอนเงินสำเร็จ",
                            });
                            res.end();
                        })
                      
                    }
                }
            } catch (err) {
                if (!err.statusCode) {
                    err.statusCode = 500;
                }
                next(err);
            }
        })
    })
};

//http://localhost:5000/post/apiGetAgentWeb getapiGetAgentWeb
exports.apiGetAgentWeb = (require, response) => {
    const usernanme = require.body.username;
    const agent_id = require.body.agent_id;
    const pageSize = require.body.pageSize;
    const pageNumber = require.body.pageIndex;
    const offset = (pageNumber - 1) * pageSize;

    if (usernanme === '') {
        let sql = `SELECT * FROM employee WHERE agent_id = "${agent_id}" AND status = "true" LIMIT ${pageSize} OFFSET ${offset}`;
        connection.query(sql, async (error, results) => {
            if (error) { console.log(error); }
            const totalCount = `SELECT COUNT(*) as count FROM employee WHERE agent_id = "${agent_id}" `
            connection.query(totalCount, (error, res) => {
                if (error) { console.log(error); }
                else {
                    response.send({
                        data: results,
                        total: res[0].count
                    });
                    response.end();
                }
            });
        });
    } else {
        let sql_ = `SELECT * FROM employee WHERE  agent_id = ? AND status = ? AND username LIKE ? LIMIT ? OFFSET ?`;
        const searchPattern = `%${usernanme}%`;
        const values = [agent_id, "true", searchPattern, pageSize, offset];
        connection.query(sql_, values, (error, resultstatusFalse) => {
            if (error) { console.log(error); }
            else {
                response.send({
                    data: resultstatusFalse,
                    total: resultstatusFalse.length
                });
                response.end();
            }
        });
    }
}

http: //localhost:5000/signupEmployeeAgent Add signupEmployeeAgent
exports.signupEmployeeAgent = async (req, res, next) => {
    const agent_id = req.body.agent_id;
    const username = req.body.username;
    const password = req.body.password;
    const name = req.body.name;
    const phonenumber = req.body.phonenumber;
    const role = req.body.role;
    const levelRole = req.body.levelRole;

    const hashedPassword = md5(password);
    let sql_agent = `SELECT username FROM employee WHERE agent_id ='${agent_id}' AND username = '${username}'`;
    connection.query(sql_agent, (error, usernameAgent) => {
        try {
            if (error) {
                console.log(error)
            } else {
                if (usernameAgent.length === 0 || usernameAgent < 1) {
                    let sql = `INSERT INTO employee (agent_id, username, password, name, phonenumber, status, created_at, login_latest, role, levelrole) 
                value ('${agent_id}','${username}','${hashedPassword}','${name}','${phonenumber}','${'true'}',now() ,now(),'${role}', '${levelRole}')`;
                    connection.query(sql, (error, result) => {
                        if (error) { console.log(error) }
                        res.send({
                            message: "Data created Success"
                        });
                        res.end();
                    });
                } else {
                    res.send({
                        message: "Data created False"
                    });
                    res.end();
                }
            }
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }
    })
};

http: //localhost:5000/EditEmployeeAgent EditEmployeeAgent
exports.EditEmployeeAgent = async (req, res, next) => {
    const id = req.body.id;
    const username = req.body.username;
    const name = req.body.name;
    const phonenumber = req.body.phonenumber;
    const status = req.body.status;
    const role = req.body.role;
    const levelRole = req.body.levelRole;

    let sql_update = `UPDATE employee set username = '${username}', name = '${name}', phonenumber = '${phonenumber}', role = '${role}', 
    status = '${status}', levelrole = '${levelRole}' WHERE id ='${id}'`;
    connection.query(sql_update, (error, resultAfter) => {
        try {
            if (error) {
                console.log(error)
            } else {
                res.send({
                    message: "Data Update Success"
                });
                res.end();
            }
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }
    });
};

//http://localhost:5000/post/GetOneAgentWeb getOneAgentWeb
exports.GetOneAgentWeb = (require, response) => {
    const id = require.params.id;
    let sql = `SELECT * FROM employee WHERE id = "${id}" AND status = "true"`;
    connection.query(sql, async (error, results) => {
        if (error) { console.log(error); }
        else {
            response.send({
                data: results,
            });
            response.end();
        }
    });
}

//http://localhost:5000/post/DeleteAgentWeb getOneAgentWeb
exports.DeleteAgentWeb = (require, response) => {
    const id = require.body.id;
    const agent_id = require.body.agent_id

    let sql_update = `UPDATE employee set status = 'false' WHERE id ='${id}' AND agent_id ='${agent_id}'`;
    connection.query(sql_update, async (error, results) => {
        if (error) { console.log(error); }
        else {
            response.send({
                data: results,
            });
            response.end();
        }
    });
}

//http://localhost:5000/post/GetOneBank getOneBank
exports.GetOneBank = (require, response) => {
    const nameBank = require.body.nameBank;
    console.log(nameBank)
    let sql = `SELECT * FROM banknames WHERE bankname_name = "${nameBank}" AND status = "Y"`;
    connection.query(sql, async (error, results) => {
        if (error) { console.log(error); }
        else {
            response.send({
                data: results,
            });
            response.end();
        }
    });
}

//http://localhost:5000/post/loginEnployee loginEnployee
exports.LoginAgentWeb = (require, response) => {
    let username = require.body.username;
    let password = require.body.password;
    let agent_id = require.body.agent_id;
    //start check ip address
    const networkInterfaces = os.networkInterfaces();
    const ipAddress = Object.keys(networkInterfaces).reduce((acc, interfaceName) => {
        const interfaceInfo = networkInterfaces[interfaceName];
        const ipv4Info = interfaceInfo.find(info => info.family === 'IPv4' && !info.internal);
        if (ipv4Info) {
            acc = ipv4Info.address;
        }
        return acc;
    }, '');
  
    let sql = `SELECT * FROM employee WHERE username='${username}' AND status='true' AND agent_id = '${agent_id}'`;
    connection.query(sql, async (error, results) => {
        try {
            //console.log(results);
            const data = results;
            if (data.length !== 1) {
                const error = new Error('notEmployee');
                error.statusCode = 401;
                response.status(201).json({ message: 'notEmployee' });
            } else {
                let update = `UPDATE employee set ip_address = '${ipAddress}' WHERE id='${results[0].id}' AND agent_id = '${agent_id}' `;
                connection.query(update, async (error, results) => {
                    if (error) { console.log(error) }
                })
                const storedUser = data[0];

                const hashedPassword = md5(password)
                if (hashedPassword !== storedUser.password) {
                    return response.status(401).json({ message: 'Incorrect password' });
                }
                const token = jwt.sign(
                    {
                        id: storedUser.id,
                        name: storedUser.name,
                        levelrole: storedUser.levelrole,
                        phonenumber: storedUser.phonenumber,
                        type: 'agent',
                    },
                    'secretfortoken',
                    { expiresIn: '24h' }
                );
                response.status(201).json({message: 'OkLogin' ,token: token, data: storedUser});
            }
           
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }
    });
}

http: //localhost:5000/post/DeleteUserGroupInformation Put DeleteUserGroupInformation
exports.DeleteAccessDeposit = async (req, res, next) => {
    const id = req.body.id;
    const agent_id = req.body.agent_id
    let sql = `UPDATE depositaccount set activestatus = '${'ปิดใช้งาน'}' WHERE id ='${id}' AND agent_id = '${agent_id}'`;
    connection.query(sql, (error, result) => {
        try {
            if (error) { console.log(error) }
            res.send({
                message: "Delete Success"
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
