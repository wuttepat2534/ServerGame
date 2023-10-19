const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
const post = require('../middleware/post');
const auth = require('../middleware/auth');
const loginController = require('../controllers/login');
const getCommission = require('../controllers/getcommission');
const postsController = require('../controllers/posts');
const testGame = require('../controllers/testgame');
const balloonGame = require('../controllers/balloonGame')
const gameAmb = require('../controllers/GameAmb')
const gameAmbApi = require('../controllers/GameAmbApi')
const gameAmbApiSu = require('../controllers/GameAmbApisu')
const liveCasino = require('../controllers/LiveCasion')
const userToonta = require('../controllers/usersToonta')
const userstoonTaII = require('../controllers/usersToonta_II')
const cors = require('cors');
const multer = require('multer');
const upload = multer({ dest: 'uploads/' });
const app = express();

app.use(cors());
app.use(express.static('public'));
const urlencodedParser = bodyParser.urlencoded({ extended: false });
// routerLogin

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
/*app.post('/image-upload', imageUpload.single("file"), (req, res) => { //ทดลองอัพโหลดรูปภาพขึ้น Server
    console.log('Axios POST body: ', req.file);
    res.json('file_dateVal_1689766490261_7.png');
});*/
//-----------------------------------------------------------------------------------------------------------------------------

//router.post('/loginAgent', loginController.loginAgent)
router.get('/Balance', postsController.getBalance);
// routerLogin
router.post('/token', post);

router.get('/test', postsController.getOne);
router.get('/game', postsController.getGame)
router.post('/convertToken', postsController.convertToken)
router.post('/convertData', postsController.convertData)
router.post('/logAgentMember/:agentId', postsController.logAgentMember)
router.put('/logoutMember/', postsController.logoutMember);
router.post('/commissionGame', getCommission.getCommission)
router.post('/commissionMonthly', getCommission.getCommissionMonthly)
router.post('/postGetallData', getCommission.getallData)
router.post('/signupMember', userToonta.signupMember)
router.post('/checkUsernameMember', userToonta.checkUsernameMember)
router.post('/creditPromotion', userToonta.creditPromotion)
router.post('/creditImgPromotion', imageUpload.single('file'), userToonta.creditImgPromotion)
router.post('/updateImgPromotion', imageUpload.single('file'), userToonta.upDateImgPromotion)
router.post('/getPromotion', userToonta.getPromotion)
router.post('/editPromotion', userToonta.EditPromotion)
router.post('/financeUser', userToonta.financeUser)
router.post('/WinhdrawUser', userToonta.WinhdrawUser)
router.post('/depositUserPromotion', userToonta.depositUserPromotion)
router.post('/getDatafinanceUser/:id', userToonta.getDatafinanceUser)
router.post('/getDataDepositStatementBank', userToonta.getDataDepositStatementBank)
router.post('/createDepositaccount', userToonta.createDepositaccount)
router.post('/createWithdrawalaccount', userToonta.createWithdrawalaccount)
router.post('/addUserGroupInformation', userToonta.addUserGroupInformation)
router.post('/getGroupccount', userToonta.getGroup)
router.post('/getRepostGame', userToonta.getRepostGame)
router.post('/getMemberRegiter', userToonta.getMemberRegiter)
router.post('/getRepostDeposit', userToonta.getRepostDeposit)
router.post('/getTransactionHistory', userToonta.getTransaction_History)
router.post('/getRepostWebdaily', userToonta.getRepostWebdaily)
router.post('/getRepostTotalTurnOver', userToonta.getRepostTurnover)
router.post('/getRepostTurnoverGameCamp', userToonta.getRepostTurnoverGameCamp)
router.post('/getRepostGameCamp', userToonta.getRepostGameCamp)
router.post('/GetWithdrawStatus', userstoonTaII.GetWithdrawStatus)
router.post('/GetBank', postsController.getBank)
router.post('/GetWithdrawConfirmation', userstoonTaII.GetWithdrawConfirmation)
router.post('/test', userToonta.testtesttest)
router.post('/apiGetAgentWeb', userstoonTaII.apiGetAgentWeb)
router.post('/signupEmployeeAgent', userstoonTaII.signupEmployeeAgent)
router.post('/GetOneBank', userstoonTaII.GetOneBank)
router.post('/loginEnployee', userstoonTaII.LoginAgentWeb)

