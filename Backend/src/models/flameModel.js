const mongoose = require('mongoose');

const flameSchema = new mongoose.Schema({
    fire: {
        type: Boolean,
        default: false,
    },
}, {
    timestamps: true,
});

const flame = mongoose.model('flame', flameSchema);

module.exports = flame;