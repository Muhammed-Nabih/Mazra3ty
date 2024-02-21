const SuperDao = require('./SuperDao');
const Token = require('../models/tokenModel');

class TokenDao extends SuperDao {
    constructor() {
        super("token");
    }

    async remove(where) {
        return Token.deleteMany({ where });
    }

    async deleteTokenByUserId(user_id) {
        return Token.findOneAndDelete({ user_id });
    }
}

module.exports = TokenDao;