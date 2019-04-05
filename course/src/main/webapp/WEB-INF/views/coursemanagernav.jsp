<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="../../css/public.css">
    <link rel="stylesheet" href="../../css/comm.css">
    <link rel="stylesheet" href="../../css/list.css">
    <link rel="stylesheet" type="text/css" href="../../layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="../../css/mycss/home-page-body.css"/>
    <link rel="stylesheet" type="text/css" href="../../css/mycss/home-page.css"/>
    <link type="text/css" rel="stylesheet" href="../../css/jsuggest.css">
    <link type="text/css" rel="stylesheet" href="../../css/ling.css"/>
    <script src="../../layui/layui.js"></script>
    <script src="js/jquery.js"></script>
    <script src="js/myjs/coursemanagernavigation.js"></script>
</head>

<body>

<!-- header start -->
<div>
    <jsp:include page="/WEB-INF/views/common/header.jsp" flush="true"></jsp:include>
</div>
<!-- header end -->

<!-- contain start -->
<div class="contain">
    <!-- contain_left start -->
    <div id="contain_left">
        <ul class="layui-nav layui-nav-tree" lay-filter="test">
            <!-- 侧边导航 -->
            <li class="layui-nav-item layui-nav-itemed">
                <a href="javascript:;">课程管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="queryAllCourseForManagerList.action">添加课程</a></dd>
                    <dd><a href="queryAllCourseTypeForParent.action">课程列表</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">课程类型管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="queryAllCourseForType.action">类型列表</a></dd>
                    <dd><a href="addcoursetype.jsp">增加类型</a></dd>
                </dl>
            </li>
        </ul>
    </div>
    <!-- contain_left end -->
</div>
</body>
</html>
