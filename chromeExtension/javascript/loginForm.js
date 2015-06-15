$(function(){
    $("#loginExplicationShow").click(function (){
        var div = $("#loginExplication");
        if (div.is(':hidden'))
            show();
        else
            hide();
    });

    $("#firstConnectionSignIn").click(function (){
            window.open("http://google.fr/" + $(this).attr('data-href'));
        }
    );
});