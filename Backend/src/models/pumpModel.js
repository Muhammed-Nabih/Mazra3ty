const mongoose = require('mongoose');

const pumpSchema = new mongoose.Schema({
    isOn: {
        type: Boolean,
        default: false,
    },
}, {
    timestamps: true,
});

const pump = mongoose.model('pump', pumpSchema);

module.exports = pump;