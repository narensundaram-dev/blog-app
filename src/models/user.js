const mongoose = require("mongoose")
const bcrypt = require("bcryptjs")

const userSchema = new mongoose.Schema({
    name: {
        type: String,
        required: true
    },
    username: {
        type: String,
        unique: true,
        required: true,
        trim: true,
        lowercase: true,
        slug: true
    },
    password: {
        type: String,
        trim: true,
        minlength: true,
        required: true
    }
}, {
    timestamps: true
})

userSchema.pre('save', async function(next) {
    const user = this
    if (user.isModified('password')) user.password = await bcrypt.hash(user.password, 8)
    next()
})

const User = mongoose.model("User", userSchema)
module.exports = User
