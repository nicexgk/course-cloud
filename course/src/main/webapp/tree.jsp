<%--
  Created by IntelliJ IDEA.
  User: A1621
  Date: 2019/4/8
  Time: 21:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link type="text/css" rel="stylesheet" href="/layui/css/layui.css">
    <script href="/js/jquery.js"></script>
    <script src="/layui/layui.js"></script>
</head>
<body>

<ul class="layui-nav layui-nav-tree layui-inline" lay-filter="catalog" style="margin-right: 10px; width: 300px">
    <li class="layui-nav-item layui-nav-itemed">
        <a href="javascript:;">默认展开</a>
        <dl class="layui-nav-child">
            <dd><a href="javascript:;">选项一</a></dd>
            <dd><a href="javascript:;">选项二</a></dd>
            <dd><a href="javascript:;">选项三</a></dd>
            <dd><a href="">跳转项</a></dd>
        </dl>
    </li>
    <li class="layui-nav-item">
        <a href="javascript:;">解决方案</a>
        <dl class="layui-nav-child">
            <dd><a href="">移动模块</a></dd>
            <dd><a href="">后台模版</a></dd>
            <dd><a href="">电商平台</a></dd>
        </dl>
    </li>
    <li class="layui-nav-item"><a href="">云市场</a></li>
    <li class="layui-nav-item"><a href="">社区</a></li>
</ul>

<script>
    layui.use('element', function(){
       var element = layui.element;
       element.on('nav(catalog)', function(data){
           console.log(data);
       });
    });
</script>
</body>
</html>
