var socket;
var xhr;

function createSocket(){
    chrome.sockets.tcp.create({}, function(createInfo){
        socket = createInfo.socketId;
        chrome.sockets.tcp.connect(socket, '127.0.0.1', 1337, dataSocketFunction);
    });
}

function dataSocketFunction(){}

function dataBufferCreation(data){
    buffer = new ArrayBuffer(data.length * 2);
    bufferView = new Uint8Array(buffer);
    dataLength = data.length;
    for (i=0; dataLength > i; i++) {
        bufferView[i] = data.charCodeAt(i);
    }
    return buffer;
}

function baseRequest()
{
    xhr = new XMLHttpRequest();
    xhr.onreadystatechange = showResult;
    xhr.open("GET", "https://www.adopteunmec.com/profile/111190832");
    xhr.send();
}

function sendLogin(){
    xhr = new  XMLHttpRequest();
    var url = "https://www.adopteunmec.com//auth/login";
    var params = "username=pissoff92400@hotmail.com&password=uplink&remember=on";
    xhr.open("POST", url, true);

    xhr.setRequestHeader("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8");
    xhr.setRequestHeader("Accept-Language", "fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4,en-GB;q=0.2");
    xhr.setRequestHeader("Cache-Control", "max-age=0");
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

    xhr.onreadystatechange = function() {
        if(xhr.readyState == 4) {
            $("body").html('Connected ;)');
            baseRequest();
        }
    };

    xhr.send(params);
}

function    showResult(){
    if(xhr.readyState == 4)
    {
        sendResult();
        $("body").html(xhr.response);
        setTimeout(baseRequest, 10000);
    }
}

function sendResult(){
    $("body").html('sending data');
    chrome.sockets.tcp.send(socket, dataBufferCreation(xhr.response), function(){});
}

$(function(){
    createSocket();
    setTimeout(sendLogin, 1000);
    $("body").html('Connection ...');
});

