const db = require("./db")

const findAll = async () => {
  try {
const [userPayments] = await db.query("select * from `userPayment`")
return userPayments
  } catch (err) {
    console.log(err)
  }
}

const findOne = async (id) => {
  try {
    const [userPayments] = await db.query("select * from `userPayment` where id = ?", [id])
return userPayments
  } catch (err) {
    console.log(err)
  }
}

module.exports = { findAll, findOne }
