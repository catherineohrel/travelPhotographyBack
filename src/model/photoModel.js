const db = require("./db")

const findAll = async () => {
  try {
const [photos] = await db.query("select * from `photo`")
return photos
  } catch (err) {
    console.log(err)
  }
}

const findOne = async (id) => {
  try {
    const [photos] = await db.query("select * from `photo` where id = ?", [id])
return photo
  } catch (err) {
    console.log(err)
  }
}

module.exports = { findAll, findOne }
