import { readFileSync } from 'fs'
import { createServer } from 'http'
import {getConfig} from './config'

const { HTTP_HOST, HTTP_PORT} = getConfig(process.env)

const server = createServer((req, res) => {
  res.setHeader('content-type', 'text/plain')
  res.end('Hello, World!')
})

server.listen(HTTP_PORT, HTTP_HOST, () => {
  console.log(`server listening on ${HTTP_HOST}:${HTTP_PORT}`)
})