<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>个人信息</title>
    <link rel="stylesheet" type="text/css" href="/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="/css/mycss/home-page.css"/>
    <link rel="stylesheet" type="text/css" href="/css/mycss/informataion.css">

    <script href="/js/jquery.js"></script>
    <script href="/layui/layui.js"></script>
</head>
<body class="l-aside-left l-min">

<div>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
</div>

<div id="react-body">

    <section class="inner-center clearfix">
        <aside class="aside-left">
            <div class="l-nav-area">
                <ul class="l-nav">
                    <li class="l-nav-item"><a title="课程表" href="/studentcourse.html">课程表</a></li>
                    <li class="l-nav-item"><a title="全部订单" href="/order.html">全部订单</a></li>
                    <li class="l-nav-item"><a title="收藏" href="/collection.html">收藏列表</a></li>
                    <li class="l-nav-item"><a title="个人信息" href="/userinfo.html" class="active">个人信息</a></li>
                </ul>
            </div>
        </aside>

        <main class="main main-container">
            <div class="wrapper-plan">
                <h1 class="wrapper-tt">个人信息</h1>
            </div>
            <div>
                <form class="layui-form" action="" id="form" lay-filter="example">
                    <div class="layui-form-item" id="upload-thumb">
                        <label class="layui-form-label">个性头像</label>
                        <div class="layui-upload-list">
                            <img class="layui-upload-img user-img" name="user-img" id="user-img" width="150" height="150" src="${sessionScope.user.userIcon}">
                        </div>
                        <label class="layui-form-label"></label>
                        <button type="button" id="upload-img" name="upfile" class="layui-btn layui-btn-primary">设置图标</button>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">昵称</label>
                        <div class="layui-input-block">
                            <input type="text" name="username" lay-verify="title|required" autocomplete="off" placeholder="昵称" class="layui-input" value="${sessionScope.user.userName}">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">手机号码</label>
                            <div class="layui-input-inline">
                                <input type="tel" name="phone" lay-verify="phone" value="${sessionScope.user.userPhone}" autocomplete="off" placeholder="手机号码"
                                       oninput="value=value.replace(/[^\d]/g,'')" class="layui-input">
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">性别</label>
                        <div class="layui-input-block">
                            <input type="radio" name="sex" value="男" title="男" ${sessionScope.user.userSex == 0 ? 'checked="checked"' : ""}>
                            <input type="radio" name="sex" value="女" title="女" ${sessionScope.user.userSex != 0 ? 'checked="checked"' : ""}>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">个性签名</label>
                        <div class="layui-input-block">
                            <input type="text" name="user-autograph" value="${sessionScope.user.userAutograph}" class="layui-input" placeholder="这人特懒连签名都不写" style="width: 255px ;">
                        </div>
                    </div>

                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">个性说明</label>
                        <div class="layui-input-block">
                            <textarea placeholder="这人很懒什么都没有留下" class="layui-textarea" name="description" style="width: 300px;">${sessionScope.user.userDescription}</textarea>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button class="layui-btn" lay-submit="" lay-filter="submit">更改信息</button>
                        </div>
                    </div>
                </form>
            </div>
        </main>
    </section>
</div>
<script>

    function init() {
        layui.use(['element', 'upload', 'form', 'layer'], function () {
            var upload = layui.upload;
            var form = layui.form;
            var layer = layui.layer;
            var element = layui.element;
            form.render();
            // 图片上传
            upload.render({
                elem: '#upload-img',
                url: '/upload/image/',
                accept: 'file',
                exts: 'img|jpg|jpeg|png',
                done: function (res) {
                    if (res.status == 200) {
                        layer.msg("上传成功", {icon: 1});
                        $("img[name='user-img']").attr("src", res.resource);
                    } else if (res.status == 400) {
                        layer.msg("图片上传失败，稍后请重试。。。", {icon: 5});
                    }
                },
                error: function () {
                    // 演示失败状态，并实现重传
                }
            });

            // 表单提交
            form.on('submit(submit)', function (data) {
                var user = {};
                user.userName = $("input[name='username']").val();
                user.userPwd = $("input[name='password']").val();
                user.userPhone = $("input[name='phone']").val();
                user.userSex = $(":radio:checked[name='sex']").val() == "女" ? 1 : 0;
                user.userDescription = $("textarea[name='description']").val();
                user.userAutograph = $("input[name='user-autograph']").val();
                user.userIcon = $("input[name='course-img']").attr("src");
                var check = $("input[name='check']").val();
                console.log(user);
                var str = JSON.stringify(user);
                console.log(str);
                $.ajax({
                    url: '/user/',
                    type: 'put',
                    contentType: 'application/json; charset=utf-8',
                    data: str,
                    success: function (res) {
                        console.log(res);
                        if (res.status == 200) {
                            layer.msg('信息修改成功!!!', {icon: 1});
                        } else {
                            layer.alert(res.description, {icon: 5, skin: 'layer-ext-moon'});
                        }
                    }
                });
                //阻止表单跳转。如果需要表单跳转，去掉这段即可。
                return false;
            });

        });
    }

    init();
</script>

</body>
</html>
