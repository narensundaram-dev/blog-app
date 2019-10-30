const mongoose = require("mongoose")

mongoose.connect(process.env.MONGO_URI, {
    useNewUrlParser: true,
    useCreateIndex: true,
    useFindAndModify: true,
    useUnifiedTopology: true
})
.then((res) => console.log("mongodb connection: success!"))
.catch((err) => console.log("mongodb connection - error: ", err))

module.exports = mongoose