router.get('/getDepositaccount/:agent_id', userToonta.getDepositaccount)
router.get('/getWithdrawalaccount', userToonta.getWithdrawalaccount)
router.get('/getOneDepositaccount/:numberAccount', userToonta.getOneDepositaccount)
router.get('/getOneWithdrawalaccount/:numberAccount', userToonta.getOneWithdrawalaccount)
router.get('/getMenberId/:user_id', postsController.getMenberId)
router.get('/getlistPromotion', userToonta.getlistPromotion)
router.get('/getOneGroup/:idGroup', userToonta.getOneGroup)
router.get('/', userToonta.getImgPromotion)
router.get('/getTestTest', userToonta.testFuntion)
router.get('/getOnePromotion/:passwordpromotion', userToonta.getOnePromotion)
router.get('/GetOneAgentWeb/:id', userstoonTaII.GetOneAgentWeb)

router.put('/updateDepositaccount', userToonta.updateDepositaccount)
router.put('/putUserGroupInformation', userToonta.PutUserGroupInformation)
router.put('/updateWithdrawalaccount', userToonta.updateWithdrawalaccount)
router.put('/resetPasswordUserToonta', userToonta.resetPasswordUserToonta)
router.put('/putCreditUserToonta', userToonta.PutCreditUserToonta)
router.put('/banUserToonta', userToonta.banUserToonta)
router.put('/resetPasswordUserToontaWeb', userToonta.resetPasswordUserToontaWeb)
router.put('/ConfirmationWithdraw', userstoonTaII.ConfirmationWithdraw)
router.put('/DeleteUserGroupInformation', userToonta.DeleteUserGroupInformation)
router.put('/EditEmployeeAgent', userstoonTaII.EditEmployeeAgent)
router.put('/DeletePromotion', userToonta.DeletePromotion)
router.put('/DeleteAgentWeb', userstoonTaII.DeleteAgentWeb)
// game
router.post('/playGame/:user_id/:bet/:game_id', testGame.saveTestGame)
router.post('/gameBuySpin/:user_id/:bet/:game_id', testGame.saveTestGameBuy)
router.post('/balloonGame/:state/:user_id/:bet/:game_id/:choose/:token', balloonGame.saveTestGame)
// game

// routerSubAgent
router.post('/listSubAgent/:id_Agent', postsController.listSubAgent)
router.post('/singUpSubAgent', postsController.singUpSubAgent)
router.put('/resetPasswordAgent/:id_agent', postsController.resetPasswordAgent)
router.put('/EditDataSubAgent', postsController.EditDataSubAgent)
router.post('/MemberSubAgent/:id_SubAgent', postsController.MemberSubAgent)
router.get('/list_subAgent/:user_id', postsController.getSubAgentId)
// routerSubAgent

//gamePercent
router.put('/EditPercentSubAgent', getCommission.updatePercent)
router.get('/GetPercentSubAgent/:id', getCommission.getPercent)
//gamePercent

//testGame API
router.post('/checkBalance', loginController.checkBalance)
router.post('/settleBets', loginController.settleBets)

//SlotXO
router.post('/authenticate-token', loginController.authenticate)
router.post('/balance', loginController.balanceXO)
router.post('/bet', loginController.PlaceBetSlotXo)
router.post('/settle-bet', loginController.SettlePlaySlotXo)
router.post('/cancel-bet', loginController.CancelPlaySlotXo)
router.post('/bonus-win', loginController.bonusPlaySlotXo)
router.post('/jackpot-win', loginController.JackpotPlaySlotXo)
router.post('/transaction', loginController.TransactionSlotXo)
router.post('/withdraw', loginController.WithdrawSlotXo)
router.post('/deposit', loginController.DepositSlotXo)
router.post('/authenticate', loginController.MobileauthenticateXoJo)
router.post('/seamless/getAppUsername', loginController.GetMobileauthenticateXoJo)
//SlotXO

