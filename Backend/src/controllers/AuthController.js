const httpStatus = require('http-status');
const AuthService = require('../services/AuthService');
const TokenService = require('../services/TokenService');
const TokenDao = require('../dao/TokenDao');
const sendEmail = require('../helper/sendEmail');
const AuthFunctions = require('../functions/AuthFunction');
const OtpDao = require('../dao/OtpDao');
const jwt = require('jsonwebtoken');

class AuthController {
    constructor() {
        this.tokenService = new TokenService();
        this.authService = new AuthService();
        this.authFunctions = new AuthFunctions();
        this.tokenDao = new TokenDao();
        this.OtpDao = new OtpDao();
    }


    register = async(req, res) => {
        try {
            const user = await this.authService.register(req.body);
            let tokens = {};
            const { status } = user.response;

            if (user.response.status) {
                tokens = await this.tokenService.generateAuthTokens(user.response.data);
            }

            const { message, data } = user.response;
            res.status(user.statusCode).send({ status, message, data, tokens });
        } catch (e) {
            res.status(httpStatus.BAD_GATEWAY).send(e);
        }
    };


    login = async(req, res) => {
        try {
            const { email, phone, password } = req.body;

            const user = await this.authService.login(
                email?.toLowerCase(),
                phone,
                password,
            );

            console.log(user)

            const { message } = user.response;
            const { data } = user.response;
            const { status } = user.response;
            const code = user.statusCode;
            let tokens = {};
            if (data?._id !== undefined)
                await this.tokenDao.deleteTokenByUserId(data?._id);
            if (user.response.status) {
                tokens = await this.tokenService.generateAuthTokens(data);
            }

            res.status(user.statusCode).send({ status, code, message, data, tokens });
        } catch (e) {
            res.status(httpStatus.BAD_GATEWAY).send(e);
        }
    };


    forgotPassword = async(req, res) => {
        try {
            const { email } = req.body;
            const user = await this.authService.forgotPassword(
                email.toLowerCase(),
            );
            const { message } = user.response;
            const { data } = user.response;
            let codeOTP;
            if (user.response.status) {
                codeOTP = await this.authFunctions.otp(data._id);
            }
            await sendEmail(email, `إستعادة كلمة المرور`, `رمز OTP ${codeOTP}`, null);
            res.status(user.statusCode).send({ message });
        } catch (e) {
            res.status(httpStatus.BAD_GATEWAY).send(e);
        }
    };


    checkOTP = async(req, res) => {
        try {
            const { otp } = req.body;
            let token;
            const otpCode = await this.authService.otp(otp);
            const { message, status } = otpCode.response;
            const userOtp = await this.OtpDao.findByWhere({ otp });
            if (userOtp) {
                try {
                    const decodedToken = jwt.verify(userOtp.token, process.env.JWT_SECRET);
                    console.log(decodedToken);
                    token = await this.tokenService.generateTokenOTP(userOtp.user_id);
                } catch (error) {
					await this.OtpDao.remove({ otp });
                    if (error.name === 'TokenExpiredError') {
                        return res.status(httpStatus.UNAUTHORIZED).send({ message: 'انتهت صلاحية الكود' });
                    }
                    res.status(httpStatus.BAD_GATEWAY).send(error);
                }
            }
            res.status(otpCode.statusCode).send({ status, message, token });

        } catch (e) {
            res.status(httpStatus.BAD_GATEWAY).send(e);
        }
    }


    restorePassword = async(req, res) => {
        try {
            const { password, token } = req.body;
            try {
                const decodedToken = jwt.verify(token, process.env.JWT_SECRET);
                const responseData = await this.authService.restorePassword({ password }, decodedToken.sub);
                await this.OtpDao.remove({user_id:decodedToken.sub});
                res.status(responseData.statusCode).send(responseData);
            } catch (error) {
				await this.OtpDao.remove({user_id:decodedToken.sub});
                if (error.name === 'TokenExpiredError') {
                    return res.status(httpStatus.UNAUTHORIZED).send({ message: 'انتهت صلاحية الكود' });
                }
                res.status(httpStatus.BAD_GATEWAY).send(error);
            }
        } catch (e) {
            res.status(httpStatus.BAD_GATEWAY).send(e);
        }
    };


}



module.exports = AuthController;