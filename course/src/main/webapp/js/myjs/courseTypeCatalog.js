


var flags = 0;

$(function(){
    $(".i-list-index").click(function(){
        if(flags == 0){
            $(".header-nav").css("display", "block");
            flags = 1;
        } else {
            $(".header-nav").css("display", "none");
            flags = 0;
        }
    });
    // $(".header-nav").mouseover(function(){
    //     flags = 2;
    // }).mouseout(function(){
    //     //$(".header-nav").css("display", "none");
    //     flags = 0;
    // })
});

