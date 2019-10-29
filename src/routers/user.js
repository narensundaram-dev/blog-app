const express = require("express")

const router = new express.Router()

router.post('/users', (req, res) => {
    console.log("POST: /users", req.body)
    res.status(200).send({msg: "Registration Successful!"})
})

/*
const User = require("./models/user")
const user = new User({
    name: "Narendran G",
    username: "narensundaram-dev",
    password: "12345678",
    gender: "male"
})
user.save().then((response) => {
    console.log("then", response)
} ).catch((err) => {
    console.log("error", err)
})
*/

module.exports = router
