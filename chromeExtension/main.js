var socket;
var xhr;

function main(){
}

function createSocket(){
    chrome.sockets.tcp.create({}, function(createInfo){
        socket = createInfo.socketId
        chrome.sockets.tcp.connect(socket, '127.0.0.1', 1337, dataSocketFunction);
    });
}

function dataSocketFunction(){}

function dataBufferCreation(data){
    buffer = new ArrayBuffer(data.length * 2)
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
    xhr.open("GET", "https://www.adopteunmec.com/");
    xhr.send();
}

function sendLogin(){
    xhr = new  XMLHttpRequest();
    var url = "https://www.adopteunmec.com//auth/login";
    var params = "username=pissoff92400@hotmail.com&password=uplink&remember=on";
    xhr.open("POST", url, true);

    xhr.setRequestHeader("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8");
    xhr.setRequestHeader("Accept-Encoding", "gzip, deflate");
    xhr.setRequestHeader("Accept-Language", "fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4,en-GB;q=0.2");
    xhr.setRequestHeader("Cache-Control", "max-age=0");
    xhr.setRequestHeader("Connection", "keep-alive");
    xhr.setRequestHeader("Content-Length", params.length);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.setRequestHeader("Host", "www.adopteunmec.com");
    xhr.setRequestHeader("Origin", "https://www.adopteunmec.com");
    xhr.setRequestHeader("Referer", "https://www.adopteunmec.com");
    xhr.setRequestHeader("User-Agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36");

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
        $("body").html(xhr.response);
        setTimeout(baseRequest, 10000);
    }
}

function sendResult(){
    if(xhr.readyState == 4)
        chrome.sockets.tcp.send(socket, dataBufferCreation(xhr.response), function(){});
}

$(function(){
    createSocket();
    setTimeout(baseRequest, 1000);
    $("body").html('Connection ...');
});

