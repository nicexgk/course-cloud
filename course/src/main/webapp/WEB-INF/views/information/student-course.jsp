<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>课程表</title>
    <link rel="stylesheet" type="text/css" href="/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="/css/mycss/home-page.css"/>
    <link rel="stylesheet" type="text/css" href="/css/mycss/informataion.css">

    <script href="/js/information/student.js"></script>
    <script href="/js/jquery.js"></script>
    <script href="/layui/layui.js"></script>


</head>
<body class="l-aside-left l-min">

<div>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
</div>
<div id="react-body">
    <section class="inner-center clearfix">
        <aside class="aside-left">
            <div class="l-nav-area">
                <ul class="l-nav">
                    <li class="l-nav-item"><a title="课程表" href="/studentcourse.html" class="active">课程表</a></li>
                    <li class="l-nav-item"><a title="全部订单" href="/order.html">全部订单</a></li>
                    <li class="l-nav-item"><a title="收藏" href="/collection.html">收藏列表</a></li>
                    <li class="l-nav-item"><a title="个人信息" href="/userinfo.html">个人信息</a></li>
                </ul>
            </div>
        </aside>

        <main class="main main-container">

            <div class="student-course-contain">
                <c:forEach items="${requestScope.studentCourses}" var="studentCourse" varStatus="status">
                    <div class="tab-ctn">
                        <div class="tab-course-list clear-fix">
                            <div class="tab-item-ctn ${status.count == 1 ? "active" : ""}">
                                <a><img src="${studentCourse.course.picUrl}"></a>
                            </div>
                            <div class="tab-item-ctn">
                                <p class="tab-title" title="${studentCourse.course.courseName}">
                                    <a target="_blank" href="/course/page/${studentCourse.course.courseId}">${studentCourse.course.courseName}</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div style="margin: 0 auto;width: 1200px;">
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
                    <legend></legend>
                </fieldset>
                <div id="page"></div>
            </div>
        </main>
    </section>
</div>

<script>


    function pagingFull(data) {

        var content = "";
        for (var i in data) {
            var studentCourse = data[i];
            var course = '<div class="tab-ctn">' +
                '<div class="tab-course-list clear-fix">' +
                '<div class="tab-item-ctn">' +
                '<a><img src="' + studentCourse.course.picUrl + '"></a>' +
                '</div>' +
                '<div class="tab-item-ctn">' +
                '<p class="tab-title" title="' + studentCourse.course.courseName + '">' +
                '<a target="_blank" href="/course/page/' + studentCourse.course + '">' + studentCourse.course.courseName + '</a>' +
                '</p>' +
                '</div>' +
                '</div>' +
                '</div>';
            content += course;
        }
        $(".student-course-contain").html(content);
    }

    function pageSplit(target) {
        console.log("nice nice nice");
        var page = $(target).attr("data-page") - 1;
        $.getJSON("/student/course/" + page + "/" + size, function (data) {
            console.log(data);

            layui.use(['laypage', 'layer'], function () {
                var laypage = layui.laypage;
                laypage.render({
                    elem: 'page'
                    , count: data.count
                    //获取hash值为fenye的当前页
                    , curr: data.page + 1
                });
            });

            pagingFull(data.resource);
            $("#page>div>a").each(function (i) {
                $(this).attr("onclick", "pageSplit(this)")
            });
        });
    }
    function nice() {
        console.log("nice nice ncie");
    }

</script>
<script>
    var size = ${requestScope.pojo.size};
    var type = ${requestScope.pojo.type};

    layui.use(['laypage', 'layer'], function () {
        var laypage = layui.laypage;
        laypage.render({
            elem: 'page'
            , count: ${requestScope.pojo.count}
            //获取hash值为fenye的当前页
            , curr: ${requestScope.pojo.page + 1}
        });
    });

    window.onload = function () {
        $("#page>div>a").each(function (i) {
            $(this).attr("onclick", "pageSplit(this)")
        });
    }

</script>
</body>
</html>
