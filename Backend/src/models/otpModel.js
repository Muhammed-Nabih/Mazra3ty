const mongoose = require('mongoose')

const otpSchema = new mongoose.Schema({
    user_id: {
        type: mongoose.Schema.Types.ObjectId,
        required: true,
        unique: true,
        ref: 'User',
    },
    otp: {
        type: String
    },
	token:{
		type: String
	}
});

const otpModel = mongoose.model('Otp', otpSchema)
module.exports = otpModel;