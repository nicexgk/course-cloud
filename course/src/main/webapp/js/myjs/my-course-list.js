

// function editorCourse(id) {
//
//
//     if (typeof(ue) != 'undefined'){
//         ue.destroy();
//         console.log("nice nice nice");
//     }
//     console.log("nice nice nice");
//     $.getJSON('/course/' + id , function (data) {
//             course = data;
//         loadContain('/editorcourse.html');
//     })
//
// }

function deleteCourse(target){
    var courseId = $(target).attr("data-course-id");
    $.ajax({
        url: "/course/" + courseId,
        type: "delete",
        success: function (res){
            layui.use("layer", function (){
                var layer = layui.layer;
                if(res.status = 200){
                    layer.msg("删除成功", {icon: 2});
                    $(target).parent().parent().remove();
                } else if(100){
                    layer.msg("请先登录", {icon: 5});
                } else {
                    layer.msg("删除失败，稍后请重试。。。", {icon: 1});
                }
            })
        }
    });
}

