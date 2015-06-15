var viewEngine = {
    loginFormError: "",

    bindEvent: function(){
        $("#loginFormSubmit").click(function(){
            mainEngine.submitLoginForm("");
        });
        $("#loginForm input").keypress(function (e){
            if (e.keyCode == 13)
                mainEngine.submitLoginForm("");
        });

        $("#loggedDisconnect").click(function(){
            mainEngine.disconnect("")
        });

        $("#hitchNowRegister").click(viewEngine.popupHitchNowRegister);
    },

    popupHitchNowRegister: function(){
        window.open('http://hitchnow.com');
    },

    hideComponents: function(){
        $('.component').hide();
    },

    showHoldOn: function(){
        $('#holdOn').show();
    },

    showLoginForm: function(){
        viewEngine.hideComponents();
        $("#login input").val("");
        $("#login").show();
    },

    showLoginFormWithError: function(){
        viewEngine.showLoginForm();
        if (requestEngine.username.length > 0)
            $("#login .alert-danger").show();
    }
};