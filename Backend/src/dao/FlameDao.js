const SuperDao = require('./SuperDao');

class FlameDao extends SuperDao {
    constructor() {
        super("flame");
    }

}

module.exports = FlameDao;
