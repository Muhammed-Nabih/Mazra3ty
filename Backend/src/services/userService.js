const httpStatus = require('http-status');
const UserDao = require('../dao/UserDao');
const TokenDao = require('../dao/TokenDao');
const OtpDao = require('../dao/OtpDao');
const responseHandler = require('../helper/responseHandler');
const asyncHandler = require('express-async-handler');

class UserService {
    constructor() {
        this.userDao = new UserDao();
        this.tokenDao = new TokenDao();
        this.OtpDao = new OtpDao();
    }

    /**
     * Create a User
     * @param {object} body
     */
    create = asyncHandler(async(body) => {
        try {
            let user = await this.userDao.create(body);
            return responseHandler.returnSuccess(httpStatus.OK, 'تم انشاء حساب بنجاح', user);
        } catch (e) {
            console.log(e)
            return responseHandler.returnError(httpStatus.BAD_GATEWAY, 'Something Went Wrong!!');
        }
    });


    /**
     * Delete a User
     * @param {object} body
     */
    update = async(body, _id) => {
		let message = 'تم التعديل بنجاح';
		let statusCode = httpStatus.OK;
        try {
            let user = await this.userDao.updateById({ _id }, body);
            return responseHandler.returnSuccess(statusCode, message, user);
        } catch (e) {
            return responseHandler.returnError(httpStatus.BAD_GATEWAY, 'Something Went Wrong in update UserService class!!');
        }
    };

	listUserByRole = async(role) => {

		let statusCode = httpStatus.OK;
        try {
            let user = await this.userDao.findAllByWhere({ role });
			console.log(user);

            return responseHandler.returnSuccess(statusCode, 'تم  بنجاح' , user);
        } catch (e) {
            return responseHandler.returnError(httpStatus.BAD_GATEWAY, 'Something Went Wrong in update UserService class!!');
        }
    }



    /**
     * Delete a User
     * @param {String} _id
     */
    delete = async(_id) => {
        try {
            let message = 'تم حذف المستخدم بنجاح';
            let statusCode = httpStatus.OK;
            let user = await this.userDao.deleteById({ _id });
            console.log(user);
            if (user == null) {
                return responseHandler.returnError(
                    httpStatus.BAD_REQUEST,
                    'هذا المستخدم غير موجود',
                );
            }

            return responseHandler.returnSuccess(statusCode, message);
        } catch (e) {
            return responseHandler.returnError(httpStatus.BAD_GATEWAY, 'Something Went Wrong!!');
        }
    };

}

module.exports = UserService;