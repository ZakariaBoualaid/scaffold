#!/usr/bin/env node
console.log(process.version);

var http = require('http');
http.createServer(function (req, res) {
res.writeHead(200, {'Content-Type': 'text/html'});
res.write('Salut tout le monde !');
res.end();
}).listen(9999);
console.log('Serveur us running at http://localhost:9999/');
