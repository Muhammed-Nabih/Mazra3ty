const SuperDao = require('./SuperDao');

class WaterLevelDao extends SuperDao {
    constructor() {
        super("waterLevel");
    }

}

module.exports = WaterLevelDao;
