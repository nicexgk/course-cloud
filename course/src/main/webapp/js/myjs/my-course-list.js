

function editorCourse(id) {


    if (typeof(ue) != 'undefined'){
        ue.destroy();
        console.log("nice nice nice");
    }
    console.log("nice nice nice");
    $.getJSON('/course/' + id , function (data) {
            course = data;
        loadContain('/editorcourse.html');
    })

}
