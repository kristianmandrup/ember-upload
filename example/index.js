var express = require('express');

var app = express();
app.use(express.favicon());
app.use(express.logger('dev'));
app.use(express.bodyParser());
app.use(express.static(__dirname + '/../public'));
app.get('/', function(req, res) {
  return res.sendfile(__dirname + '/view.html');
});
app.post('/upload', function(req, res) {
  var file = req.files.file;
  if (file) {
    return res.send(200);
  }
  res.send(400);
});

app.listen(3000);
console.log('http://dev:3000');
