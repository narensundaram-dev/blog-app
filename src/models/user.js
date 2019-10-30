const mongoose = require("mongoose")

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

const User = mongoose.model("User", userSchema)
module.exports = User
