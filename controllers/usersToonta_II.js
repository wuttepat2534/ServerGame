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
