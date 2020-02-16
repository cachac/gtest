const express = require ('express')

const router = express.Router()

router.get('/info', (req, res) => {
  console.log('> get info');
  res.send({ app: process.env.APP_NAME, env: process.env.NODE_ENV, port: process.env.NODE_PORT, version: process.env.APP_VERSION })
})
router.post('/info', (req, res) => {
  console.log('> post info');
  res.send({ app: process.env.APP_NAME, env: process.env.NODE_ENV, port: process.env.NODE_PORT, version: process.env.APP_VERSION })
})

router.get('*', function(req, res) {
  res.status(404).send('Página no encontrada :/')
})

router.post('*', function(req, res) {
  res.status(404).send('Página no encontrada :/')
})

module.exports = router