<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>register</title>
    <link rel="stylesheet" type="text/css" href="/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="/css/mycss/register.css">

    <script src="/js/jquery.js"></script>
    <script src="/layui/layui.js"></script>
    <script src="/js/myjs/register.js"></script>

</head>
<body>
<div>
    <jsp:include page="/WEB-INF/views/common/header.jsp" flush="true"></jsp:include>
</div>
<div class="register-content clear-fix">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
        <legend>邮箱注册</legend>
    </fieldset>
    <form class="layui-form" action="" id="form" lay-filter="example">
        <div class="register-left">
        <div class="layui-form-item">
            <label class="layui-form-label">昵称</label>
            <div class="layui-input-block">
                <input type="text" name="username" lay-verify="title|required" autocomplete="off" placeholder="昵称" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">邮箱</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="email" lay-verify="email|required" placeholder="邮箱" autocomplete="off">
                </div>
                <div class="layui-input-inline">
                    <button type="button" onclick="sendVerification(this)" class="layui-btn layui-btn-primary">发送验证码</button>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-block">
                <input type="password" name="password" placeholder="请输入密码" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">验证码</label>
            <div class="layui-input-block">
                <input type="text" name="check" lay-verify="title|required" autocomplete="off" placeholder="验证码" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">手机号码</label>
                <div class="layui-input-inline">
                    <input type="tel" name="phone" lay-verify="phone" autocomplete="off" placeholder="手机号码" oninput="value=value.replace(/[^\d]/g,'')" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input type="radio" name="sex" value="男" title="男">
                <input type="radio" name="sex" value="女" title="女" checked="checked">
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">个性说明</label>
            <div class="layui-input-block">
                <textarea placeholder="这人很懒什么都没有留下" class="layui-textarea" name="description" style="width: 300px;"></textarea>
            </div>
        </div>

        </div>
        <div class="register-right">
            <div class="layui-form-item">
                <label class="layui-form-label">个性签名</label>
                <div class="layui-input-block">
                    <input type="text" name="user-autograph" class="layui-input" placeholder="这人特懒连签名都不写" style="width: 255px ;">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">教师注册</label>
                <div class="layui-input-block">
                    <input type="checkbox" name="type" lay-skin="switch" lay-text="ON|OFF">
                </div>
            </div>
            <div class="layui-form-item" id="upload-thumb">
                <label class="layui-form-label">个性头像</label>
                <div class="layui-upload-list">
                    <img class="layui-upload-img" name="user-img" id="user-img" width="150" height="150" src="/img/courseimages/c01.jpg" style="width: 200px; height: 200px">
                </div>
                <label class="layui-form-label"></label>
                <button type="button" id="upload-img" name="upfile" class="layui-btn layui-btn-primary">设置图标</button>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit="" lay-filter="submit">立即注册</button>
                </div>
            </div>
        </div>
    </form>
</div>

</body>
</html>
