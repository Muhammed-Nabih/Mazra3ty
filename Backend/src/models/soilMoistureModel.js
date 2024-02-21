const mongoose = require('mongoose');

const soilMoistureSchema = new mongoose.Schema({
    outputPercentage: {
        type: String,
        required: true,
    },
}, {
    timestamps: true,
});

const soilMoisture = mongoose.model('SoilMoisture', soilMoistureSchema);

module.exports = soilMoisture;