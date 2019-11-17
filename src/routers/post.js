const express = require("express")

const Post = require("../models/post")
const auth = require("../middlewares/auth")

const router = new express.Router()

// Create a Post
router.post("/post", auth, async (req, res) => {
    let body = req.body
    body.user = req.user
    try {
        let post = new Post(body)
        const data = {post: await post.save()}
        return res.status(201).send({status: 1, msg: "", data})
    } catch(err) {
        const error = {title: err.toString(), desc: err.stack}
        res.status(400).send({status: 0, msg: {error}, data: {}})
    }
})

// Get a Post
router.get("/post/:id", async (req, res) => {
    try {
        let post = await Post.findById(req.params.id).populate("user")
        if (!post) return res.status(404).send({status: 0, msg: "Not found!", data: {}})
        const data = {post}
        res.send({status: 1, msg: "", data})
    } catch (err) {
        const error = { title: err.toString(), desc: err.stack }
        res.status(400).send({status: 0, msg: {error}, data: {}})
    }
})

// Get all Posts
router.get("/post", async (req, res) => {
    try {
        const data = {posts: await Post.find({}).populate("user"), count: await Post.countDocuments()}
        if (!data) return res.status(404).send({status: 0, msg: "Not found!", data: {}})
        res.send({status: 1, msg: "", data})
    } catch (err) {
        const error = { title: err.toString(), desc: err.stack }
        res.status(400).send({status: 0, msg: {error}, data: {}})
    }
})

// Update a Post
router.put("/post/:id", auth, async (req, res) => {
    try {
        let post = await Post.findByIdAndUpdate(req.params.id, req.body, {new: true}).populate("user")
        const data = {post}
        if (!post) return res.status(404).send({status: 0, msg: "Not found!", data: {}})
        res.send({status: 1, msg: "", data})
    } catch (err) {
        const error = { title: err.toString(), desc: err.stack }
        res.status(400).send({status: 0, msg: {error}, data: {}})
    }
})

// Delete a Post
router.delete("/post/:id", auth, async (req, res) => {
    try {
        const data = {post: await Post.findByIdAndDelete(req.params.id).populate("user")}
        if (!data) return res.status(404).send({status: 0, msg: "Not found!", data: {}})
        res.send({status: 1, msg: "", data})
    } catch (err) {
        const error = { title: err.toString(), desc: err.stack }
        res.status(400).send({status: 0, msg: {error}, data: {}})
    }
})

module.exports = router
