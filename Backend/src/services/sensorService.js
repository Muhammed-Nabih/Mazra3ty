const httpStatus = require('http-status');
const SoilMoistureDao = require('../dao/SoilMoistureDao');
const WaterLevelDao = require('../dao/WaterLevelDao');
const FlameDao = require('../dao/FlameDao');
const PumpDao = require('../dao/pumpDao');
const RainDropDao = require('../dao/RainDropDao');

const responseHandler = require('../helper/responseHandler');
const asyncHandler = require('express-async-handler');
const { getIo } = require('../helper/socket');
class SensorService {
    constructor() {
        this.soilMoistureDao = new SoilMoistureDao();
        this.waterLevelDao = new WaterLevelDao();
        this.flameDao = new FlameDao();
        this.pumpDao = new PumpDao();
        this.rainDropDao = new RainDropDao();
    }

    // ####################################################### START  Soil Moisture  Section  #######################################################

    /**
     * add Soil Moisture
     * @param {object} body
     */
    addSoilMoisture = asyncHandler(async(body) => {
        try {
            let data = await this.soilMoistureDao.create(body);
            if (data) {
                getIo().emit('Statistics', { data: data });
                return responseHandler.returnSuccess(httpStatus.OK, 'Done', data);
            }
        } catch (e) {
            console.log(e)
            return responseHandler.returnError(httpStatus.BAD_GATEWAY, 'Something Went Wrong in add Soil Moisture in SensorService  !!');
        }
    });


    /**
     * get Last Created Soil Moisture
     */
    getSoilMoisture = async() => {
        let statusCode = httpStatus.OK;
        try {
            let data = await this.soilMoistureDao.findLastCreated();
            return responseHandler.returnSuccess(statusCode, 'Done', data);
        } catch (e) {
            console.log(e)
            return responseHandler.returnError(httpStatus.BAD_GATEWAY, 'Something Went Wrong in get Soil Moisture in SensorService  !!');
        }
    };

    // ####################################################### END  Soil Moisture  Section  #######################################################

    // ####################################################### START  Water Level   Section  #######################################################


    /**
     * add Soil Moisture
     * @param {object} body
     */
    addWaterLevel = asyncHandler(async(body) => {
        try {
            let data = await this.waterLevelDao.create(body);
            if (data) {
                getIo().emit('Statistics', { data: data });
                return responseHandler.returnSuccess(httpStatus.OK, 'Done', data);
            }
        } catch (e) {
            console.log(e)
            return responseHandler.returnError(httpStatus.BAD_GATEWAY, 'Something Went Wrong in add  Water Level in SensorService  !!');
        }
    });


    /**
     * get Last Created Soil Moisture
     */
    getWaterLevel = async() => {
        let statusCode = httpStatus.OK;
        try {
            let data = await this.waterLevelDao.findLastCreated();
            return responseHandler.returnSuccess(statusCode, 'Done', data);
        } catch (e) {
            console.log(e)
            return responseHandler.returnError(httpStatus.BAD_GATEWAY, 'Something Went Wrong in get  Water Level in SensorService  !!');
        }
    };
    // ####################################################### END  Water Level  Section  #######################################################


    // ####################################################### START Flame  Section  #######################################################


    /**
     * add toggle Flame
     */

    toggleFlame = asyncHandler(async() => {
        const flame = await this.getFlame();
        try {
            let data = await this.flameDao.updateLastCreated(!flame.response.data.fire, 'fire');
            if (data) {
                getIo().emit('Flame', { data: data });
                return responseHandler.returnSuccess(httpStatus.OK, 'Done', data);
            }
        } catch (e) {
            console.log(e)
            return responseHandler.returnError(httpStatus.BAD_GATEWAY, 'Something Went Wrong in add  Flame in SensorService  !!');
        }
    });


    /**
     * get Last get Flame
     */
    getFlame = async() => {
        let statusCode = httpStatus.OK;
        try {
            let data = await this.flameDao.findLastCreated();
            if (data === null) {
                data = await this.flameDao.create({});
            }
            return responseHandler.returnSuccess(statusCode, 'Done', data);
        } catch (e) {
            console.log(e)
            return responseHandler.returnError(httpStatus.BAD_GATEWAY, 'Something Went Wrong in get Flame in SensorService  !!');
        }
    };
    // ####################################################### END  Flame  Section  #######################################################

    // ####################################################### START Pump  Section  #######################################################

    /**
     * add toggle Pump
     */

    togglePump = asyncHandler(async() => {
        const pump = await this.getPump();
        try {
            let data = await this.pumpDao.updateLastCreated(!pump.response.data.isOn, 'isOn');
            if (data) {
                getIo().emit('Pump', { data: data });
                return responseHandler.returnSuccess(httpStatus.OK, 'Done', data);
            }
        } catch (e) {
            console.log(e)
            return responseHandler.returnError(httpStatus.BAD_GATEWAY, 'Something Went Wrong in add  Pump in SensorService  !!');
        }
    });


    /**
     * get Last get Pump
     */
    getPump = async() => {
        let statusCode = httpStatus.OK;
        try {
            let data = await this.pumpDao.findLastCreated();
            if (data === null) {
                data = await this.pumpDao.create({});
            }
            return responseHandler.returnSuccess(statusCode, 'Done', data);
        } catch (e) {
            console.log(e)
            return responseHandler.returnError(httpStatus.BAD_GATEWAY, 'Something Went Wrong in get Pump in SensorService  !!');
        }
    };
    // ####################################################### END  Pump  Section  #######################################################



    // ####################################################### Rain Drop  Section  #######################################################

    /**
     *  toggle Pump
     */

    toggleRainDrop = asyncHandler(async() => {
        const rainDrop = await this.getRainDrop();
        try {
            let data = await this.rainDropDao.updateLastCreated(!rainDrop.response.data.rain, 'rain');
            if (data) {
                getIo().emit('Rain Drop', { data: data });
                return responseHandler.returnSuccess(httpStatus.OK, 'Done', data);
            }
        } catch (e) {
            console.log(e)
            return responseHandler.returnError(httpStatus.BAD_GATEWAY, 'Something Went Wrong in add  Rain Drop in SensorService  !!');
        }
    });


    /**
     * get Last get Pump
     */
    getRainDrop = async() => {
        let statusCode = httpStatus.OK;
        try {
            let data = await this.rainDropDao.findLastCreated();
            if (data === null) {
                data = await this.rainDropDao.create({});
            }
            return responseHandler.returnSuccess(statusCode, 'Done', data);
        } catch (e) {
            console.log(e)
            return responseHandler.returnError(httpStatus.BAD_GATEWAY, 'Something Went Wrong in get Rain Drop in SensorService  !!');
        }
    };
    // ####################################################### END  Rain Drop  Section  #######################################################
    // ####################################################### start statistics #######################################################

    getStatistics = async(req, res) => {
        let statusCode = httpStatus.OK;
        try {
            const soilMoisture = await this.soilMoistureDao.findLastCreated();
            const waterLevel = await this.waterLevelDao.findLastCreated();
            return responseHandler.returnSuccess(statusCode, 'Done', { soilMoisture, waterLevel });
        } catch (e) {
            console.log(e);
            res.status(httpStatus.BAD_GATEWAY).send(e);
        }
    };

    // ####################################################### End statistics #######################################################
}

module.exports = SensorService;