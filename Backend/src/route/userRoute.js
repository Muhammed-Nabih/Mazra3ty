const express = require('express');
const UserController = require('../controllers/userController');
const UserValidator = require('../validator/UserValidator');
const router = express.Router();
// const auth = require('../middlewares/auth');

const userController = new UserController();
const userValidator = new UserValidator();

router.post('/create', userValidator.createValidator, userController.create);
router.delete('/delete/:id', userController.delete);
router.put('/update/:id', userValidator.updateValidator, userController.update);
// router.put('/change-password',auth(),userValidator.changePasswordValidator, authController.changePassword);

module.exports = router;