//ASK
router.post('/api/wallet/balance', loginController.GetBalanceAsk)
router.post('/api/wallet/bet', loginController.PlaceBetAsk)
router.post('/api/wallet/payout', loginController.SettleBetAsk)
router.post('/api/wallet/cancel', loginController.CancelBetAsk)
//ASK

//Jili
router.post('/Jili/auth', loginController.PlayerAuthenticationJili)
router.post('/Jili/bet', loginController.PlayerBetJili)
router.post('/Jili/cancelBet', loginController.CancelBetJili)
//Jill

//Live
router.post('/Live/GetBalance', gameAmb.GetBalanceLive)
router.post('/Live/Bet', gameAmb.BetLive)
router.post('/Live/GameResult', gameAmb.GameResultLive)
router.post('/Live/Rollback', gameAmb.RollbackLive)
//Live

//Dream 
router.post('/Dream/user/getBalance', gameAmb.MemberBalanceDream)
router.post('/Dream/account/transfer', gameAmb.MemberTransferDream)
router.post('/Dream/account/inform', gameAmb.RollbackDream)
//Dream 

//Manna 
router.post('/Manna/fetchBalance', gameAmb.FetchBalanceManna)
router.post('/Manna/withdraw', gameAmb.WithdrawManna)
router.post('/Manna/deposit', gameAmb.DepositManna)
router.post('/Manna/rollback', gameAmb.RollbackManna)
router.post('/Manna/jp_deposit', gameAmb.JP_DepositManna)
//Manna 

//Simple Play 
router.post('/SimplePlay/GetUserBalance', gameAmb.GetUserBalanceSimplePlay)
router.post('/SimplePlay/PlaceBet', gameAmb.PlaceBetSimplePlay)
router.post('/SimplePlay/PlayerWin', gameAmb.PlayerWinSimplePlay)
router.post('/SimplePlay/PlayerLost', gameAmb.PlayerLostSimplePlay)
router.post('/SimplePlay/PlaceBetCancel', gameAmb.PlaceBetCancelSimplePlay)
//Simple Play 

//Spade_Gaming
router.post('/Spade_Gaming', gameAmbApi.AuthorizationSpade_Gaming)
//Spade_Gaming

//Habanero
router.post('/Habanero', gameAmbApi.HabaneroGame)
//Habanero

//Micro gaming/UPG slot
router.post('/gaming/login', gameAmbApi.gamingLogin)
router.post('/gaming/getbalance', gameAmbApi.gamingLogin)
router.post('/gaming/updatebalance', gameAmbApi.UpdateBalanceGaming)
router.post('/gaming/rollback', gameAmbApi.RollbackGaming)
//Micro gaming/UPG slot

//eVOPLAYSeamless
router.post('/eVOPLAYSeamless', gameAmbApi.EVOPLAYSeamless)
//eVOPLAYSeamless

//Funky
router.post('/Funky/User/GetBalance', gameAmbApi.GetBalanceFunky)
router.post('/Funky/Bet/PlaceBet', gameAmbApi.PlaceBetFunky)
router.post('/Funky/Bet/SettleBet', gameAmbApi.SettleBetFunky)
router.post('/Funky/Bet/CancelBet', gameAmbApi.CancelBetFunky)
router.post('/Funky/Bet/CheckBet', gameAmbApi.CheckBetFunky)
//Funky

//Yggdrasil
router.post('/Yggdrasil/playerinfo', gameAmbApi.PlayerinfoYggdrasil)
router.post('/Yggdrasil/getbalance', gameAmbApi.PlayerinfoYggdrasil)
router.post('/Yggdrasil/wager', gameAmbApi.PlaceBetYggdrasil)
router.post('/Yggdrasil/endwager', gameAmbApi.PayoutYggdrasil)
router.post('/Yggdrasil/appendwagerresult', gameAmbApi.PayoutYggdrasil)
router.post('/Yggdrasil/campaignpayout', gameAmbApi.PayoutYggdrasil)
router.post('/Yggdrasil/cancelwager', gameAmbApi.CancelBetYggdrasil)
//Yggdrasil

//Ameba
router.post('/Ameba', gameAmbApi.AmebaGame)
//Ameba

