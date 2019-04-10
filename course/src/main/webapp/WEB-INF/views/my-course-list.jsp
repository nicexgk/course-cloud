<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="/layui/css/layui.css">
    <link type="text/css" rel="stylesheet" href="/css/jsuggest.css">
    <link type="text/css" rel="stylesheet" href="/css/mycss/my-course-list.css">

    <script src="/js/myjs/my-course-list.js"></script>

</head>

<body>
<div class="card-body">
    <div class="layui-fluid">
        <fieldset class="layui-elem-field layui-field-title">
            <legend>课程列表</legend>
        </fieldset>
    </div>

    <div class="layui-row">
        <c:forEach items="${requestScope.userCourseList}" var="course">
            <div class="layui-col-sm3 card-item">
                <div class="card-item-inner">
                    <a href="javascript:" class=""><img class="item-image" src="${course.picUrl}"></a>
                    <h4 class="item-title"><a>${course.courseName}</a></h4>
                    <div class="item-line">
                        <c:if test="${course.coursePrice == 0}">
                            <span class="item-price">免费</span>
                        </c:if>
                        <c:if test="${course.coursePrice != 0}">
                            <span class="item-price">${course.coursePrice}￥</span>
                        </c:if>
                        <span class="item-editor" data-course-id="${course.courseId}" onclick="editorCourse(${course.courseId})">编辑</span></a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <%--<div class="layui-row">--%>
        <%--<div class="layui-col-sm3 card-item">--%>
            <%--<div class="card-item-inner">--%>
                <%--<a href="javascript:" class=""><img class="item-image" src="img/courseimages/c01.jpg"></a>--%>
                <%--<h4 class="item-title"><a>nice nice nice nic</a></h4>--%>
                <%--<div class="item-line"><span class="item-price">nice nice nice</span><span class="item-source">nice nice nice</span></div>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>

</div>

</body>
</html>