

var courseTypeCatalog;
function getCourseTypeCatalog(){
    $.getJSON(
        "/course/type/catalog"
        ,function(data){
            courseTypeCatalog = data;
            console.log(data);
        }
    )
}
getCourseTypeCatalog();