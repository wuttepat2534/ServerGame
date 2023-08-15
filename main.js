const http = require('http');
const https = require('https');
const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const useragent = require('express-useragent');
const ejs = require('ejs');
const mysql = require('mysql2') //npm install mysql2
const axios = require('axios'); //npm install axios
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const md5 = require('md5');
const postsRoutes = require('./routes/posts')
const os = require('os');
const auth = require('./middleware/auth');
const sdk = require('api')('@thaibulksms/v1.0#1of51jl4qvzac3');
const multer = require('multer');
const upload = multer({ dest: 'uploads/' });

var cors = require('cors');

require('dotenv').config()
app.engine("html", ejs.renderFile);
app.use(useragent.express());
app.use(cors());
app.use(bodyParser.json());
app.use('/post', postsRoutes);
app.use(express.static('public'));
app.listen(5000, () => console.log(`Listening on port... ${5000}`));

const connection = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    database: process.env.DB_DATABASE,
    password: process.env.DB_PASSWORD
});

app.use(bodyParser.urlencoded({ extended: false }));

//http://localhost:5000/testApi
app.get('/testApi', async (require, response) => {
    response.send({
        message: 'AllIDAgent',
    });
    response.end();
});
//http://localhost:5000/list_idAgent
app.get('/list_idAgent', async (require, response) => {
    let sql = `SELECT * FROM member WHERE status_delete='N'`;
    connection.query(sql, async (error, results) => {
        if (error) { console.log(error); }
        response.send({
            data: results
        });
        response.end();
    });
});

//http://localhost:5000/list_admins
app.post('/list_admins', auth, async (require, response) => {
    const searchKeyword = require.body.name;
    const pageSize = require.body.pageSize;
    const pageNumber = require.body.pageIndex;
    const offset = (pageNumber - 1) * pageSize;
    if (searchKeyword === '') {
        let sql = `SELECT id, name, username, status, contact_number FROM admin WHERE status_delete='N' LIMIT ${pageSize} OFFSET ${offset}`;
        connection.query(sql, async (error, results) => {
            if (error) { console.log(error); }
            const totalCount = `SELECT COUNT(*) as count FROM admin WHERE status_delete='N' `
            connection.query(totalCount, (error, res) => {
                if (error) { console.log(error); }
                response.send({
                    message: 'adminNOSearch',
                    data: results,
                    total: res[0].count
                });

                response.end();
            });
        });
    } else {
        let sql = `SELECT id, name, username, status, contact_number  FROM admin WHERE status_delete='N' AND 
        username LIKE '%${searchKeyword}%' OR name LIKE '%${searchKeyword}%' OR id LIKE '%${searchKeyword}%' OR contact_number LIKE '%${searchKeyword}%'
        LIMIT ${pageSize} OFFSET ${offset}`;
        connection.query(sql, async (error, results) => {
            if (error) { console.log(error); }
            response.send({
                message: 'adminSearch',
                data: results,
                total: results.length
            });
            response.end();
        });
    }
});


//http://localhost:5000/list_admin/1
app.get('/list_admin/:admin_id', (require, response) => {
    let admin_id = require.params.admin_id;
    let sql = `SELECT id, name, username, status FROM admin WHERE id='${admin_id}' AND status_delete='N' ORDER BY username ASC`;
    connection.query(sql, (error, results) => {

        if (error) { console.log(error) }
        response.send({
            message: "admin select",
            data: results
        });

        response.end();
    });
});

//http://localhost:5000/list_agents
app.post('/list_agents', auth, (require, response) => {
    const searchKeyword = require.body.name;
    const pageSize = require.body.pageSize;
    const pageNumber = require.body.pageIndex;
    const offset = (pageNumber - 1) * pageSize;

    if (searchKeyword === '') {
        let sql = `SELECT id, name, username, status, contact_number, credit FROM agent WHERE status_delete='N' LIMIT ${pageSize} OFFSET ${offset}`;
        connection.query(sql, async (error, results) => {
            if (error) { console.log(error); }
            const totalCount = `SELECT COUNT(*) as count FROM agent WHERE status_delete='N'`
            connection.query(totalCount, (error, res) => {
                if (error) { console.log(error); }
                response.send({
                    message: 'agentNoSearch',
                    data: results,
                    total: res[0].count
                });

                response.end();
            });
        });
    } else {
        let sql = `SELECT id, name, username, status, contact_number, credit FROM agent WHERE status_delete='N' AND 
        username LIKE '%${searchKeyword}%' OR name LIKE '%${searchKeyword}%' OR id LIKE '%${searchKeyword}%' OR contact_number LIKE '%${searchKeyword}%'
        LIMIT ${pageSize} OFFSET ${offset}`;
        connection.query(sql, async (error, results) => {
            if (error) { console.log(error); }
            response.send({
                message: 'agent_Search',
                data: results,
                total: results.length
            });
            response.end();
        });
    }
});

