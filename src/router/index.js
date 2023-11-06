const express = require("express")
const router = express.Router()

const albumRoutes = require("./albumRoutes")
const orderRoutes = require("./orderRoutes")
const photoOptionRoutes = require("./photoOptionRoutes")
const photoRoutes = require("./photoRoutes")
const userRoutes = require("./userRoutes")
const userPaymentRoutes = require("./userPaymentRoutes")
const authRoutes = require("./authRoutes")

const authorization = require("../middleware/auth")

router.get("/", (req, res) => {
  res.status(200).send("on est la : /api")
})

router.use("/album", albumRoutes)
router.use("/photo", photoRoutes)
router.use("/user", userRoutes)
router.use("/auth", authRoutes)
router.use("/photoOption", photoOptionRoutes)
router.use("/order", authorization, orderRoutes)
router.use("/userPayment", userPaymentRoutes)

module.exports = router
