const { findAll, findOne } = require("../model/albumModel")
// const { findAll, findOne } = require("../model/abstractModel")

const getAll = async (req, res) => {
  try {
    const albums = await findAll()
    res.send(albums)
  } catch (err) {
    res.sendStatus(500)
  }
}

const getOne = async (req, res) => {
  const albumId = parseInt(req.params.id, 10)
  try {
    if(isNaN(albumId)){
      throw new Error()
    }
    const [album] = await findOne(albumId)
    res.send(album)
  } catch (err) {
    // res.sendStatus(500)
  }
}

// // const browse = (req, res) => {
// //   models.characters
// //     .findAll()
// //     .then(([rows]) => {
// //       res.send(rows)
// //     })
// //     .catch((err) => {
// //       console.error(err)
// //       res.sendStatus(500)
// //     })
// // }

// // const add = (req, res) => {
// //   const characters = req.body
// //   // TODO validations (length, format...)

// //   models.characters
// //     .insert(characters)
// //     .then(([result]) => {
// //       res.json(result.insertId)
// //     })
// //     .catch((err) => {
// //       console.error(err)
// //       res.sendStatus(500)
// //     })
// // }

// // const read = (req, res) => {
// //   models.characters
// //     .find(req.params.id)
// //     .then(([rows]) => {
// //       if (rows[0] == null) {
// //         res.sendStatus(404)
// //       } else {
// //         res.send(rows[0])
// //       }
// //     })
// //     .catch((err) => {
// //       console.error(err)
// //       res.sendStatus(500)
// //     })
// // }

// // const edit = (req, res) => {
// //   const characters = req.body

// //   // TODO validations (length, format...)

// //   characters.id = parseInt(req.params.id, 10)

// //   models.characters
// //     .update(characters)
// //     .then(([result]) => {
// //       if (result.affectedRows === 0) {
// //         res.sendStatus(404)
// //       } else {
// //         res.sendStatus(204)
// //       }
// //     })
// //     .catch((err) => {
// //       console.error(err)
// //       res.sendStatus(500)
// //     })
// // }

// // const destroy = (req, res) => {
// //   models.characters
// //     .delete(req.params.id)
// //     .then(([result]) => {
// //       if (result.affectedRows === 0) {
// //         res.sendStatus(404)
// //       } else {
// //         res.sendStatus(204)
// //       }
// //     })
// //     .catch((err) => {
// //       console.error(err)
// //       res.sendStatus(500)
// //     })
// // }

module.exports = { getAll, getOne }