//http://localhost:5000/list_agent/1
app.get('/list_agent/:agent_id', (require, response) => {
    let agent_id = require.params.agent_id;
    let sql = `SELECT id, name, username, contact_number, credit, status FROM agent WHERE id='${agent_id}' AND status_delete='N' 
    ORDER BY username ASC`;
    connection.query(sql, (error, results) => {
        if (error) { console.log(error) }
        response.send({
            message: "agent select",
            data: results
        });

        response.end();
    });
});

//http://localhost:5000/list_users/agent/1
app.get('/list_users/agent/:agent_id', (require, response) => {
    let agent_id = require.params.agent_id;
    let sql = `SELECT id, member_code, name, username, credit, status FROM member WHERE agent_id='${agent_id}' AND status_delete='N' 
    ORDER BY member_code ASC`;
    connection.query(sql, (error, results) => {
        if (error) { console.log(error); }
        response.send({
            message: 'agent member all',
            data: results
        });

        response.end();
    });
});

//http://localhost:5000/list_users
app.post('/list_users', auth, (require, response) => {
    const searchKeyword = require.body.name;
    const pageSize = require.body.pageSize;
    const pageNumber = require.body.pageIndex;
    const offset = (pageNumber - 1) * pageSize;

    if (searchKeyword === "") {
        let sql = `SELECT id, username_agent, member_code, name, username, credit, status, created_at, accountName FROM member WHERE status_delete='N' LIMIT ${pageSize} OFFSET ${offset}`;
        connection.query(sql, async (error, results) => {
            if (error) { console.log(error); }
            else {
                const totalCount = `SELECT COUNT(*) as count FROM member WHERE status_delete='N'`
                connection.query(totalCount, (error, res) => {
                    if (error) { console.log(error); }
                    response.send({
                        message: 'memberSearchAll',
                        data: results,
                        total: res[0].count
                    });

                    response.end();
                });
            }
        });
    } else {
        let sql = `SELECT id, username_agent, member_code, name, username, credit, status, created_at, accountName FROM member WHERE status_delete='N' 
        AND username LIKE '%${searchKeyword}%' OR name LIKE '%${searchKeyword}%' OR username_agent LIKE '%${searchKeyword}%' LIMIT ${pageSize} OFFSET ${offset}`;
        connection.query(sql, async (error, results) => {
            if (error) { console.log(error); }
            response.send({
                message: 'memberSearch',
                data: results,
                total: results.length
            });
            response.end();
        });
    }
});

http://localhost:5000/list_user/1
app.get('/list_user/:user_id', (require, response) => {
    let user_id = require.params.user_id;
    let sql = `SELECT * FROM member WHERE id='${user_id}' AND status_delete='N' 
    ORDER BY member_code ASC`;
    connection.query(sql, (error, results) => {
        if (error) { console.log(error) }
        response.send({
            message: 'member id',
            data: results
        });

        response.end();
    });
});

http://localhost:5000/list_userGame/1 
app.get('/list_userGame/:user_id', (require, response) => {
    let user_id = require.params.user_id;
    let sql = `SELECT username, credit, bet_latest FROM member WHERE id='${user_id}' AND status_delete='N' 
    ORDER BY member_code ASC`;
    connection.query(sql, (error, results) => {
        if (error) { console.log(error) }
        console.log(results);
        response.json(results[0]);
    });
});


app.post('/user/add', (require, response) => {
    let member_code = require.member_code;
    let name = require.name;
    let username = require.username;
    let password = require.password;
    let sql = `SELECT id, member_code, name, username, credit, status FROM member WHERE id='${user_id}' AND status_delete='N' 
    ORDER BY member_code ASC`;
    connection.query(sql, (error, results) => {
        if (error) { console.log(error) }
        response.send({
            message: "member select",
            data: results
        });

        response.end();
    });
});

http://localhost:5000/games
app.get('/games', (require, response) => {
    let sql = `SELECT id, game_name, image, status FROM game WHERE status_delete='N' ORDER BY game_name ASC`;
    connection.query(sql, (error, results) => {
        if (error) { console.log(error); }
        response.send({
            message: 'game all',
            data: results
        });

        response.end();
    });
});