//Ambslot 
router.post('/Ambslot/balance', gameAmbApi.balanceAmbslot)
router.post('/Ambslot/bet', gameAmbApi.PlaceBetAmbslot)
router.post('/Ambslot/payout', gameAmbApi.PayoutAmbslot)
router.post('/Ambslot/cancel', gameAmbApi.CancelAmbslot)
//Ambslot 

//Spade Gaming
router.post('/SpadeGaming', gameAmbApi.SpadeGaming)
router.post('/SpadeGaming/checkBalance', gameAmbApi.SpadeGaming)
//Spade Gaming

//Ninja Slot/918 Kiss
router.post('/Ninja918/transaction', gameAmbApiSu.FishingNinja918)
//Ninja Slot/918 Kiss

//GameAPi
router.post('/game/checkBalance', gameAmbApiSu.GameCheckBalance)
router.post('/game/placeBets', gameAmbApiSu.GamePlaceBets)
router.post('/game/settleBets', gameAmbApiSu.GameSettleBets)
router.post('/game/cancelBets', gameAmbApiSu.GameCancelBets)
router.post('/game/adjustBets', gameAmbApiSu.GameAdjustBets)
router.post('/game/unsettleBets', gameAmbApiSu.GameUnsettleBets)
router.post('/game/winRewards', gameAmbApiSu.GameWinRewards)
router.post('/game/cancelTips', gameAmbApiSu.GameTipsCancel)
router.post('/game/voidBets', gameAmbApiSu.GameVoidBets)
//GameAPi

//EBet
router.post('/EBet/registerOrLogin', liveCasino.registerOrLoginEBet)
router.post('/EBet/syncCredit', liveCasino.GetBalanceEBet)
router.post('/EBet/increaseCredit', liveCasino.IncreaseCreditEBet)
router.post('/EBet/queryIncreaseCreditRecord', liveCasino.IncreaseCreditRecordsEBet)
router.post('/EBet/refundSingleWallet', liveCasino.SingleWalletEBet)
router.post('/EBet/autoBatchRefund', liveCasino.BatchRefundEBet)
//EBet

//bigGame
router.post('/bigGame', liveCasino.IntegrationAPIsBigGaming)
//bigGame

//SA Gaming
router.post('/SA/GetUserBalance', liveCasino.GetBalanceSA)
router.post('/SA/PlaceBet', liveCasino.PlaceBetSA)
router.post('/SA/PlayerWin', liveCasino.PlayerWinSA)
router.post('/SA/PlayerLost', liveCasino.PlayerLostSA)
router.post('/SA/PlaceBetCancel', liveCasino.PlaceBetCancelSA)
//SA Gaming

//Pragmatic Play
router.post('/Play/authenticate.html', liveCasino.AuthenticatePlay)
router.post('/Play/balance.html', liveCasino.GetBalancePlay)
router.post('/Play/bet.html', liveCasino.BetPlay)
router.post('/Play/result.html', liveCasino.ResultPlay)
router.post('/Play/endRound.html', liveCasino.EndRoundPlay)
router.post('/Play/refund.html', liveCasino.RefundPlay)
router.post('/Play/bonusWin.html', liveCasino.BonusWinPlay)
router.post('/Play/jackpotWin.html', liveCasino.BonusWinPlay)
router.post('/Play/promoWin.html', liveCasino.BonusWinPlay)
//Pragmatic Play

//WM Casino
router.post('/WM/balance', liveCasino.GetBalanceWM)
router.post('/WM/betPayin', liveCasino.PlaceBetWM)
router.post('/WM/betPayout', liveCasino.PayoutWM)
router.post('/WM/refund', liveCasino.RefundWM)
//WM Casino

//Xtreme Gaming
router.post('/Xtreme/user/balance', liveCasino.GetBalanceXtreme)
router.post('/Xtreme/transaction/bet', liveCasino.PlaceBetXtreme)
router.post('/Xtreme/transaction/settle', liveCasino.SettleBetXtreme)
router.post('/Xtreme/transaction/rollback', liveCasino.CancelXtreme)
//Xtreme Gaming

//SexyGaming
router.post('/SexyGaming', urlencodedParser, liveCasino.GetBalanceSexyGaming)
//SexyGaming

//testGame API
module.exports = router;