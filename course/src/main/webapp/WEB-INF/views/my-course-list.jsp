<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="/layui/css/layui.css">
    <link type="text/css" rel="stylesheet" href="/css/jsuggest.css">
    <%--<link type="text/css" rel="stylesheet" href="/css/mycss/my-course-list.css">--%>
    <link type="text/css" rel="stylesheet" href="/css/mycss/course-list.css">

    <%--<script src="/js/myjs/my-course-list.js"></script>--%>

</head>

<body>
<div class="card-body">
    <div class="layui-fluid">
        <fieldset class="layui-elem-field layui-field-title">
            <legend>课程列表</legend>
        </fieldset>
    </div>

    <div class="card-group course-content-list">
        <ul class="card-ul-list">
            <c:forEach items="${requestScope.userCourseList}" var="course">
                <li class="card-li-item">
                    <a class="item-img-link" href="/course/page/${course.courseId}" target="_blank"><img class="item-inline-img" src="${course.picUrl}"></a>
                    <h4 class="item-title"><a href="/course/page/${course.courseId}" target="_blank">${course.courseName}</a></h4>
                    <div class="item-card-parson item-card">
                        <span class="item-inline-date">${fn:substring(course.courseDate, 0, 10)}</span>
                        <a href="/course/page/editor/${course.courseId}" target="_blank"><span class="item-inline-teacher" data-course-id="${course.courseId}" onclick="editorCourse(${course.courseId})">编辑</span></a>
                    </div>
                    <c:if test="${course.coursePrice eq 0}">
                        <div class="item-card-price item-card">
                            <span>免费</span>
                            <a href="" target="_blank"><span class="item-inline-teacher" data-course-id="${course.courseId}" onclick="editorCourse(${course.courseId})">删除</span></a>
                        </div>
                    </c:if>
                    <c:if test="${course.coursePrice != 0}">
                        <div class="item-card-price item-card">
                            <span>￥${course.coursePrice}</span>
                            <a href="" target="_blank"><span class="item-inline-teacher" data-course-id="${course.courseId}" onclick="editorCourse(${course.courseId})">删除</span></a>
                        </div>
                    </c:if>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>

</body>
</html>