http://localhost:5000/game/1
app.get('/game/:game_id', (require, response) => {
    let game_id = require.params.game_id;
    let sql = `SELECT id, game_name, image, status FROM game WHERE id='${game_id}' AND status_delete='N' ORDER BY game_name ASC`;
    connection.query(sql, (error, results) => {
        if (error) { console.log(error); }
        response.send({
            message: 'game select',
            data: results
        });

        response.end();
    });
});

http://localhost:5000/user_play/user/1
app.get('/user_play/user/:user_id', (require, response) => {
    let user_id = require.params.user_id;
    let sql = `SELECT user_play.id AS play_id, member.id AS member_id, member.member_code AS member_code, member.name AS name, member.credit AS credit, 
    user_play.bet AS bet, user_play.win AS win, user_play.tiles AS tiles, winline AS winline FROM user_play, member 
    WHERE user_play.member_id=member.id AND member.id='${user_id}' AND member.status='Y' ORDER BY user_play.id DESC`;
    connection.query(sql, (error, results) => {
        if (error) { console.log(error) }
        response.send({
            message: "member play",
            data: results
        });

        response.end();
    });
});

http://localhost:5000/user_play/user_lay/1
app.post('/user_play/user_lay/:user_id', (require, response) => {
    let user_id = require.params.user_id;
    const pageSize = require.body.pageSize;
    const pageNumber = require.body.pageIndex;
    const offset = (pageNumber - 1) * pageSize;

    let sql = `SELECT id, member_id, game_id, bet, credit, win, winline, created_at FROM user_play
    WHERE member_id = '${user_id}' LIMIT ${pageSize} OFFSET ${offset}`;
    connection.query(sql, (error, results) => {
        const dataLog = results;
        if (error) { console.log(error) }
        const totalCount = `SELECT COUNT(*) as count FROM user_play WHERE member_id = '${user_id}'`
        connection.query(totalCount, (error, res) => {
            if (error) { console.log(error); }
            response.send({
                message: 'user_playSearch',
                data: dataLog,
                total: res[0].count
            });

            response.end();
        });
    });
});

http://localhost:5000/login/admin  Login Admin
app.post('/login/admin', async (require, response, next) => {
    let username = require.body.username;
    let password = require.body.password;

    let sql = `SELECT * FROM admin WHERE username='${username}' AND status_delete='N' ORDER BY username ASC`;
    connection.query(sql, async (error, results) => {
        try {
            const data = results;
            if (data.length !== 1) {
                const error = new Error('A user with this email could not be found.');
                error.statusCode = 401;
                throw error;
            }
            const storedUser = data[0];
            const passwordMatches = await bcrypt.compare(password, storedUser.password);

            if (!passwordMatches) {
                const error = new Error('Wrong password!');
                error.statusCode = 401;
                throw error;
            }

            const token = jwt.sign(
                {
                    username: storedUser.username,
                    userId: storedUser.id,
                    name: storedUser.name
                },
                'secretfortoken',
                { expiresIn: '2h' }
            );
            response.status(201).json({ token: token, data: storedUser });
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }
    });

});

http://localhost:5000/login/agent  Login Agent
app.post('/login/agent', async (require, response, next) => {
    let username = require.body.username;
    let password = require.body.password;

    let sql = `SELECT * FROM agent WHERE username='${username}' AND status_delete='N' ORDER BY username ASC`;
    connection.query(sql, async (error, results) => {
        try {
            const data = results;
            if (data.length !== 1) {
                const error = new Error('A user with this email could not be found.');
                error.statusCode = 401;
                throw error;
            }
            const storedUser = data[0];
            const passwordMatches = await bcrypt.compare(password, storedUser.password);

            if (!passwordMatches) {
                const error = new Error('Wrong password!');
                error.statusCode = 401;
                throw error;
            }
            const token = jwt.sign(
                {
                    username: storedUser.username,
                    userId: storedUser.id,
                    name: storedUser.name,
                    type: 'agent'
                },
                'secretfortoken',
                { expiresIn: '5h' }
            );
            response.status(201).json({ token: token, data: storedUser });
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }
    });

});

