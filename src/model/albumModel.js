const db = require("./db")

const findAll = async () => {
  try {
const [albums] = await db.query("select * from `album`")
return albums
  } catch (err) {
    console.log(err)
  }
}

const findOne = async (id) => {
  try {
    const [albums] = await db.query("select * from `album` where id = ?", [id])
return album
  } catch (err) {
    console.log(err)
  }
}

module.exports = { findAll, findOne }
