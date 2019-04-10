<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="/layui/css/layui.css">
    <link type="text/css" rel="stylesheet" href="/css/jsuggest.css">

    <script src="/js/jquery.js"></script>
    <script type="text/javascript" src="/layui/layui.js"></script>
    <script type="text/javascript" src="/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="/ueditor/ueditor.all.js"></script>
    <script type="text/javascript" src="/ueditor/ueditor.parse.js"></script>
    <script type="text/javascript" src="/js/myjs/course-manager-navigation.js"></script>

</head>

<body>
<div>
    <ul class="layui-nav" lay-filter="nav">
        <li class="layui-nav-item layui-this">
            <a href="javascript:;" data-source="/mycourselist.html">课程列表</a>
        </li>
        <li class="layui-nav-item">
            <a href="javascript:;">课程管理</a>
            <dl class="layui-nav-child">
                <dd><a href="/addcourse.html" target="_blank">类型管理</a></dd>
                <dd><a href="/addcourse.html" target="_blank">添加课程</a></dd>
                <dd><a href="javascript:;" data-source = "/editorcourse.html">修改课程</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item">
            <a href="javascript:;">控制台<span class="layui-badge">9</span></a>
        </li>
        <li class="layui-nav-item">
            <a href="javascript:;">个人中心<span class="layui-badge-dot"></span></a>
        </li>
        <li class="layui-nav-item">
            <a href="javascript:;"><img src="/img/1.jpg" class="layui-nav-img">我</a>
            <dl class="layui-nav-child">
                <dd><a href="javascript:;">修改信息</a></dd>
                <dd><a href="javascript:;">安全管理</a></dd>
            </dl>
        </li>
    </ul>
</div>
<div style="margin-top: 15px;"></div>

<div class="contain" style="width: 100%; width: 100%">
    <div class="page-contain"></div>
</div>
</body>
</html>