http://localhost:5000/login/member  Login Member
app.post('/login/member', async (require, response, next) => {
    let phoneNumber = require.body.phoneNumber;
    let password = require.body.password;

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
    // end check ip address

    //start check Browser
    const userAgent = require.headers['user-agent'];
    let browser;
    if (userAgent.includes('Chrome')) {
        browser = 'Google Chrome';
    } else if (userAgent.indexOf('Firefox') > -1) {
        browser = 'Mozilla Firefox';
    } else if (userAgent.indexOf('Safari') > -1) {
        browser = 'Apple Safari';
    } else if (userAgent.indexOf('Opera') > -1) {
        browser = 'Opera';
    } else if (userAgent.indexOf('Edg') > -1) {
        browser = 'Microsoft Edge';
    } else if (userAgent.indexOf('Trident') > -1) {
        browser = 'Microsoft Internet Explorer';
    }
    else {
        browser = 'Google Chrome';
    }
    // end check ip Browser
    let sql = `SELECT id, credit, name, password, phonenumber FROM member WHERE phonenumber='${phoneNumber}' AND status_delete='N'`;
    connection.query(sql, async (error, results) => {
        try {
            let update = `UPDATE member set ip_address = '${ipAddress}',browserlogin = '${browser}' WHERE id='${results[0].id}'`;
            connection.query(update, async (error, results) => {
                if (error) { console.log(error) }
            })
            const data = results;
            if (data.length !== 1) {
                const error = new Error('A user with this email could not be found.');
                error.statusCode = 401;
                throw error;
            }
            const storedUser = data[0];

            const hashedPassword = md5(password);
            if (hashedPassword !== storedUser.password) {
                return response.status(401).json({ message: 'Incorrect password' });
            }
            const token = jwt.sign(
                {
                    id: storedUser.id,
                    credit: storedUser.credit,
                    passwordCode: hashedPassword,
                    phonenumber: storedUser.phonenumber,
                    type: 'member',
                },
                'secretfortoken',
                { expiresIn: '5h' }
            );
            response.status(201).json({ token: token });
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
            next(err);
        }
    });

});

