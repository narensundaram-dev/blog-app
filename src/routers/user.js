const express = require("express")
const User = require("../models/user")
const bcrypt = require("bcryptjs")
const auth = require("../middlewares/auth")

const router = new express.Router()

// User Registration
router.post('/users', async (req, res) => {
    var user = new User(req.body)
    try {
        var data = {user: await user.save()}
        res.status(201).send({status: 1, msg: "", data})
    } catch (err) {
        const error = {title: err.toString(), desc: err.stack}
        res.status(400).send({status: 0, msg: {error}, data: {}})
    }
})

// Get users
router.get('/users', async (req, res) => {
    try {
        var data = {users: await User.find()}
        res.send({status: 1, msg: "", data})
    } catch (err) {
        const error = {title: err.toString(), desc: err.stack}
        res.status(400).send({status: 0, msg: {error}, data: {}})
    }
})

// Update user
router.put('/users/:id', async (req, res) => {
    try {
        var data = {user: await User.findByIdAndUpdate(req.params.id, req.body,  {new: true})}
        res.send({status: 1, msg: "", data})
    } catch (err) {
        const error = {title: err.toString(), desc: err.stack}
        res.status(400).send({status: 0, msg: {error}, data: {}})
    }
})

// Delete user
router.delete('/users/:id', async (req, res) => {
    try {
        var user = await User.findById(req.params.id)
        if (!user) {
            res.status(404).send({status: 0, msg: "User not found!", data: {}})    
        }
        await user.delete()
        res.send({status: 1, msg: "", data: {user}})
    } catch (err) {
        const error = {title: err.toString(), desc: err.stack}
        res.status(400).send({status: 0, msg: {error}, data: {}})
    }
})

// Login
router.post('/users/login', async (req, res) => {
    try {
        var body = req.body
        var user = await User.findOne({username: body.username})

        if (!user) throw new Error("User not found in database!")
        
        const isValid = await bcrypt.compare(body.password, user.password)
        if(!isValid) throw new Error("Invalid credentials! Please try again.")

        const token = await user.generateJWT()
        res.send({status: 1, msg: "Logged in successfully!", data: {token}})
    } catch (err) {
        const error = {title: err.toString(), desc: err.stack}
        res.status(400).send({status: 0, msg: {error}, data: {}})
    }
})

// Logout
router.post('/users/logout', auth, async (req, res) => {
    try {
        const user = req.user
        user.tokens = user.tokens.filter((token) => {
            return req.token !== token.token
        })
        await user.save()

        res.send({status: 1, msg: "Logged out successfully!", data: {}})
    } catch (err) {
        const error = {title: err.toString(), desc: err.stack}
        res.status(400).send({status: 0, msg: {error}, data: {}})
    }
})

module.exports = router
