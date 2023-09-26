const { findAll, findOne } = require("../model/albumModel")

const getAll = async (req, res) => {
  try {
    const albums = await findAll()
    res.send(albums)
  } catch (err) {
    res.sendStatus(500)
  }
}

const getOne = async (req, res) => {
  const albumId = parsInt(req.params.id, 10)
  try {
    if(isNaN(albumId)){
      throw new Error()
    }
    const [album] = await findOne(albumId)
    res.send(album)
  } catch (err) {
    res.sendStatus(500)
  }
}

module.exports = { getAll, getOne }