http://localhost:5000/signup  Add Admin
app.post('/signup', async (req, res, next) => {
    const name = req.body.name; //รับDataจากForm
    const username = req.body.username; //รับDataจากForm
    const password = req.body.password; //รับDataจากForm
    const contact_number = req.body.contact_number
    let sql_check = `SELECT * FROM admin WHERE username='${username}' ORDER BY username ASC`;
    connection.query(sql_check, async (error, results) => {
        try {
            const data = results;
            if (data.length !== 1) {
                const hashedPassword = await bcrypt.hash(password, 12);
                const userDetails = {
                    name: name,
                    username: username,
                    password: hashedPassword,
                };
                let sql = `INSERT INTO admin (name, username, password, contact_number, created_at, updated_at)
            value ('${userDetails.name}','${userDetails.username}','${userDetails.password}','${contact_number}',now(), now())`;
                connection.query(sql, (error, result) => {
                    if (error) { console.log(error) }
                    res.send({
                        message: "Data created Success"
                    });
                    res.end();
                });
            }
            else {
                res.send({
                    message: "Data Creates False"
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
});

http://localhost:5000/signupAgent Add Agent
app.post('/signupAgent', async (req, res, next) => {
    const name = req.body.name; //รับDataจากForm
    const username = req.body.username; //รับDataจากForm
    const password = req.body.password; //รับDataจากForm
    const contact_number = req.body.contact_number
    const credit = req.body.credit;

    let sql_check = `SELECT * FROM agent WHERE username='${username}' ORDER BY username ASC`;
    connection.query(sql_check, async (error, results) => {
        try {
            const data = results;
            if (data.length !== 1) {
                const hashedPassword = await bcrypt.hash(password, 12);
                const userDetails = {
                    name: name,
                    username: username,
                    password: hashedPassword,
                };
                let sql = `INSERT INTO agent (name, username, password, contact_number, credit, created_at, updated_at) 
            value ('${userDetails.name}','${userDetails.username}','${userDetails.password}','${contact_number}','${credit}',now(), now())`;
                connection.query(sql, (error, result) => {
                    if (error) { console.log(error) }
                    res.send({
                        message: "Data created Success"
                    });
                    res.end();
                });
            }
            else {
                res.send({
                    message: "Data Creates False"
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
});

http://localhost:5000/signupMember Add Member
app.post('/signupMember', async (req, res, next) => {
    const agent_id = req.body.agent_id;
    const member_code = req.body.member_code;
    const username = req.body.username;
    const password = req.body.password;
    const credit = req.body.credit;
    const firstName = req.body.firstName;
    const lastName = req.body.lastName;
    const customerGroup = req.body.customerGroup;
    const Rank = req.body.Rank;
    const contact_number = req.body.contact_number;
    const IDLIne = req.body.IDLIne;
    const note = req.body.note;
    const currency = req.body.currency;
    const bank = req.body.bank;
    const accountName = req.body.accountName;
    const accountNumber = req.body.accountNumber;
    const listCheckBox = req.body.listCheckBox.checkbox;
    //const checkboxListv2 = req.body.checkboxListv2;
    
    let statuScheck = 'Y';
    if (listCheckBox[0] === 'เปิดใช้งาน') {
        statuScheck = 'Y'
    } else {
        statuScheck = 'N'
    }
    const hashedPassword = md5(password);
    let sql_check = `SELECT * FROM member WHERE username='${username}' ORDER BY username ASC`;
    connection.query(sql_check, async (error, results) => {
        try {
            const data = results;
            if (data.length !== 1 || data.length < 1) {
                let sql_agent = `SELECT username FROM agent WHERE id='${agent_id}'`;
                connection.query(sql_agent, (error, usernameAgent) => {
                    if (error) { console.log(error) }
                    else {
                        //const hashedPassword = await bcrypt.hash(password, 12);
                        let sql = `INSERT INTO member (agent_id, username_agent, member_code, name, username, password, credit, created_at, updated_at, customerGroup, userrank, lineid, status,
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
                });
            }
            else {
                res.send({
                    message: "Data Creates False"
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
});

//http://localhost:5000/agent/1  Update Agent
app.put('/agent/:id', async (req, res, next) => {
    const id = req.params.id;
    const idedit = req.body.idedit;
    const username = req.body.username;
    const password = req.body.password;
    const name = req.body.name;
    const status = req.body.status;
    const contact_number = req.body.contact_number;
    const credit = req.body.credit;

    try {
        let sql_before = `SELECT * FROM agent WHERE id ='${id}' ORDER BY username ASC`;
        connection.query(sql_before, async (error, resultBefore) => {
            if (error) { console.log(error) }
            else {
                if (password === '') {
                    let sql = `UPDATE agent set username = '${username}', name = '${name}', status = '${status}', contact_number = '${contact_number}', credit = '${credit}'  WHERE id='${id}'`;
                    connection.query(sql, (error, result) => {
                        if (error) { console.log(error) }
                        else {
                            let sql_before = `INSERT INTO logeditagent (edittype, idedit, agentid, name, editbefore, editafter, created_at) value 
                ('admin','${idedit}','${id}','${name}','${'name : ' + resultBefore[0].name + ' , ' + 'status : ' + resultBefore[0].status + ' , ' + 'contact_number : ' + resultBefore[0].contact_number}
                ','${'name : ' + name + ' , ' + 'status : ' + status + ' , ' + 'contact_number : ' + contact_number}',now())`;
                            connection.query(sql_before, (error, resultAfter) => {
                                if (error) { console.log(error); }
                                res.send({
                                    message: "Data Update Success",
                                });
                                res.end();
                            });
                        }
                    });
                } else {
                    const hashedPassword = await bcrypt.hash(password, 12);
                    let sql = `UPDATE agent set 
            username = '${username}', name = '${name}', status = '${status}', contact_number = '${contact_number}', credit = '${credit}', password = '${hashedPassword}' WHERE id='${id}'`;
                    connection.query(sql, (error, result) => {
                        if (error) { console.log(error) }
                        else {
                            let sql_before = `INSERT INTO logeditagent (edittype, idedit, agentid, name, editbefore, editafter, created_at) value 
                ('admin','${idedit}','${id}','${name}','${'name : ' + resultBefore[0].name + ' , ' + 'status : ' + resultBefore[0].status + ' , ' + 'contact_number : ' + resultBefore[0].contact_number}
                ','${'name : ' + name + ' , ' + 'status : ' + status + ' , ' + 'contact_number : ' + contact_number}',now())`;
                            connection.query(sql_before, (error, resultAfter) => {
                                if (error) { console.log(error); }
                                res.send({
                                    message: "Data Update Success",
                                });
                                res.end();
                            });
                        }
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

});

//http://localhost:5000/admin/1  Update Admin
app.put('/admin/:id', async (req, res, next) => {
    const id = req.params.id;
    const idedit = req.body.idedit;
    const username = req.body.username;
    const name = req.body.name;
    const status = req.body.status;
    const contact_number = req.body.contact_number;
    try {
        let sql_before = `SELECT * FROM admin WHERE id ='${id}' ORDER BY username ASC`;
        connection.query(sql_before, (error, resultBefore) => {
            if (error) { console.log(error) }
            else {
                let sql = `UPDATE admin set username = '${username}',name = '${name}', status = '${status}', contact_number = '${contact_number}' WHERE id='${id}'`;
                connection.query(sql, (error, result) => {
                    if (error) { console.log(error) }
                    else {
                        let sql_before = `INSERT INTO logeditadmin (edittype, idedit, adminid, name, editbefore, editafter, created_at) value 
                  ('admin','${idedit}','${id}','${name}','${'name : ' + resultBefore[0].name + ' , ' + 'status : ' + resultBefore[0].status + ' , ' + 'contact_number : ' + resultBefore[0].contact_number}
                  ','${'name : ' + name + ' , ' + 'status : ' + status + ' , ' + 'contact_number : ' + contact_number}',now())`;
                        connection.query(sql_before, (error, resultAfter) => {
                            if (error) { console.log(error); }
                            res.send({
                                message: "Data Update Success",
                            });
                            res.end();
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
});

//http://localhost:5000/member/1  Update Member
app.put('/member/:id', async (req, res, next) => {
    const id = req.params.id;
    const edittype = req.body.edittype;
    const idedit = 2;
    const member_code = req.body.member_code;
    const username = req.body.username;
    const password = req.body.password;
    const status = req.body.status;
    const credit = req.body.credit;
    const firstName = req.body.firstName;
    const lastName = req.body.lastName;
    const customerGroup = req.body.customerGroup;
    const Rank = req.body.Rank;
    const contact_number = req.body.contact_number;
    const IDLIne = req.body.IDLIne;
    const note = req.body.note;
    const currency = req.body.currency;
    const bank = req.body.bank;
    const accountName = req.body.accountName;
    const accountNumber = req.body.accountNumber;
    const listCheckBox = req.body.listCheckBox;
    const checkboxListv2 = req.body.checkboxListv2;
    let statuscheck = 'N';
    if (listCheckBox === 'เปิดใช้งาน') {
        statuscheck = 'Y'
    } else {
        statuscheck = 'N'
    }
    try {
        let sql_before = `SELECT * FROM member WHERE id ='${id}' ORDER BY username ASC`;
        connection.query(sql_before, (error, resultBefore) => {
            if (error) { console.log(error) }
            else {
                let sql = `UPDATE member set member_code = '${member_code}', name = '${firstName}', username = '${username}', status = '${statuscheck}', credit = '${credit}',
                password = '${password}', lastName = '${lastName}', customerGroup = '${customerGroup}', userrank = '${Rank}', phonenumber = '${contact_number}',
                lineid = '${IDLIne}', note = '${note}', currency = '${currency}', bank = '${bank}', accountName = '${accountName}', accountNumber = '${accountNumber}'
        WHERE id='${id}'`;
                connection.query(sql, (error, result) => {
                    if (error) { console.log(error) }
                    else {
                        let sql_before = `INSERT INTO logedit (edittype, idedit, idmember, name, editbefore, editafter, created_at) value 
                ('${edittype}','${idedit}','${id}','${firstName}','${'member_code : ' + resultBefore.member_code + ' , ' + 'status : ' + resultBefore.status + ' , ' + 'credit : ' + resultBefore.credit}
                ','${'member_code : ' + member_code + ' , ' + 'status : ' + status + ' , ' + 'credit : ' + credit}',now())`;

                        connection.query(sql_before, (error, resultAfter) => {
                            if (error) { console.log(error); }
                            res.send({
                                message: "Data Update Success",
                            });
                            res.end();
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
});

//http://localhost:5000/deleteMember/1  Delete users
app.put('/delete/:id', async (req, res, next) => {
    const id = req.params.id;
    const user = req.body.user;
    let sql = `UPDATE ${user} set status_delete = 'Y' WHERE id='${id}'`;
    connection.query(sql, (error, result) => {
        if (error) { console.log(error); }

        if (user === 'agent') {
            let sqlDeleteAgent = `UPDATE member set status_delete = 'Y' WHERE agent_id ='${id}'`;
            connection.query(sqlDeleteAgent, (error, result) => {
                if (error) { console.log(error); }
                res.send({
                    message: "Delete Success",
                });
                res.end();
            });
        }
        else {
            res.send({
                message: "Delete Success",
            });
            res.end();
        }
    });
});

http://localhost:5000/logEdit/1
app.post('/logEdit/:user_id', (require, response) => {
    let user_id = require.params.user_id;
    const pageSize = require.body.pageSize;
    const pageNumber = require.body.pageIndex;
    const offset = (pageNumber - 1) * pageSize;
    const typeLog = require.body.typeLog;

    if (typeLog === 'member') {
        let sql = `SELECT edittype, idedit, editbefore, editafter, created_at FROM logedit
    WHERE idmember = '${user_id}' LIMIT ${pageSize} OFFSET ${offset}`;
        connection.query(sql, (error, results) => {
            const dataLog = results;
            if (error) { console.log(error) }
            const totalCount = `SELECT COUNT(*) as count FROM logedit WHERE idmember = '${user_id}'`
            connection.query(totalCount, (error, res) => {
                if (error) { console.log(error); }
                response.send({
                    message: 'user_playSearch',
                    data: dataLog,
                    total: res[0].count
                });

                response.end();
            });
        });
    }

    if (typeLog === "agent") {
        let sql = `SELECT edittype, idedit, editbefore, editafter, created_at FROM logeditagent
        WHERE agentid = '${user_id}' LIMIT ${pageSize} OFFSET ${offset}`;
        connection.query(sql, (error, results) => {
            const dataLog = results;
            if (error) { console.log(error) }
            const totalCount = `SELECT COUNT(*) as count FROM logeditagent WHERE agentid = '${user_id}'`
            connection.query(totalCount, (error, res) => {
                if (error) { console.log(error); }
                response.send({
                    message: 'user_playSearch',
                    data: dataLog,
                    total: res[0].count
                });

                response.end();
            });
        });
    }
    if (typeLog === 'admin') {
        let sql = `SELECT edittype, idedit, editbefore, editafter, created_at FROM logeditadmin
        WHERE adminid = '${user_id}' LIMIT ${pageSize} OFFSET ${offset}`;
        connection.query(sql, (error, results) => {
            const dataLog = results;
            if (error) { console.log(error) }
            const totalCount = `SELECT COUNT(*) as count FROM logeditadmin WHERE adminid = '${user_id}'`
            connection.query(totalCount, (error, res) => {
                if (error) { console.log(error); }
                response.send({
                    message: 'user_playSearch',
                    data: dataLog,
                    total: res[0].count
                });

                response.end();
            });
        });
    }
});


//getมาใช้ใน Dashboard
http://localhost:5000/getallData
app.get('/getallData', async (require, response, next) => {
    let sqlAdmin = `SELECT id FROM admin WHERE status_delete='N' ORDER BY username ASC`;
    let sqlAgent = `SELECT id FROM agent WHERE status_delete='N' ORDER BY username ASC`;
    let sqlMember = `SELECT id FROM member WHERE status_delete='N' ORDER BY username ASC`;
    let sqlGame = `SELECT * FROM game`;
    let sqlGamePlay = `SELECT * FROM loggame`;
    connection.query(sqlAdmin, (error, resultsAdmin) => {
        if (error) { console.log(error); }
        connection.query(sqlAgent, (error, resultsAgent) => {
            if (error) { console.log(error); }
            connection.query(sqlMember, (error, resultsMember) => {
                if (error) { console.log(error); }
                connection.query(sqlGame, (error, resultsGame) => {
                    if (error) { console.log(error); }
                    else {
                        connection.query(sqlGamePlay, (error, resultsGamePlay) => {
                            if (error) { console.log(error); }
                            else {
                                response.send({
                                    dataAdmin: resultsAdmin.length,
                                    dataAgent: resultsAgent.length,
                                    dataMember: resultsMember.length,
                                    Member: resultsMember,
                                    dataGame: resultsGame,
                                    logGame: resultsGamePlay,
                                });
                                response.end();
                            }
                        });
                    }
                });
            });
        });
    });
});

http://localhost:5000/seamlesslogIn
app.get('/seamlesslogIn/:codeGame/:productId/:playerPlay', (require, response) => {
    const usernamePlayer = require.params.playerPlay;
    const productId = require.params.productId;
    const codeGame = require.params.codeGame;
    const agentUsername = 'victest2';
    const xApiKey = 'f47e5065-412c-40d1-9e4c-f6c248919509';
    const authHeader = `Basic ${Buffer.from(`${agentUsername}:${xApiKey}`).toString('base64')}`;
    const body = {
        username: usernamePlayer,
        productId: productId,
        gameCode: codeGame,
        isMobileLogin: true,
        sessionToken: "d4be70d1-349f-4fc1-a955-35d2a4bff244",
        betLimit: []
    };
    const config = {
        headers: {
            'Authorization': authHeader,
            'Content-Type': 'application/json'
        }
    };

    axios.post('https://test.ambsuperapi.com/seamless/logIn', body, config)
        .then(res => {
            console.log(res.data);
            response.status(201).json({ data: res.data });
        })
        .catch(error => {
            console.log(error);
        });
});

http://localhost:5000/listGame
app.get('/listGame/:productId', (require, response) => {
    const productId = require.params.productId;
    const agentUsername = 'victest2';
    const xApiKey = 'f47e5065-412c-40d1-9e4c-f6c248919509';
    const authHeader = `Basic ${Buffer.from(`${agentUsername}:${xApiKey}`).toString('base64')}`;

    axios.get(`https://test.ambsuperapi.com/seamless/games`, {
        params: {
            productId: productId
        },
        headers: {
            'Authorization': authHeader,
            'Content-Type': 'application/json'
        }
    })
        .then(res => {
            console.log(res.data);
            response.status(201).json({ data: res.data });
        })
        .catch(error => {
            console.log(error);
        });
});

//http://localhost:5000/list_webgame
app.post('/list_webgame', async (require, response) => {
    const searchKeyword = require.body.name;
    const pageSize = require.body.pageSize;
    const pageNumber = require.body.pageIndex;
    const offset = (pageNumber - 1) * pageSize;
    if (searchKeyword === '') {
        let sql = `SELECT * FROM gameweb LIMIT ${pageSize} OFFSET ${offset}`;
        connection.query(sql, async (error, results) => {
            if (error) { console.log(error); }
            const totalCount = `SELECT COUNT(*) as count FROM gameweb `
            connection.query(totalCount, (error, res) => {
                if (error) { console.log(error); }
                response.send({
                    message: 'gameall',
                    data: results,
                    total: res[0].count
                });

                response.end();
            });
        });
    } else {
        let sql = `SELECT * FROM gameweb WHERE
        namegame LIKE '%${searchKeyword}%' OR password_img LIKE '%${searchKeyword}%'
        LIMIT ${pageSize} OFFSET ${offset}`;
        connection.query(sql, async (error, results) => {
            if (error) { console.log(error); }
            response.send({
                message: 'gameallSearch',
                data: results,
                total: results.length
            });
            response.end();
        });
    }
});

app.post('/otpRequest', async (req, res) => {
    const phone = req.body.phoneNumber

    let sql_check = `SELECT * FROM member WHERE phonenumber='${phone}' ORDER BY phonenumber ASC`;
    connection.query(sql_check, async (error, results) => {
        try {
            const data = results;
            if (data.length !== 1 || data.length < 1) {
                sdk.postV2OtpRequest({
                    key: '1771680550307989',
                    secret: 'f7452e51ee54238076d2c04a1af5aeb7',
                    msisdn: phone
                }, { accept: 'application/json' })
                    .then(data => { res.json({ dataRes: data }) })
                    .catch(err => console.error(err));
            }
            else {
                console.log('on');
                res.json({ message: "This phonenumber is not available." });
                res.end();
            }
        } catch (err) {
            if (!err.statusCode) {
                err.statusCode = 500;
            }
        }
    })


});


app.post('/otpVerify', async (req, res) => {
    const token = req.body.token;
    const pin = req.body.pin;

    sdk.postV2OtpVerify({
        key: '1771680550307989',
        secret: 'f7452e51ee54238076d2c04a1af5aeb7',
        token: token,
        pin: pin,
    }, { accept: 'application/json' })
        .then(data => { res.json({ dataRes: data }) })
        .catch(err => console.error(err));
});

//-----------------------------------------------------------------------------------------------------------------------------
const imageUploadPath = 'public/images';
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, imageUploadPath)
    },
    filename: function (req, file, cb) {
        cb(null, `${file.fieldname}_dateVal_${Date.now()}_${file.originalname}`)
    }
})
const imageUpload = multer({
    storage: storage,
    limits: { fileSize: 5 * 1024 * 1024 },
});
app.post('/image-upload', imageUpload.single("file"), (req, res) => { //ทดลองอัพโหลดรูปภาพขึ้น Server
    console.log('Axios POST body: ', req.file);
    res.json('file_dateVal_1689766490261_7.png');
});
//-----------------------------------------------------------------------------------------------------------------------------

app.get('/latest-records', (req, res) => {

    const today = new Date();

    // Format the date as "yyyy-mm-dd"
    const day = String(today.getDate()).padStart(2, '0');
    const month = String(today.getMonth() + 1).padStart(2, '0'); // JavaScript months are 0-based, so we add 1
    const year = today.getFullYear();

    const formattedDate = `${year}-${month}-${day}`;
    console.log(formattedDate);
    const query = `SELECT numberbill FROM logfinanceuser WHERE transaction_date = ? ORDER BY numberbill DESC LIMIT 1`;

    connection.query(query, [formattedDate], (err, results) => {
        if (err) {
            console.error('Error fetching latest records: ', err);
            res.status(500).json({ error: 'Error fetching latest records' });
            return;
        }

        res.json(results);
    });
});