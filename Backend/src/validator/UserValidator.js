const { check } = require('express-validator')
const validatorMiddleware = require('../middlewares/validatorMiddleware');
const UserDao = require('../dao/UserDao');

class UserValidator {

    constructor() {
        this.userDao = new UserDao();
    }


    createValidator = [
        check('name')
        .notEmpty()
        .withMessage('مطلوب المستخدم')
        .isLength({ min: 3 })
        .withMessage('اسم المستخدم قصير جدًا')
        .isLength({ max: 32 })
        .withMessage('اسم مستخدم طويل جدًا'),

        check('email').notEmpty()
        .withMessage('البريد الالكتروني مطلوب')
        .isEmail()
        .withMessage('عنوان البريد الإلكتروني غير صالح')
        .custom((val) =>
            this.userDao.findByWhere({ email: val }).then((user) => {
                if (user)
                    return Promise.reject(new Error('البريد الالكتروني موجود بالفعل'));
            })),


        check('password')
        .notEmpty()
        .withMessage('كلمة المرور مطلوبة')
        .isLength({ min: 6 })
        .withMessage('يجب أن تتكون كلمة المرور من 6 أحرف على الأقل').custom((password, { req }) => {
            if (password !== req.body.confirmPassword)
                throw new Error('تأكيد كلمة المرور غير صحيح');
            delete req.body.confirmPassword;
            return true;
        }),

        check('phone').optional().isMobilePhone("ar-EG").custom(async(val, { req }) => {
            const user = await this.userDao.findByWhere({ phone: val });
            if (user) {
                throw new Error('الرقم موجود بالفعل لا يمكنك استخدام هذا الرقم ');
            }
        }),

        check('role').notEmpty()
        .withMessage('دور المستخدم مطلوب')
        .custom((val) => {
            let roles = ["farmer", "veterinary", "admin"];
            if (!roles.includes(val))
                throw new Error('هذا الدور غير موجود في المزرعه');
            return true;
        }),

        check('active').optional(),
        validatorMiddleware
    ]


	updateValidator = [
        check('name')
        .isLength({ min: 3 }).optional()
        .withMessage('اسم المستخدم قصير جدًا')
        .isLength({ max: 32 })
        .withMessage('اسم مستخدم طويل جدًا'),

        check('email').optional()
        .isEmail()
        .withMessage('عنوان البريد الإلكتروني غير صالح')
        .custom((val) =>
            this.userDao.findByWhere({ email: val }).then((user) => {
                if (user)
                    return Promise.reject(new Error('البريد الالكتروني موجود بالفعل'));
            })),

        check('phone').optional().isMobilePhone("ar-EG").custom(async(val, { req }) => {
            const user = await this.userDao.findByWhere({ phone: val });
            if (user) {
                throw new Error('الرقم موجود بالفعل لا يمكنك استخدام هذا الرقم ');
            }
        }),

        check('active').optional(),
        validatorMiddleware
    ]

    loginValidator = [
        validatorMiddleware
    ]

    forgotPasswordValidator = [
        check('password')
        .notEmpty()
        .withMessage('كلمة المرور مطلوبة')
        .isLength({ min: 6 })
        .withMessage('يجب أن تتكون كلمة المرور من 6 أحرف على الأقل').custom((password, { req }) => {
            if (password !== req.body.confirmPassword)
                throw new Error('تأكيد كلمة المرور غير صحيح');
            delete req.body.confirmPassword;
            return true;
        }),
        validatorMiddleware
    ]
}

module.exports = UserValidator;