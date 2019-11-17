const multer = require("multer")

const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, __dirname + '/../uploads')
    },
    filename: function (req, file, cb) {
        let fn = file.originalname
        cb(undefined, fn);
    }
});

const upload = multer({
    storage: storage,
    limits: {
        fileSize: 1024*1024*1 // 1 MB
    },
    fileFilter(req, file, callback) {
        if (!file.originalname.match(/\.(jpg|jpeg|png)$/)) {
            return callback(new Error("Please upload a file with extensions: jpg, jpeg, png"))
        }

        callback(undefined, true)
    }
})

module.exports = upload
