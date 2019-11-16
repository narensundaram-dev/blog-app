const mongoose = require("mongoose")
const bcrypt = require("bcryptjs")
const jwt = require("jsonwebtoken")

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
    },
    dp: {
        type: String
    },
    tokens: [{
        token: {
            type: String,
            required: true
        }
    }]
}, {
    timestamps: true
})

userSchema.methods.generateJWT = async function() {
    const user = this

    const token = jwt.sign({_id: user.id.toString()}, process.env.JWT_SECRET_KEY)
    user.tokens = user.tokens.concat( {token} )
    await user.save()
    
    return token
}

userSchema.pre('save', async function(next) {
    const user = this
    if (user.isModified('password')) user.password = await bcrypt.hash(user.password, 8)
    next()
})

userSchema.methods.toJSON = function() {
    const user = this
    const userObj = user.toObject()
    const fields = ['_id', 'name', 'username', 'createdAt', 'updatedAt', 'dp']

    for (let key in userObj) {
        if (fields.indexOf(key) == -1) delete userObj[key]
    }

    return userObj
}

const User = mongoose.model("User", userSchema)
module.exports = User
