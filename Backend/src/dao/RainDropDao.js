const SuperDao = require('./SuperDao');

class RainDropDao extends SuperDao {
    constructor() {
        super("rain");
    }

}

module.exports = RainDropDao;
