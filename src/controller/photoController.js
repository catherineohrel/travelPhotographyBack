const { findAll, findOne } = require("../model/photoModel")

const getAll = async (req, res) => {
  try {
    const photos = await findAll()
    res.send(photos)
  } catch (err) {
    res.sendStatus(500)
  }
}

const getOne = async (req, res) => {
  const photoId = parsInt(req.params.id, 10)
  try {
    if(isNaN(photoId)){
      throw new Error()
    }
    const [photo] = await findOne(photoId)
    res.send(photo)
  } catch (err) {
    res.sendStatus(500)
  }
}

module.exports = { getAll, getOne }
