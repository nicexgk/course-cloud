<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="/layui/css/layui.css">
    <link type="text/css" rel="stylesheet" href="/css/jsuggest.css">
    <link rel="stylesheet" type="text/css" href="/css/mycss/home-page-body.css"/>
    <link rel="stylesheet" type="text/css" href="/css/mycss/home-page.css"/>
    <link rel="stylesheet" type="text/css" href="/css/mycss/add-course.css"/>

    <script src="/js/jquery.js"></script>
    <script src="/layui/layui.js"></script>
    <script type="text/javascript" src="/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="/ueditor/ueditor.all.js"></script>
    <script type="text/javascript" src="/js/myjs/common.js"></script>
    <script type="text/javascript" src="/js/myjs/add-course.js"></script>
</head>

<body>
<div>
    <jsp:include page="/WEB-INF/views/common/header.jsp" flush="true"></jsp:include>
</div>
<div style="width: 1400px; margin: 0 auto">
    <form class="layui-form" id="form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">课程名称</label>
            <div class="layui-input-block">
                <input type="text" name="course-name" lay-verify="required" value="${requestScope.course.getCourseName() }" class="layui-input" style="width:70%;">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">简洁描述</label>
            <div class="layui-input-block">
                <input type="text" name="course-detail" class="layui-input" style="width:70%;">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">所属类目</label>
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

        <div class="layui-form-item" id="upload-thumb">
            <label class="layui-form-label">课程封面</label>
            <div class="layui-upload-list">
                <img class="layui-upload-img" name="course-img" id="courseimg" width="150" height="150" src="/img/courseimages/c01.jpg" style="width: 200px; height: 200px">
            </div>
            <label class="layui-form-label"></label>
            <button type="button" id="uploadimg" name="upfile" class="layui-btn layui-btn-primary">设置课程封面</button>
            <input type="file" name="file" class="layui-upload-file"/>
            <input type="hidden" name="pic" id="pic" value="">
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">课程价格</label>
            <div class="layui-form-block">
                <input type="text" class="layui-input" name="course-price" value="" placeholder="免费" oninput="value=value.replace(/[^\d]/g,'')">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">目录结构</label>
            <div class="layui-form-block">
                <ul class="layui-nav layui-nav-tree layui-inline catalog-nav" lay-filter="catalog" style=" width: 65%;">
                    <li class="layui-nav-item layui-nav-itemed">
                        <a href="javascript:;" data-name="目录一">
                            <span>目录一</span>
                            <span class="catalog-tool catalog-add layui-icon" onclick="addCatalog(this)">&#xe608;</span>
                            <span class="catalog-tool catalog-sub layui-icon" onclick="removeCatalog(this)">&#x1006;</span>
                            <span class="catalog-tool catalog-editor layui-icon" onclick="editorCatalog(this)">&#xe642;</span>
                        </a>
                        <dl class="layui-nav-child">
                            <dd><a href="javascript:;" data-name="选项一">
                                <span>选项一</span>
                                <span class="catalog-tool catalog-add layui-icon" onclick="addChildCatalog(this)">&#xe608;</span>
                                <span class="catalog-tool catalog-sub layui-icon" onclick="removeCatalog(this)">&#x1006;</span>
                                <span class="catalog-tool catalog-editor layui-icon" onclick="editorCatalog(this)">&#xe642;</span>
                                <span class="catalog-tool catalog-view layui-icon" onclick="">&#xe652;</span>
                                <span class="catalog-tool catalog-upload layui-icon upload-file-1" onclick="">&#xe681;</span>
                                <span class="catalog-tool catalog-open layui-icon open-file-1" onclick="">&#xe655;</span>
                            </a></dd>
                            <dd><a href="javascript:;" data-name="选项二">
                                <span>选项二</span>
                                <span class="catalog-tool catalog-add layui-icon" onclick="addChildCatalog(this)">&#xe608;</span>
                                <span class="catalog-tool catalog-sub layui-icon" onclick="removeCatalog(this)">&#x1006;</span>
                                <span class="catalog-tool catalog-editor layui-icon" onclick="editorCatalog(this)">&#xe642;</span>
                                <span class="catalog-tool catalog-view layui-icon" onclick="">&#xe652;</span>
                                <span class="catalog-tool catalog-upload layui-icon upload-file-2" onclick="">&#xe681;</span>
                                <span class="catalog-tool catalog-open layui-icon open-file-2" onclick="">&#xe655;</span>
                            </a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item">
                        <a href="javascript:;" data-name="目录二">
                            <span>目录二</span>
                            <span class="catalog-tool catalog-add layui-icon" onclick="addCatalog(this)">&#xe608;</span>
                            <span class="catalog-tool catalog-sub layui-icon" onclick="removeCatalog(this)">&#x1006;</span>
                            <span class="catalog-tool catalog-editor layui-icon" onclick="editorCatalog(this)">&#xe642;</span>
                        </a>
                        <dl class="layui-nav-child">
                            <dd><a href="javascript:;" data-name="选项一">
                                <span>选项一</span>
                                <span class="catalog-tool catalog-add layui-icon" onclick="addChildCatalog(this)">&#xe608;</span>
                                <span class="catalog-tool catalog-sub layui-icon" onclick="removeCatalog(this)">&#x1006;</span>
                                <span class="catalog-tool catalog-editor layui-icon" onclick="editorCatalog(this)">&#xe642;</span>
                                <span class="catalog-tool catalog-view layui-icon" onclick="">&#xe652;</span>
                                <span class="catalog-tool catalog-upload layui-icon upload-file-3" onclick="">&#xe681;</span>
                                <span class="catalog-tool catalog-open layui-icon open-file-3" onclick="">&#xe655;</span>
                            </a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item">
                        <a href="javascript:;" data-name="目录三">
                            <span>目录三</span>
                            <span class="catalog-tool catalog-add layui-icon" onclick="addCatalog(this)">&#xe608;</span>
                            <span class="catalog-tool catalog-sub layui-icon" onclick="removeCatalog(this)">&#x1006;</span>
                            <span class="catalog-tool catalog-editor layui-icon" onclick="editorCatalog(this)">&#xe642;</span>
                        </a>
                        <dl class="layui-nav-child"></dl>
                    </li>
                </ul>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">课程简介</label>
            <div class="layui-input-block">
                <textarea id="container" class="container" style="width: 1180px;"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="submit" class="layui-btn submit-button" lay-submit lay-filter="addcoursesubmit">添加</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
    <i class="layui-icon">&#xe60c;</i>
</div>
<!----------- contain_right end   ----------->

</body>
</html>