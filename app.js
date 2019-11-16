const express = require("express")
const userRouter = require("./src/routers/user")
const postRouter = require("./src/routers/post")
require("./src/db/mongoose")

const app = express()

app.use(express.json())
app.use(userRouter)
app.use(postRouter)

module.exports = app
