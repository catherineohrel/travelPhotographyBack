require("dotenv").config()
const express = require("express")
const cookieParser = require("cookie-parser")
const cors = require("cors")

const router = require("./router")

const app = express()

app.use(cors("*"))
  //   origin: "http://localhost:3000",
  //   credentials: true,
  //   optionsSuccessStatus: 200,
  // })
  // )
app.use(express.json())
app.use(cookieParser())

app.get("/", (req, res) => {
  res.status(200).send("on est dans le /")
})

app.use("/api", router)

// If the user tries to access a page that doesn't exist
app.get("*", (req, res) => {
  res.status(404).json({message: "Not found"})
})

module.exports = app
