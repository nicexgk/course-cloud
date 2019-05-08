<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>
    <link rel="stylesheet" type="text/css" href="/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="/css/mycss/home-page.css"/>
    <link rel="stylesheet" type="text/css" href="/css/mycss/login.css"/>

    <script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript" src="/layui/layui.js"></script>

</head>
<body>
<div>
    <jsp:include page="/WEB-INF/views/common/header.jsp" flush="true"></jsp:include>
</div>
<div class="login-container">
    <div class="login-body">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 15%;">
            <legend>用户登录</legend>
        </fieldset>
        <%--<form class="layui-form form" method="post" action="" id="form" lay-filter="example">--%>
            <div class="register-left">
                <div class="layui-form-item">
                    <label class="layui-form-label"><i class="layui-icon">&#xe66f;</i>账号</label>
                    <div class="layui-input-block">
                        <input type="text" name="username" lay-verify="title|required" autocomplete="off" placeholder="邮箱/账号" class="layui-input input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label"><i class="layui-icon">&#xe673;</i>密码</label>
                    <div class="layui-input-block">
                        <input type="password" name="password" placeholder="请输入密码" autocomplete="off" class="layui-input input">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"></label>
                <div class="layui-input-inline">
                    <a href="/register.html"><button class="layui-btn user-register">注册</button></a>
                </div>
                <div class="layui-input-inline">
                    <button class="layui-btn user-login" onclick="login2()">登录</button>
                </div>
            </div>
            <div>
                <a class="reset-password-link" href="/forgetpassword.html"><i class="layui-icon">&#xe607;</i>忘记密码</a>
            </div>
        <%--</form>--%>
    </div>
</div>
</body>
<script>
    function login2() {
        var account = $("input[name='username']").val();
        var pwd = $("input[name='password']").val();
        console.log(account);
        console.log(pwd);
        var user = {};
        user.account = account;
        user.pwd = pwd;
        $.post(
            "/user/",
            user,
            function (data) {
                console.log(data);
                if (data.userId == undefined) {
                    console.log("incorrect user or password ");
                    layer.msg("登录失败!!!", {icon: 5});
                } else {
                    loginSuccess(data);
                    layer.msg("登录成功!!!", {icon: 1});
                }
            });
    }
</script>
</html>
