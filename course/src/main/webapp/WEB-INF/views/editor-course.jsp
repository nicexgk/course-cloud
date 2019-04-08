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

    <script src="/js/jquery.js"></script>
    <script src="/layui/layui.all.js"></script>
    <script src="/js/myjs/common.js"></script>
    <script src="/js/myjs/editor-course.js"></script>

</head>
<body>
<form class="layui-form" id="form" action="" onsubmit="submitForm()">
    <div class="layui-form-item">
        <label class="layui-form-label">课程名称</label>
        <div class="layui-input-block">
            <input type="text" name="course-name" lay-verify="required" value="${requestScope.course.getCourseName() }" class="layui-input" style="width:650px;">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">所属类目</label>
        <div class="layui-input-block">
            <div class="layui-input-inline" id="div1">
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
            <div class="layui-input-inline" id="div2">
                <select id="select2" lay-filter="select2" name="second-type" style="width:170px;">
                    <c:forEach items="${requestScope.courseTypeCatalog }" var="parentType" varStatus="status" begin="0" end="0">
                        <c:forEach items="${parentType.childList}" var="secondType">
                            <option value="${secondType.typeId}" selected="selected" data-bind-parentId="${parentType.typeId}">${secondType.typeName }</option>
                        </c:forEach>
                    </c:forEach>
                </select>
            </div>
            <div class="layui-input-inline" id="div3">
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
            <img class="layui-upload-img" name="courseimg" id="courseimg" width="150" height="150" src="/img/courseimages/c01.jpg" style="width: 200px; height: 200px">
        </div>
        <label class="layui-form-label"></label>
        <button type="button" id="uploadimg" name="upfile" class="layui-btn layui-btn-primary">设置课程封面</button>
        <input type="file" name="file" class="layui-upload-file"/>
        <input type="hidden" name="pic" id="pic" value=" ">
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">价格：</label>
        <div class="layui-form-block">
            <input type="text" class="layui-input" name="course-price" value="" placeholder="免费" oninput="value=value.replace(/[^\d]/g,'')">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">简洁描述</label>
        <div class="layui-input-block">
            <input type="text" name="course-detail" class="layui-input" style="width:1050px;">
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">课程简介</label>
        <div class="layui-input-block" style="margin-left: 140px">
            <textarea id="container" class="container"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block" style="margin-left: 140px;">
            <button type="submit" class="layui-btn" lay-submit lay-filter="addcoursesubmit">修改</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>

<!----------- contain_right end   ----------->
</body>
</html>