import express from 'express';
import bodyParser from 'body-parser';
import fileUpload from 'express-fileupload';
import member from './src/member.js';
import score from './src/score.js';
import reward from './src/reward.js';
import ads from './src/ads.js';

// const bodyParser = require('body-parser');
// const fileUpload = require('express-fileupload');
var app = express();
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(fileUpload());

// var port = process.env.port || 3001;
// var server = app.listen(port, function () {
//     console.log('Server running');
// });
app.listen(process.env.PORT || 8080, () => console.log(`Listening on port ${process.env.PORT || 8080}`));

// app.use((req, res, next) => {
//     res.header('Access-Control-Allow-Origin');
//     res.header('Access-Control-Allow-Methods', 'POST, GET, PUT, PATCH, DELETE, OPTIONS');
//     next();
// });

app.use((req, res, next) => {
    res.header('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');
    res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
    next();
});

var urlencodedParser = bodyParser.urlencoded({ extended: false });

// const member = require('./src/member');
app.get('/member/login', member.login);
app.post('/member/game-login', member.gameLogin);
app.post('/member/register', member.register);
app.get('/member/get-all', member.checkLogin, member.getAll);
app.get('/member/get-data/:id', member.getById);

app.get('/score/member/:id', score.getByMemberId);
app.post('/score/update/', score.createScore);
app.get('/score/member/:game/:id', score.getStageByMemberId);

app.get('/reward', reward.getAll);
app.post('/reward', reward.create);
app.get('/reward/member/already/:id', reward.getRewardAlreadyMemberId);
app.get('/reward/member/get/:reward_id/:id/:use_point', reward.memberGetReward);

app.get('/ads', ads.getAll);
app.post('/ads', ads.create);
