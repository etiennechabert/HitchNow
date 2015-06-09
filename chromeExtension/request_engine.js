var requestEngine = {
    username: null,
    password: null,
    remember: 'on',
    working_on: false,
    xhr : null,
    logged: false,

    isLogged: function(){
        if (this.xhr == null)
            return null;
        if (this.logged == false)
            this.logged = this.isLoggedAnalysis(xhr.response);
        return this.logged;
    },

    isLoggedAnalysis: function(pageContent){
        return pageContent.indexOf('id="login"') != -1
    },

    logMe: function(){
        if (this.username == null || this.password == null)
            return false;

        this.xhr = new  XMLHttpRequest();
        var url = "https://www.adopteunmec.com//auth/login";
        var params = "username=" + this.username + "&password=" + this.password + "&remember=" + this.remember;

        this.xhr.open("POST", url, true);
        this.xhr.setRequestHeader("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8");
        this.xhr.setRequestHeader("Accept-Encoding", "gzip, deflate");
        this.xhr.setRequestHeader("Accept-Language", "fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4,en-GB;q=0.2");
        this.xhr.setRequestHeader("Cache-Control", "max-age=0");
        this.xhr.setRequestHeader("Connection", "keep-alive");
        this.xhr.setRequestHeader("Content-Length", params.length);
        this.xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        this.xhr.setRequestHeader("Host", "www.adopteunmec.com");
        this.xhr.setRequestHeader("Origin", "https://www.adopteunmec.com");
        this.xhr.setRequestHeader("Referer", "https://www.adopteunmec.com");
        this.xhr.setRequestHeader("User-Agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36");
        this.xhr.onreadystatechange = this.storeResult;
        this.xhr.send(params);
    },

    execVisit: function(profile_id){
        this.execQuery("https://www.adopteunmec.com/profile/" + profile_id);
    },

    execHomePage: function(){
        this.execQuery("https://www.adopteunmec.com/");
    },

    execQuery: function(page){
        xhr = new XMLHttpRequest();
        xhr.onreadystatechange = this.storeResult;
        xhr.open("GET", page);
        xhr.send();
    },

    storeResult: function(){
        if(this.xhr.readyState == 4) {
            this.working_on = false;
        }
    }
};