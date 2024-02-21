const SuperDao = require('./SuperDao');

class UserDao extends SuperDao {
    constructor() {
        super("user");
    }

}

module.exports = UserDao;
