const dotenv = require('dotenv');
const path = require('path');
dotenv.config({ path: path.join(__dirname, '../../config.env') });

module.exports = {
    jwt: {
        secret: process.env.JWT_SECRET,
        accessExpirationMinutes: process.env.JWT_ACCESS_EXPIRATION_MINUTES,
        accessExpirationDays: process.env.JWT_ACCESS_EXPIRATION_DAYS,
        refreshExpirationDays: process.env.JWT_REFRESH_EXPIRATION_DAYS,
        resetPasswordExpirationMinutes: process.env.JWT_RESET_PASSWORD_EXPIRATION_MINUTES,
        verifyEmailExpirationMinutes: process.env.JWT_VERIFY_EMAIL_EXPIRATION_MINUTES,
    },
};