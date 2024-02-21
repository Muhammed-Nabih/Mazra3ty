const SuperDao = require('./SuperDao');

class PumpDao extends SuperDao {
    constructor() {
        super("pump");
    }

}

module.exports = PumpDao;
