import "dotenv/config"
import express from "express"

const app = express()
const PORT = process.env.PORT || 3000

app.use(express.json())

app.listen(PORT, err => {
    if(err) {
        console.log(err)
        return
    }
    console.log(`Server listening on http://localhost:${PORT}`)
})
