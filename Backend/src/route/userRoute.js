const express = require('express');
const router = express.Router();
const UserController = require('../controllers/userController');
const UserValidator = require('../validator/UserValidator');
const auth = require('../middlewares/auth');

const { create, delete: deleteUser, update, listUserByRole } = new UserController();
const { createValidator, updateValidator } = new UserValidator();

// Group routes by endpoint
router.post('/create', auth('admin'), createValidator, create);
router.delete('/delete/:id', auth('admin'), deleteUser);
router.put('/update/:id', auth(), updateValidator, update);
router.get('/list-user/:role', auth('admin'), listUserByRole);

module.exports = router;
