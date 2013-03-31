express = require 'express'

app = express()
app.use express.favicon()
app.use express.logger 'dev'
app.use express.bodyParser()
app.use express.static(__dirname)
app.use express.static(__dirname + '/..')

app.set 'views', __dirname + '/views'
app.set 'view engine', 'jade'

app.get '/', (req, res) ->
  res.render 'index'

app.post '/upload', (req, res) ->
  file = req.files.file
  return res.send(200) if file
  res.send 400

app.listen 4000, ->
  console.log 'http://dev:4000'
