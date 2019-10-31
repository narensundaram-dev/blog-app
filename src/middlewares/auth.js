const jwt = require("jsonwebtoken")
const User = require("../models/user")

const auth = async (req, res, next) => {
    try {
        const token = req.header("Authorization").replace("Bearer ", "")

        if (!token) throw new Error("Token ")

        const tokenDecode = jwt.verify(token, process.env.JWT_SECRET_KEY)
        const user = await User.findOne( {_id: tokenDecode._id} )

        if(!user) throw new Error("Invalid JWT Token!")

        req.user = user
        req.token = token

        next()
    } catch (err) {
        const error = {title: err.toString(), desc: err.stack}
        return res.status(401).send({status: 0, msg: {error}, data: {}})   
    }
}

module.exports = auth
