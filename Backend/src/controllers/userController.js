const httpStatus = require('http-status');
const UserService = require('../services/userService');
const TokenService = require('../services/TokenService');
const TokenDao = require('../dao/TokenDao');
const AuthFunctions = require('../functions/AuthFunction');
const OtpDao = require('../dao/OtpDao');

class UserController {
    constructor() {
        this.tokenService = new TokenService();
        this.userService = new UserService();
        this.authFunctions = new AuthFunctions();
        this.tokenDao = new TokenDao();
        this.OtpDao = new OtpDao();
    }


    create = async(req, res) => {
        try {
            const user = await this.userService.create(req.body);
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


    update = async(req, res) => {
        try {
            const user = await this.userService.update(req.body, req.params.id);
            const { status, message, data } = user.response;
            if (data && data.password) {
                delete data.password;
            }
            res.status(user.statusCode).send({ status, message, data });
        } catch (e) {
            res.status(httpStatus.BAD_GATEWAY).send(e);
        }
    };


    delete = async(req, res) => {
        try {
            const user = await this.userService.delete(req.params.id);
            const { status, message } = user.response;
            res.status(user.statusCode).send({ status, message });
        } catch (e) {
            res.status(httpStatus.BAD_GATEWAY).send(e);
        }
    };

}



module.exports = UserController;