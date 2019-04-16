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
                    <li class="l-nav-item"><a title="课程表" href="/studentcourse.html"  class="active">课程表</a></li>
                    <li class="l-nav-item"><a title="全部订单" href="/order.html">全部订单</a></li>
                    <li class="l-nav-item"><a title="收藏" href="/collection.html">收藏列表</a></li>
                    <li class="l-nav-item"><a title="个人信息" href="/userinfo.html">个人信息</a></li>
                </ul>
            </div>
        </aside>

        <main class="main main-container">

            <div>
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

                <div class="tab-ctn">
                    <div class="tab-course-list clear-fix">
                        <div class="tab-item-ctn active">
                            <a><img src="/img/icon/6.jpg"></a>
                        </div>
                        <div class="tab-item-ctn">
                            <p class="tab-title" title="JAVA高级开发 架构师课程（高并发 高可用 高扩展）【享学课堂】">
                                <a target="_blank" href="">JAVA高级开发 架构师课程（高并发 高可用 高扩展）【享学课堂】</a>
                            </p>
                        </div>
                    </div>
                </div>

            </div>
        </main>
    </section>
</div>
<script>

    $(function(){
        $(".tab-course-list").firstChild.mouseover(function(){
            // $()
        });
    })

</script>
</body>
</html>
