const express = require("express")
const User = require("../models/user")

const router = new express.Router()

// User Registration
router.post('/users', async (req, res) => {
    var user = new User(req.body)
    try {
        var data = {user: await user.save()}
        res.status(201).send({status: 1, msg: "", data})
    } catch (error) {
        res.status(400).send({status: 0, msg: error.errmsg, data: {}})
    }
})

// Get users
router.get('/users', async (req, res) => {
    try {
        var data = {users: await User.find()}
        res.status(200).send({status: 1, msg: "", data})
    } catch (error) {
        res.status(400).send({status: 0, msg: error.errmsg, data: {}})
    }
})

// Update user
router.put('/users/:id', async (req, res) => {
    try {
        var data = {user: await User.findByIdAndUpdate(req.params.id, req.body,  {new: true})}
        res.status(200).send({status: 1, msg: "", data})
    } catch (error) {
        res.status(400).send({status: 0, msg: error.errmsg, data: user})
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
        res.status(200).send({status: 1, msg: "", data: {user}})
    } catch (error) {
        res.status(400).send({status: 0, msg: error.errmsg, data})
    }
})

module.exports = router
