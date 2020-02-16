const express = require ('express')
const cors = require('cors')
const dotenv = require('dotenv')
const index = require('./index')
// const compression = require('compression');
const helmet = require('helmet');

const app = express()
// app.use(compression())
app.use(helmet())
app.use(cors())
app.use(index)

dotenv.config()

app.listen(process.env.NODE_PORT, () => {
  console.log(`[${process.env.NODE_ENV}] App: ${process.env.APP_NAME} v${process.env.APP_VERSION} listening to port ${process.env.NODE_PORT} - Express JS`)
})