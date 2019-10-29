const mongoose = require("mongoose")

// var MONGO_URI = "mongodb://node:node-session@node-sessions-lsbyx.mongodb.net/test?ssl=true&replicaSet=Main-shard-0&authSource=admin&retryWrites=true"
// mongodb://<username>:<password>@main-shard-00-00-03xkr.mongodb.net:27017,main-shard-00-01-03xkr.mongodb.net:27017,main-shard-00-02-03xkr.mongodb.net:27017/main?ssl=true&replicaSet=Main-shard-0&authSource=admin&retryWrites=true

var MONGO_URI = ""
mongoose.connect(process.env.MONGO_URI || MONGO_URI, {
    useNewUrlParser: true,
    useCreateIndex: true,
    useFindAndModify: true,
    useUnifiedTopology: true
})
.then((res) => console.log("mongodb connection: ", res))
.catch((err) => console.log("mongodb connection error: ", err))

module.exports = mongoose
