

function edotorCourse(id) {
    $.getJSON('/course/' + id , function (data) {
        console.log(data);
        loadContain('editorcourse.html');

    })
}

function fullDate(data){
    
}