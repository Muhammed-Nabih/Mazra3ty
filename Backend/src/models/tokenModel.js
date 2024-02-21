const mongoose = require('mongoose')

const tokenSchema = new mongoose.Schema({
    user_id: {
        type: mongoose.Schema.Types.ObjectId,
        required: true,
        unique: true,
        ref: 'User',
    },
    access: {
        token: {
            type: String,
            required: true,
        },
        expires: {
            type: Date,
            required: true,
        },
    },
    refresh: {
        token: {
            type: String,
            required: true,
        },
        expires: {
            type: Date,
            required: true,
        },
    },
});

const tokenModel = mongoose.model('Token', tokenSchema)
module.exports = tokenModel;