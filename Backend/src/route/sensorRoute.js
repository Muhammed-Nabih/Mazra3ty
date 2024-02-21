const express = require('express');
const SensorController = require('../controllers/sensorController');
const router = express.Router();

const sensorController = new SensorController();


router.route('/soil-moisture').post(sensorController.addSoilMoisture).get(sensorController.getSoilMoisture);
router.route('/water-level').post(sensorController.addWaterLevel).get(sensorController.getWaterLevel);
router.route('/flame').post(sensorController.toggleFlame).get(sensorController.getFlame);
router.route('/pump').post(sensorController.togglePump).get(sensorController.getPump);
router.route('/rain-drop').post(sensorController.toggleRainDrop).get(sensorController.getRainDrop);




module.exports = router;