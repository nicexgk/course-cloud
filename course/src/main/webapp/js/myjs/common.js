

var courseTypeCatalog;
(function (){
    console.log("get course type catalog   common.js");
    $.getJSON(
        "/course/type/"
        ,function(data){
            courseTypeCatalog = data;
            console.log(data);
        }
    )
})();
