const randomstring = require('randomstring');
const otpMode = require('../models/otpModel')
const TokenService = require('../services/TokenService');

class AuthFunctions {
    constructor() {
            this.tokenService = new TokenService();
        }
        // Function to generate a unique 8-digit code
    otp = async function(userId) {
        console.log("userId", userId)
        let code;
        await otpMode.findOneAndDelete({ user_id: userId });
        do {
            // Generate a random 6-digit alphanumeric code
            code = randomstring.generate({ length: 6, charset: 'alphanumeric' });
            // Check if the code is already in use
            const existingCode = await otpMode.findOne({ otp: code });
            if (!existingCode) {
                const token = await this.tokenService.generateTokenOTP(userId);
                await otpMode.create({ user_id: userId, otp: code, token });
                break;
            }
        } while (true);

        return code;
    }


}

module.exports = AuthFunctions