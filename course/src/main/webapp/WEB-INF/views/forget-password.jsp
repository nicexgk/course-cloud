<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>
    <link rel="stylesheet" type="text/css" href="/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="/css/mycss/home-page.css"/>
    <link rel="stylesheet" type="text/css" href="/css/mycss/forget-pwssword.css"/>
    <script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript" src="/layui/layui.js"></script>
    <script type="text/javascript" src="/js/myjs/forget-password.js"></script>
</head>
<body>
<div>
    <jsp:include page="/WEB-INF/views/common/header.jsp" flush="true"></jsp:include>
</div>
<div class="reset-container">
    <div class="reset-body">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 15%;">
            <legend>忘记密码</legend>
        </fieldset>
        <form class="layui-form" action="" id="form" lay-filter="example">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">邮箱</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input input" name="email" lay-verify="email|required" placeholder="邮箱" autocomplete="off">
                </div>
                <div class="layui-input-inline">
                    <button type="button" onclick="sendVerification(this)" class="layui-btn layui-btn-primary check-number">发送验证码</button>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-block">
                <input type="password" name="password" placeholder="请输入密码" autocomplete="off" class="layui-input input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">确认密码</label>
            <div class="layui-input-block">
                <input type="password" name="password-check" placeholder="请输入密码" autocomplete="off" class="layui-input input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">验证码</label>
            <div class="layui-input-block">
                <input type="text" name="check" lay-verify="title|required" autocomplete="off" placeholder="验证码" class="layui-input input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"></label>
            <div class="layui-input-inline">
                <button class="layui-btn user-register input" lay-submit="" lay-filter="submit">重置密码</button>
            </div>
        </div>
        </form>
    </div>
</div>
</div>
</div>
</body>
<script>

</script>
</html>
