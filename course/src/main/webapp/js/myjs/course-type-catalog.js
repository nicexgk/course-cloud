

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

