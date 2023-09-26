require("dotenv").config()
const express = require("express")
const cors = require("cors")

const router = require("./router")

const app = express()

app.use(cors("*"))
app.use(express.json())

app.get("/", (req, res) => {
  res.status(200).send("on est dans le /")
})

app.use("/api", router)

app.get("*", (req, res) => {
  res.status(404).json({message: "Not found"})
})

module.exports = app
