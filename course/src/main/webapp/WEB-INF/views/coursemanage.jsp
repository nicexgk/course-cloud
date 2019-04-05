<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="../../css/public.css">
    <link rel="stylesheet" href="../../css/comm.css">
    <link rel="stylesheet" href="../../css/list.css">
    <link rel="stylesheet" type="text/css" href="../../layui/css/layui.css">
    <link type="text/css" rel="stylesheet" href="../../css/jsuggest.css">
    <link type="text/css" rel="stylesheet" href="../../css/ling.css"/>
    <link rel="stylesheet" href="css/mycss/home-page.css">
    <script src="../../layui/layui.js"></script>
    <script src="../../js/jquery.js"></script>
    <!-- ueditor配置文件 -->
    <script type="text/javascript" src="/ueditor/ueditor.config.js"></script>
    <!-- urditor编辑器源码文件 -->
    <script type="text/javascript" src="/ueditor/ueditor.all.js"></script>
    <script type="text/javascript" src="js/myjs/comment.js"></script>
    <script src="js/myjs/coursemanager.js"></script>
</head>

<body>
<!----------- 头部 start -------------------->
<div>
    <jsp:include page="/WEB-INF/views/coursemanagernav.jsp"></jsp:include>
</div>
<!----------- 头部 end   -------------------->
<!----------- contain_right start ----------->
<div id="contain_right">
    <form class="layui-form" id="form" action="" onsubmit="submitForm()">
        <div class="layui-form-item">
            <label class="layui-form-label">课程名称</label>
            <div class="layui-input-block">
                <input type="text" name="coursename" lay-verify="required" value="${requestScope.course.getCourseName() }" class="layui-input" style="width:250px;">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">所属类目</label>
            <div class="layu-input-block">
                <div class="firstselect" id="div1">
                    <select id="select1" name="paren-ttype" lay-filter="select1">
                        <c:forEach items="${requestScope.courseTypeCatalog }" var="parentType" varStatus="status">
                            <c:choose>
                                <c:when test="${status.index == 0}">
                                    <option value="${parentType.typeId}" selected>${parentType.typeName }</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${parentType.typeId}">${parentType.typeName }</option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </select>
                </div>
                <div class="firstselect" id="div2">
                    <select id="select2" lay-filter="select2" name="second-type" style="width:170px;">
                        <c:forEach items="${requestScope.courseTypeCatalog }" var="parentType" varStatus="status" begin="0" end="0">
                            <c:forEach items="${parentType.childList}" var="secondType">
                                <option value="${secondType.typeId}" selected="selected" data-bind-parentId="${parentType.typeId}">${secondType.typeName }</option>
                            </c:forEach>
                        </c:forEach>
                    </select>
                </div>
                <div class="firstselect" id="div3">
                    <select id="select3" name="course-type" lay-filter="select3" style="width:170px;">
                        <c:forEach items="${requestScope.courseTypeCatalog }" var="parentType" varStatus="status" begin="0" end="0">
                            <c:forEach items="${parentType.childList}" var="secondType">
                                <c:forEach items="${secondType.childList}" var="chileType">
                                    <option value="${chileType.typeId}" data-bind-parentId="${secondType.typeId}">${chileType.typeName }</option>
                                </c:forEach>
                            </c:forEach>
                        </c:forEach>
                    </select>
                </div>
            </div>
        </div>
        <div class="layui-form-item" id="upload-thumb">
            <label class="layui-form-label">课程封面</label>
            <div class="layui-upload-list">
                <img class="layui-upload-img" name="courseimg" id="courseimg" width="150" height="150" src="../../courseimages/c01.jpg">
            </div>
            <label class="layui-form-label"></label>
            <button type="button" id="uploadimg" name="upfile" class="layui-btn layui-btn-primary">设置课程封面</button>
            <label class="course-label">价格：</label>
            <input type="text" class="course-price" name="price" value="" placeholder="免费">
            <label class="course-label2">元</label>
            <input type="file" name="file" class="layui-upload-file"/>
            <input type="hidden" name="pic" id="pic" value=" ">
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">课程简介</label>
            <div class="layui-input-block">
                <textarea id="container" class="container"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="submit" class="layui-btn" lay-submit lay-filter="addcoursesubmit">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
<!----------- contain_right end   ----------->
</body>
</html>