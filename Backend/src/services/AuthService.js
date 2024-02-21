const bcrypt = require('bcryptjs');
const httpStatus = require('http-status');
const UserDao = require('../dao/UserDao');
const TokenDao = require('../dao/TokenDao');
const OtpDao = require('../dao/OtpDao');
// const { tokenTypes } = require('../config/tokens');
const responseHandler = require('../helper/responseHandler');
const asyncHandler = require('express-async-handler');

class AuthService {
    constructor() {
        this.userDao = new UserDao();
        this.tokenDao = new TokenDao();
        this.OtpDao = new OtpDao();
    }

    /**
     * login a user
     * @param {String} phone
     * @param {String} email
     * @param {String} password
     * @returns {Promise<{response: {code: *, message: *, status: boolean}, statusCode: *}>}
     */
    login = asyncHandler(async(email, phone, password) => {
        try {
            let message = 'تم تسجيل الدخول بنجاح';
            let statusCode = httpStatus.OK;
            let queryLogin = phone === undefined ? { email } : { phone };
            let user = await this.userDao.findByWhere(queryLogin);
            if (user == null) {
                return responseHandler.returnError(
                    httpStatus.BAD_REQUEST,
                    'البريد الالكتروني او كلمة المرور غير صحيحه',
                );
            }
            const isPasswordValid = await bcrypt.compare(password, user.password);
            user = user.toJSON();
            delete user.password;

            if (!isPasswordValid) {
                statusCode = httpStatus.BAD_REQUEST;
                message = 'البريد الالكتروني او كلمة المرور غير صحيحه';
                return responseHandler.returnError(statusCode, message);
            }
            return responseHandler.returnSuccess(statusCode, message, user);
        } catch (e) {
            return responseHandler.returnError(httpStatus.BAD_GATEWAY, 'Something Went Wrong!! in login AuthService');
        }
    });




    /**
     * Create a user
     * @param {object} body
     */
    register = asyncHandler(async(body) => {
        try {
            let user = await this.userDao.create(body);
            return responseHandler.returnSuccess(httpStatus.OK, 'تم انشاء حساب بنجاح', user);
        } catch (e) {
            console.log(e)
            return responseHandler.returnError(httpStatus.BAD_GATEWAY, 'Something Went Wrong!!');
        }
    });



    /**
     * forgot Password 
     * @param {String} email
     */
    forgotPassword = async(email) => {
        try {
            let message = 'افحص البريد الالكتروني';
            let statusCode = httpStatus.OK;
            let user = await this.userDao.findByWhere({ email });
            if (user == null) {
                return responseHandler.returnError(
                    httpStatus.BAD_REQUEST,
                    'البريد الالكتروني غير صحيحه',
                );
            }

            return responseHandler.returnSuccess(statusCode, message, user);
        } catch (e) {
            return responseHandler.returnError(httpStatus.BAD_GATEWAY, 'Something Went Wrong!!');
        }
    };


    otp = async(otpCode) => {
        try {
            let message = 'كود صحيح';
            let statusCode = httpStatus.OK;
            let code = await this.OtpDao.findByWhere({ otp:otpCode });
            if (code == null) {
                return responseHandler.returnError(
                    httpStatus.BAD_REQUEST,
                    'كود غير صحيح',
                );
            }
            return responseHandler.returnSuccess(statusCode, message, code);
        } catch (e) {
            return responseHandler.returnError(httpStatus.BAD_GATEWAY, 'Something Went Wrong!!');
        }
    }

    logout = async(req, res) => {
        const refreshTokenDoc = await this.tokenDao.findOne({
            token: req.body.refresh.token,
            type: tokenTypes.REFRESH,
            blacklisted: false,
        });
        if (!refreshTokenDoc) {
            return false;
        }
        await this.tokenDao.remove({
            token: req.body.refresh.token,
            type: tokenTypes.REFRESH,
            blacklisted: false,
        });
        await this.tokenDao.remove({
            token: req.body.access.token,
            type: tokenTypes.ACCESS,
            blacklisted: false,
        });
        return true;
    };

	restorePassword = async (data, uuid) => {
        let user = await this.userDao.findById(uuid);
		
        if (!user) {
            return responseHandler.returnError(httpStatus.NOT_FOUND, 'User Not found!');
        }
        const updateUser = await this.userDao.updateById(
			uuid,
            { password: bcrypt.hashSync(data.password, 8) },
        );
		console.log(updateUser);


        if (updateUser) {
            return responseHandler.returnSuccess(
                httpStatus.OK,
                'تم تحديث كلمة السر بنجاح!',
                {},
            );
        }

        return responseHandler.returnError(httpStatus.BAD_REQUEST, 'Password Update Failed!');
    };
}

module.exports = AuthService;