const express = require('express');
const AuthController = require('../controllers/AuthController');
const UserValidator = require('../validator/UserValidator');

const router = express.Router();
// const auth = require('../middlewares/auth');

const authController = new AuthController();
const userValidator = new UserValidator();

router.post('/login', userValidator.loginValidator, authController.login);
router.post('/forgot-password', authController.forgotPassword); // To send email first step
router.post('/chech-otp', authController.checkOTP); // To send email first step
router.post('/restore-password', userValidator.forgotPasswordValidator, authController.restorePassword); // after open link get new pass
// router.post('/refresh-token', authController.refreshTokens);
// router.post('/logout', authController.logout);
// router.put('/change-password',auth(),userValidator.changePasswordValidator, authController.changePassword);

module.exports = router;
