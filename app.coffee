express = require('express')
inspect = require('eyes').inspector(maxLength: 20000)
fs = require('fs')
xtendme = require('xtendme')
global.XtndGuide = xtendme.Guide
ExampleGuide = require('./example_guide')
coffee = require('coffee-script')

key = fs.readFileSync('./ssl/key').toString()
cert = fs.readFileSync('./ssl/cert').toString()
sslOptions = {key: key, cert: cert}

injectjs = "" # fs.readFileSync('inject.js').toString()
host = 'xtend.dev'
guide = new ExampleGuide
  host: host
  fs: fs
  p: () -> inspect(arguments...)
  htmlparser: require('node-hubbub')

configureServer = (server, guide, scripts, protocol) ->
  server.configure 'development', ->
    server.use(express.errorHandler(dumpExceptions: true, showStack: true))
    server.use(express.cookieParser())
    server.use(xtendme.filter(guide: guide, protocol: protocol, scripts: scripts))
    server.use(express.methodOverride())
    server.use(server.router)

  prefix = guide.INTERNAL_URL_PREFIX
  server.get "#{prefix}/:name", (req, res) ->
    name = req.params.name
    if name == 'inject.js'
      res.setHeader('Content-Type', 'text/javascript; charset=UTF-8')
      res.send(injectjs)

  return server

xtendme.generateScripts __dirname + '/example_guide.coffee', {host: host}, (scripts) ->
  http = express.createServer()
  configureServer(http, guide, scripts, 'http').listen(8080)
  https = express.createServer(sslOptions)
  configureServer(https, guide, scripts, 'https').listen(3443)
