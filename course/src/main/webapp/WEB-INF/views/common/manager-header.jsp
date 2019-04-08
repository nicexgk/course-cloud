<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>manager header</title>
    <link type="text/css" rel="stylesheet" href="/layui/css/layui.css">
</head>
<body>
<ul class="layui-nav" lay-filter="nav">
    <li class="layui-nav-item layui-this">
        <a href="javascript:;">课程列表</a>
    </li>

    <li class="layui-nav-item">
        <a href="javascript:;">课程管理</a>
        <dl class="layui-nav-child">
            <dd><a href="/addcourse.html" target="_blank">添加课程</a></dd>
            <dd><a href="javascript:;">修改课程</a></dd>
        </dl>
    </li>
    <li class="layui-nav-item">
        <a href="javascript:;">控制台<span class="layui-badge">9</span></a>
    </li>
    <li class="layui-nav-item">
        <a href="javascript:;">个人中心<span class="layui-badge-dot"></span></a>
    </li>
    <li class="layui-nav-item" lay-unselect="">
        <a href="javascript:;"><img src="/img/1.jpg" class="layui-nav-img">我</a>
        <dl class="layui-nav-child">
            <dd><a href="javascript:;">修改信息</a></dd>
            <dd><a href="javascript:;">安全管理</a></dd>
            <dd><a href="javascript:;">退了</a></dd>
        </dl>
    </li>
</ul>
<div style="margin-top: 15px;"></div>

<script src="/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use('element', function(){
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

        //监听导航点击
        element.on('nav(nav)', function(elem){
            console.log(elem)
            layer.msg(elem.text());
        });
    });
</script>

</body>
</html>
