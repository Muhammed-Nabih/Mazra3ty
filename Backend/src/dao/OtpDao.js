const SuperDao = require('./SuperDao');
const Otp = require('../models/otpModel');

class OtpDao extends SuperDao {
    constructor() {
        super("otp");
    }

    async remove(where) {
        return Otp.deleteMany(where);
    }


}

module.exports = OtpDao;