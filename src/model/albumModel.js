// // const {findAll} = require("./abstractModel")
const db = require("./db")



//   const insert = async (album) => {
//     try {
//       const [result] = await db.query(
//         `insert into album (albumTitle, albumTheme) values (?,?)`,
//         [
//           album.albumTitle,
//           album.albumTheme,
//         ]
//       )
//       return result
//     } catch (err) {
//       console.log(err)
//     }
//   }

//   const update = async (album) => {
//     try {
//       const [result] = await db.query(
//         `UPDATE album SET albumTitle = ?, albumTheme = ? WHERE (id = ?)`,
//         [
//           album.albumTitle,
//           album.albumTheme,
//           album.id,
//         ]
//       )
//       return result
//     } catch (err) {
//       console.log(err)
//     }
//   }
// // findAll(table)

// module.exports = { insert, update }


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
    const [album] = await db.query("select * from `album` where id = ?", [id])
return album
  } catch (err) {
    console.log(err)
  }
}

module.exports = { findAll, findOne }
