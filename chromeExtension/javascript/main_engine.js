var socket;
var xhr;

function    showResult(html_content){
    $("body").html(xhr.response);
}

$(function(){
    mainEngine.checkLogin("");
    viewEngine.bindEvent();
});

var mainEngine = {
    core: function(){
        return ;
        var loggedStatus = requestEngine.isLogged();

        if (loggedStatus == null)
            mainEngine.checkLogin("");
        else if (loggedStatus == false)
            mainEngine.logUser("");
        else if (loggedStatus == true)
            mainEngine.homePage("");

        setTimeout(mainEngine.core, 5000);
    },

    checkLogin: function(html_content){
        if (html_content.length == 0) {
            requestEngine.execHomePage(mainEngine.checkLogin);
            return ;
        }
        else
            mainEngine.afterLoginLogic(requestEngine.isLogged(html_content));

    },

    submitLoginForm: function(html_content){
        if (html_content == "") {
            var login = $("#loginField").val();
            var password = $("#passwordField").val();
            requestEngine.setLoginPassword(login, password);
            if (requestEngine.logMe(mainEngine.submitLoginForm) == false)
                viewEngine.showLoginFormWithError();
        }
        else
            mainEngine.afterLoginLogic(requestEngine.isLogged());
    },

    afterLoginLogic: function(is_logged){
        viewEngine.hideComponents();

        if (is_logged == false)
            viewEngine.showLoginFormWithError();
        else {
            $("#login").hide();
            $("#logged").show();
            $("#firstConnection").show();
        }
    },

    disconnect: function(html_content){
        if (html_content == "") {
            requestEngine.disconnection(mainEngine.disconnect);
            requestEngine.username = "";
            requestEngine.password = "";
        } else {
            viewEngine.showLoginForm();
        }
    }
};
