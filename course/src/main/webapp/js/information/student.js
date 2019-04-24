


function pagingFull(data){

    var content = "";
    for (var i in data){
        var studentCourse = data[i];
        var course = '<div class="tab-ctn">' +
            '<div class="tab-course-list clear-fix">' +
            '<div class="tab-item-ctn">' +
            '<a><img src="'+ studentCourse.course.picUrl +'"></a>' +
            '</div>' +
            '<div class="tab-item-ctn">' +
            '<p class="tab-title" title="'+  studentCourse.course.courseName +'">' +
            '<a target="_blank" href="/course/page/'+ studentCourse.course +'">'+  studentCourse.course.courseName +'</a>' +
            '</p>' +
            '</div>' +
            '</div>' +
            '</div>';
        content += course;
    }
    $(".student-course-contain").html(content);
}

function pageSplit(target){
    console.log("nice nice nice");
    var page = $(target).attr("data-page") - 1;
    $.getJSON("/student/course/" + page + "/" + size, function(data){
        console.log(data);

        layui.use(['laypage', 'layer'], function () {
            var laypage = layui.laypage;
            laypage.render({
                elem: 'page'
                , count:data.count
                //获取hash值为fenye的当前页
                , curr:data.page + 1
            });
        });

        pagingFull(data.resource);
        $("#page>div>a").each(function (i) {
            $(this).attr("onclick", "paging(this)")
        });
    });
}

function nice(){
    console.log("nice nice ncie");
}

console.log("nldldldddddddddd");