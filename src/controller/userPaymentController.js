const { findAll, findOne } = require("../model/userPaymentModel")

const getAll = async (req, res) => {
  try {
    const userPayments = await findAll()
    res.send(userPayments)
  } catch (err) {
    res.sendStatus(500)
  }
}

const getOne = async (req, res) => {
  const userPaymentId = parseInt(req.params.id, 10)
  try {
    if(isNaN(userPaymentId)){
      throw new Error()
    }
    const [userPayment] = await findOne(userPaymentId)
    res.send(userPayment)
  } catch (err) {
    res.sendStatus(500)
  }
}

module.exports = { getAll, getOne }
