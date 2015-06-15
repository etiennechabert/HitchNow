var http = require('http');

var server = http.createServer(function(req, res) {});

var io = require('socket.io').listen(server);

io.sockets.on('connection', function (socket, pseudo) {
    // Quand on client se connecte, on lui envoie un message
    socket.emit('message', 'Vous êtes bien connecté !');

    socket.on('testEvent', function(data) {
        console.log('New dude '+ data)
        socket.emit('message', 'test');
    })
});

server.listen(4242);