const mongoose = require('mongoose');

const WaterLevelSchema = new mongoose.Schema({
    percentage: {
        type: String,
        required: true,
    },
}, {
    timestamps: true,
});

const waterLevel = mongoose.model('WaterLevel', WaterLevelSchema);

module.exports = waterLevel;