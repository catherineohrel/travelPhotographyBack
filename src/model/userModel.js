const db = require("./db")

const addOne = async (user) => {
  try {
    const { firstname, lastname, email, password } = user

    const creationDate = new Date()
    
    const [result] = await db.query(
      "insert into `user` (firstname, lastname, email, password, creationDate) values (?,?,?,?,?)", [firstname, lastname, email, password, creationDate]
    )
    return { id: result.insertId, firstname, lastname, email, creationDate }
  } catch (err) {
    console.log(err)
  }
}

const findOne = async (id) => {
  try {
    const [user] = await db.query("select * from `user` where id = ?", [id])
return user
  } catch (err) {
    console.log(err)
  }
}

const findByEmail = async (email) => {
  try {
    const [user] = await db.query("select * from `user` where email = ?", [email,
    ])
    return user
  } catch (err) {
    console.log(err)
  }
}

module.exports = { findOne, addOne, findByEmail }
