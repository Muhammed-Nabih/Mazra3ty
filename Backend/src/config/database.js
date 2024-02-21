const mongoose = require('mongoose')

const dbConnection = () => {
    mongoose.connect(process.env.DB_URL).then((conn) => {
        console.log(`Database Connected : ${conn.connection.host}`);
    }).catch((err) => {
        console.log(` Database err :${err}`)
    })
}

module.exports = dbConnection;