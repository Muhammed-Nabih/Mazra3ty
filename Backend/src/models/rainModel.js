const mongoose = require('mongoose');

const rainSchema = new mongoose.Schema({
    rain: {
        type: Boolean,
        default: false,
    },
}, {
    timestamps: true,
});

const rain = mongoose.model('rain', rainSchema);

module.exports = rain;