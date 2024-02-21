const mongoose = require('mongoose')
const bcrypt = require('bcryptjs')
const UserSchema = new mongoose.Schema({
    email: {
        type: String,
        unique: true,
        trim: true,
        lowercase: true,
    },
    name: {
        type: String,
        trim: true,
        required: [true, 'الاسم مطلوب'],
        minLength: [3, 'قصير جدا'],
        maxLength: [30, 'كبير جدا'],
    },
    phone: {
        type: String,
        required: [true, 'الهاتف مطلوب'],
        unique: [true, 'يجب أن يكون البريد الهاتف فريدًا'],
    },
    password: {
        type: String,
        required: [true, 'كلمة المرور مطلوبة'],
        minLength: [6, 'يجب أن تتكون كلمة المرور من 6 أحرف و ارقام على الأقل'],
    },

    role: {
        type: String,
        required: true,
        enum: ['farmer', 'veterinary', 'admin']
    },

    active: {
        type: Boolean,
        default: true,
    },

}, {
    timestamps: true
});


UserSchema.pre('save', async function(next) {
    if (!this.isModified('password')) return next();
    // Hashing user password
    this.password = await bcrypt.hash(this.password, 12);
    next();
});

const UserModel = mongoose.model('User', UserSchema)
module.exports = UserModel;