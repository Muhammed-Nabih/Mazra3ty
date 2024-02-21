const express = require('express');
const router = express.Router();
const authRoute = require('./authRoute')
const userRoute = require('./userRoute')
const sensorRoute = require('./sensorRoute')

const defaultRoutes = [
	{
        path: '/auth',
        route: authRoute,
    },
    {
        path: '/user',
        route: userRoute,
    },
	{
        path: '/sensor',
        route: sensorRoute,
    },
];

defaultRoutes.forEach((route) => {
    router.use(route.path, route.route);
});

module.exports = router;