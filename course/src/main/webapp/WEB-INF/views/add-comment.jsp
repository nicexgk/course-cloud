<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>课程评论</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="/css/mycss/add-comment.css">

    <script src="/js/jquery.js"></script>
    <script src="/layui/layui.js"></script>

</head>
<body>

<div>
    <jsp:include page="/WEB-INF/views/common/header.jsp" flush="true"></jsp:include>
</div>

<div class="content-course">
    <div class="inner-content-course">
        <div class="course-detail-description clear-fix">
            <div class="course-logo-left">
                <img class="course-logo" src="${requestScope.course.picUrl}">
            </div>
            <c:choose>
                <c:when test="${requestScope.course != null}">
                    <div class="course-detail-right">
                        <a class="course-title" href="/course/page/${requestScope.course.courseId}" target="_blank">${requestScope.course.courseName}</a>
                        <p class="course-date">${requestScope.course.courseDate}</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="course-detail-right">
                        <a class="course-title" target="_blank"></a>
                        <p class="course-date"></p>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
        <div>
            <fieldset class="layui-elem-field layui-field-title score-fieldset">
                <legend>评分等级</legend>
            </fieldset>
            <ul class="score-grade" data-course="${requestScope.course.courseId}">
                <li><span id="test0"></span></li>
                <li><span id="test1"></span></li>
                <li><span id="test2"></span></li>
                <li><span id="test3"></span></li>
                <li><span id="test4"></span></li>
            </ul>
            <div>
                <textarea class="course-score-text"></textarea>
            </div>
            <button class="submit-comment" onclick="login()">发布评论</button>
        </div>
    </div>
</div>

<script>

    layui.use('rate', function () {
        var rate = layui.rate;
        $('.score-grade').attr('data-score', 5);
        rate.render({
            elem: '#test0'
            , value: 2 //初始值
            , text: true //开启文本
            , setText: function (value) { //自定义文本的回调
                var arrs = {
                    '1': '极差'
                    , '2': '差'
                    , '3': '中等'
                    , '4': '好'
                    , '5': '极好'
                };
                this.span.text(arrs[value] || (value + "星"));
                $('.score-grade').attr('data-score', value);
            }
        });
    });


    function login(){
        var grade = $(".score-grade").attr('data-score');
        var content = $(".course-score-text").val();
        var courseId = $(".score-grade").attr('data-course');
        var commentary = {};
        commentary.commentGrade = grade;
        commentary.commentContent = content;
        commentary.commentCourse = courseId;
        console.log(grade)
        console.log(content);
        $.ajax({
            url: "/course/commentary/",
            type: "post",
            contentType: "application/json",
            data: JSON.stringify(commentary),
            success: function(res){
                console.log(res);
                if(res.status == 200){
                    console.log("评论发布成功");
                    layui.use('layer',function(){
                       var layer = layui.layer;
                       layer.msg("评论发布成功", {icon: 1});
                    });
                    $(".submit-comment").attr("disabled", true).attr("class", "submit-comment-disable");
                } else{
                    console.log("评论失败");
                    layui.use('layer',function(){
                        var layer = layui.layer;
                        layer.msg(res.description, {icon: 5});
                    });
                }
            }
        });
    }

</script>

</body>
</html>
