const express = require("express")
const router = express.Router()

const albumRoutes = require("./albumRoutes")
const photoRoutes = require("./photoRoutes")

router.get("/", (req, res) => {
  res.status(200).send("on est la : /api")
})

router.use("/album", albumRoutes)
router.use("/photo", photoRoutes)

module.exports = router
