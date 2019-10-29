const app = require("./app")
const port = process.env.port || 3000

app.get('/', (req, res) => {
    res.status(200).send("Hello World!")
})

app.listen(port, () => {
    console.log(`Blog app is up on port: ${port}. Let's play around!`)
})
