const { findAll, findOne } = require("../model/orderModel")

const getAll = async (req, res) => {
  try {
    const orders = await findAll()
    res.send(orders)
  } catch (err) {
    res.sendStatus(500)
  }
}

const getOne = async (req, res) => {
  const orderId = parseInt(req.params.id, 10)
  try {
    if(isNaN(orderId)){
      throw new Error()
    }
    const [order] = await findOne(orderId)
    res.send(order)
  } catch (err) {
    res.sendStatus(500)
  }
}

module.exports = { getAll, getOne }
