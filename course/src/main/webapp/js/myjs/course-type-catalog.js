

var courseTypeCatalog;
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


function onSubmit(){

    var text = $("#js_keyword").val();
    if(text == null || text == ""){
        $(".search-course-form").attr("action", "/course/page/0/20");
    }else {
        $(".search-course-form").attr("action", "/course/page/search/" + text + "/0/20");
    }
    $(".search-course-form").submit();
    console.log("============");
}