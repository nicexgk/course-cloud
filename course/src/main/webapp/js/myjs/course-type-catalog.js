

var courseTypeCatalog;
var hideFlags = 0;

function getCourseTypeCatalog(){
    $.getJSON(
        "/course/type/"
        ,function(data){
            courseTypeCatalog = data;
            console.log(data);
        }
    )
}
getCourseTypeCatalog();

$(function(){
    $(".i-list-index").click(function(){
            if(hideFlags == 0){
            $(".header-nav").css("display", "block");
                hideFlags = 1;
        } else {
            $(".header-nav").css("display", "none");
                hideFlags = 0;
        }
    });
});

