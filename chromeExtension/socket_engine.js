var socketEngine = {
    socketId: null,

    establishConnection: function(){
        chrome.sockets.tcp.create({}, function(createInfo){
            this.socketId = createInfo.socketId;
            chrome.sockets.tcp.connect(this.socketId, '127.0.0.1', 1337, dataSocketFunction);
        });
    },

    closeSocket: function(){
        if (this.socketId == null)
            return;
        chrome.sockets.destroy(this.socketId);
    }
}