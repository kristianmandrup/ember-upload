var express = require('component-hooks/node_modules/express');

var app = express();
app.use(express.favicon());
app.use(express.logger('dev'));
app.use(express.bodyParser());
app.use(express.static(__dirname + '/../public'));
app.get('/', function(req, res) {
  res.sendfile(__dirname + '/view.html');
});
app.post('/upload', function(req, res) {
  var file = req.files.file;
  res.send(!!!file?200:400);
});

app.listen(3000);
console.log('http://dev:3000');
