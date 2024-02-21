const express = require('express');
const SensorController = require('../controllers/sensorController');
const router = express.Router();
const auth = require('../middlewares/auth');

const sensorController = new SensorController();


router.route('/soil-moisture').post(sensorController.addSoilMoisture).get(auth(), sensorController.getSoilMoisture);
router.route('/water-level').post(sensorController.addWaterLevel).get(auth(), sensorController.getWaterLevel);
router.route('/flame').post(sensorController.toggleFlame).get(auth(), sensorController.getFlame);
router.route('/pump').post(sensorController.togglePump).get(auth(), sensorController.getPump);
router.route('/rain-drop').post(sensorController.toggleRainDrop).get(auth(), sensorController.getRainDrop);
router.route('/statistics').get(sensorController.getStatistics);

// auth(),


module.exports = router;