const db = require("./db")

const findAll = async () => {
  try {
const [photoOptions] = await db.query("select * from `photoOption`")
return photoOptions
  } catch (err) {
    console.log(err)
  }
}

const findOne = async (id) => {
  try {
    const [photoOptions] = await db.query("select * from `photoOption` where id = ?", [id])
return photoOption
  } catch (err) {
    console.log(err)
  }
}

module.exports = { findAll, findOne }
