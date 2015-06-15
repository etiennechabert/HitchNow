var requestEngine = {
    username: "",
    password: "",
    remember: 'on',
    xhr: null,
    logged: null,
    user_id: null,
    credentials_set: false,
    connection_try: 0,
    html_response: null,

    setDefault: function(){requestEngine.setLoginPassword('pissoff92400@hotmail.com', 'uplink')},

    setLoginPassword: function(username, password){
        if (requestEngine.username == username && requestEngine.password == password)
            return false; // Return false in case of same credentials set
        requestEngine.username = username;
        requestEngine.password = password;
        requestEngine.connection_try = 0; // Reset connection try
        return true; // New credentials set
    },

    isLogged: function(){
        if (requestEngine.xhr == null || requestEngine.xhr.response.length == 0)
            return null;
        requestEngine.logged = requestEngine.html_response.indexOf('id="login"') == -1;
        if (requestEngine.logged)
            requestEngine.user_id = (function(data){
                var pattern = 'id="my-page"><a href="https://www.adopteunmec.com/profile/';
                index = data.indexOf(pattern);
                data = data.substr(index+pattern.length);
                index = data.indexOf('"');
                data = data.substr(0, index);
                return data;
            })(requestEngine.html_response);
        return requestEngine.logged;
    },

    logMe: function(callback){
        viewEngine.showHoldOn();
        if (requestEngine.username == "" || requestEngine.password == "")
            return false;

        requestEngine.xhr = new XMLHttpRequest();
        var url = "https://www.adopteunmec.com//auth/login";
        var params = "username=" + requestEngine.username + "&password=" + requestEngine.password + "&remember=" + requestEngine.remember;

        requestEngine.xhr.open("POST", url, true);
        requestEngine.xhr.setRequestHeader("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8");
        requestEngine.xhr.setRequestHeader("Accept-Language", "fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4,en-GB;q=0.2");
        requestEngine.xhr.setRequestHeader("Cache-Control", "max-age=0");
        requestEngine.xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        requestEngine.html_response = null;
        requestEngine.xhr.onreadystatechange = requestEngine.xhrCallback;
        requestEngine.callback = callback;
        requestEngine.connection_try += 1;
        requestEngine.xhr.send(params);
    },

    disconnection: function(callback){
        requestEngine.execQuery("https://www.adopteunmec.com/auth/logout", callback);
    },

    execVisit: function(profile_id, callback){
        requestEngine.execQuery("https://www.adopteunmec.com/profile/" + profile_id, callback);
    },

    execHomePage: function(callback){
        requestEngine.execQuery("https://www.adopteunmec.com/home", callback);
    },

    xhrCallback: function(){
        if (this.readyState == 4)
        {
            requestEngine.html_response = this.response;
            requestEngine.callback(this.response);
        }
    },

    execQuery: function(page, callback){
        viewEngine.showHoldOn();
        requestEngine.xhr = new XMLHttpRequest();

        requestEngine.xhr.open("GET", page, true);
        requestEngine.html_response = null;
        requestEngine.callback = callback;
        requestEngine.xhr.onreadystatechange = requestEngine.xhrCallback;
        requestEngine.xhr.send();
    },
};