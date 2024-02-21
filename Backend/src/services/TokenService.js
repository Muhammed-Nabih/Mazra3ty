const jwt = require('jsonwebtoken');
const moment = require('moment');
const config = require('../config/config');
const { tokenTypes } = require('../config/tokens');
const TokenDao = require('../dao/TokenDao');

class TokenService {
    constructor() {
        this.tokenDao = new TokenDao();
    }

    /**
     * Generate token
     * @param {string} uuid
     * @param {Moment} expires
     * @param {string} type
     * @param {string} [secret]
     * @returns {string}
     */

    generateToken = (uuid, expires, type, secret = config.jwt.secret) => {
        const payload = {
            sub: uuid,
            iat: moment().unix(),
            exp: expires.unix(),
            type,
        };
        return jwt.sign(payload, secret);
    };

    /**
     * Save a token
     * @param {string} token
     * @param {integer} userId
     * @param {Moment} expires
     * @param {string} type
     * @param {boolean} [blacklisted]
     * @returns {Promise<Token>}
     */
    saveToken = async(tokens, userId) => {
        return this.tokenDao.create({
            user_id: userId,
            ...tokens
        });
    };

    /**
     * Generate auth tokens
     * @param {{}} user
     * @returns {Promise<Object>}
     */
    generateAuthTokens = async(user) => {
        const accessTokenExpires = moment().add(config.jwt.accessExpirationMinutes, 'minutes');
        const accessToken = await this.generateToken(
            user._id,
            accessTokenExpires,
            tokenTypes.ACCESS,
        );
        const refreshTokenExpires = moment().add(config.jwt.refreshExpirationDays, 'days');
        const refreshToken = await this.generateToken(
            user._id,
            refreshTokenExpires,
            tokenTypes.REFRESH,
        );
        const tokens = {
            access: {
                token: accessToken,
                expires: accessTokenExpires.toDate(),
            },
            refresh: {
                token: refreshToken,
                expires: refreshTokenExpires.toDate(),
            },
        };

        await this.saveToken(tokens, user._id)


        return tokens;
    };

    async generateTokenOTP(userId) {
        const OtpTokenExpires = moment().add(config.jwt.accessExpirationMinutes, 'minutes');
        const OtpToken = await this.generateToken(
            userId,
            OtpTokenExpires,
            tokenTypes.FORGOT_PASSWORD,
        );
        return OtpToken;
    }

}

module.exports = TokenService;