var express = require('express');
var logger = require('morgan');
const dotenv = require('dotenv');
const passport = require('passport');
const { jwtStrategy } = require('./config/passport');
const globalError = require('../src/middlewares/errorMiddleware');
const dbConnection = require('./config/database');
const cors = require('cors');
dotenv.config({ path: 'config.env' });

// middlewares
const corsOptions = require('../src/middlewares/cors');

// routes
const routes = require('./route');


// Connect with db 
dbConnection();
var app = express();

// Use CORS middleware
app.use(cors(corsOptions));


// view engine setup
app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

// jwt authentication
app.use(passport.initialize());
passport.use('jwt', jwtStrategy);

app.use('/api', routes);


// catch 404 and forward to error handler
app.use(function(req, res, next) {
    next(createError(404));
});

// Global error handling Middleware
app.use(globalError);


module.exports = app;