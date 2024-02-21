let io;

function initSocket(server) {
    io = require("socket.io")(server, {
        cors: {
            cors: true,
            origins: ["*"],
            methods: ["GET", "POST"]
        }
    });
	
    io.on('connection', (socket) => {
        console.log('A user is connected with socket');
    });
}

function getIo() {
    if (!io) {
        throw new Error('Socket.io has not been initialized.');
    }
    return io;
}

module.exports = {
    initSocket,
    getIo
};