const httpStatus = require('http-status');
const SensorService = require('../services/sensorService');

class SensorController {
    constructor() {
        this.sensorService = new SensorService();
    }




    // ####################################################### START  Soil Moisture  Section  #######################################################


    addSoilMoisture = async(req, res) => {
        try {
            const soilMoisture = await this.sensorService.addSoilMoisture(req.body);
            const { message, data, status } = soilMoisture.response;
            res.status(soilMoisture.statusCode).send({ status, message, data });
        } catch (e) {
            res.status(httpStatus.BAD_GATEWAY).send(e);
        }
    };



    getSoilMoisture = async(req, res) => {
        try {
            const soilMoisture = await this.sensorService.getSoilMoisture();
            const { message, data, status } = soilMoisture.response;
            res.status(soilMoisture.statusCode).send({ status, message, data });
        } catch (e) {
            res.status(httpStatus.BAD_GATEWAY).send(e);
        }
    };

    // ####################################################### END  Soil Moisture  Section  #######################################################


    // ####################################################### START  Water Level   Section  #######################################################

    addWaterLevel = async(req, res) => {
        try {
            const waterLevel = await this.sensorService.addWaterLevel(req.body);
            const { message, data, status } = waterLevel.response;
            res.status(waterLevel.statusCode).send({ status, message, data });
        } catch (e) {
            res.status(httpStatus.BAD_GATEWAY).send(e);
        }
    };



    getWaterLevel = async(req, res) => {
        try {
            const waterLevel = await this.sensorService.getWaterLevel();
            const { message, data, status } = waterLevel.response;
            res.status(waterLevel.statusCode).send({ status, message, data });
        } catch (e) {
            res.status(httpStatus.BAD_GATEWAY).send(e);
        }
    };

    // ####################################################### END  Water Level  Section  #######################################################


    // ####################################################### START  Flame   Section  #######################################################

    toggleFlame = async(req, res) => {
        try {
            const flame = await this.sensorService.toggleFlame();
            const { message, data, status } = flame.response;
            res.status(flame.statusCode).send({ status, message, data });
        } catch (e) {
            res.status(httpStatus.BAD_GATEWAY).send(e);
        }
    };



    getFlame = async(req, res) => {
        try {
            const flame = await this.sensorService.getFlame();
            const { message, data, status } = flame.response;
            res.status(flame.statusCode).send({ status, message, data });
        } catch (e) {
            res.status(httpStatus.BAD_GATEWAY).send(e);
        }
    };

    // ####################################################### END  Flame  Section  #######################################################

    // ####################################################### START  Pump   Section  #######################################################

    togglePump = async(req, res) => {
        try {
            const pump = await this.sensorService.togglePump();
            const { message, data, status } = pump.response;
            res.status(pump.statusCode).send({ status, message, data });
        } catch (e) {
            res.status(httpStatus.BAD_GATEWAY).send(e);
        }
    };



    getPump = async(req, res) => {
        try {
            const pump = await this.sensorService.getPump();
            const { message, data, status } = pump.response;
            res.status(pump.statusCode).send({ status, message, data });
        } catch (e) {
            res.status(httpStatus.BAD_GATEWAY).send(e);
        }
    };

    // ####################################################### END  Pump  Section  #######################################################



    // ####################################################### START  Rain Drop   Section  #######################################################

    toggleRainDrop = async(req, res) => {
        try {
            const rainDrop = await this.sensorService.toggleRainDrop();
            const { message, data, status } = rainDrop.response;
            res.status(rainDrop.statusCode).send({ status, message, data });
        } catch (e) {
            res.status(httpStatus.BAD_GATEWAY).send(e);
        }
    };



    getRainDrop = async(req, res) => {
        try {
            const rainDrop = await this.sensorService.getRainDrop();
            const { message, data, status } = rainDrop.response;
            res.status(rainDrop.statusCode).send({ status, message, data });
        } catch (e) {
            res.status(httpStatus.BAD_GATEWAY).send(e);
        }
    };

    // ####################################################### END  Rain Drop  Section  #######################################################




}



module.exports = SensorController;