const db = require("./db")

const findAll = async () => {
  try {
const [orders] = await db.query("select * from `order`")
return orders
  } catch (err) {
    console.log(err)
  }
}

const findOne = async (id) => {
  try {
    const [orders] = await db.query("select * from `order` where id = ?", [id])
return order
  } catch (err) {
    console.log(err)
  }
}

module.exports = { findAll, findOne }
