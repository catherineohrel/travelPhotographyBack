const { findAll, findOne } = require("../model/photoOptionModel")

const getAll = async (req, res) => {
  try {
    const photoOptions = await findAll()
    res.send(photoOptions)
  } catch (err) {
    res.sendStatus(500)
  }
}

const getOne = async (req, res) => {
  const photoOptionId = parseInt(req.params.id, 10)
  try {
    if(isNaN(photoOptionId)){
      throw new Error()
    }
    const [photoOption] = await findOne(photoOptionId)
    res.send(photoOption)
  } catch (err) {
    res.sendStatus(500)
  }
}

module.exports = { getAll, getOne }
