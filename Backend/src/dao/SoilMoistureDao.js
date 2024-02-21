const SuperDao = require('./SuperDao');

class SoilMoistureDao extends SuperDao {
    constructor() {
        super("soilMoisture");
    }

}

module.exports = SoilMoistureDao;
