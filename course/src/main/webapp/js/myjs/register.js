$(function () {

    init();

});


function init() {
    layui.use(['element', 'upload', 'form', 'layer'], function () {
        var upload = layui.upload;
        var form = layui.form;
        var layer = layui.layer;
        var element = layui.element;

        // 图片上传
        upload.render({
            elem: '#upload-img',
            url: '/upload/image',
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
            user.userEmail = $("input[name='email']").val();
            user.userPwd = $("input[name='password']").val();
            user.userPhone = $("input[name='phone']").val();
            user.userSex = $(":radio:checked[name='sex']").val();
            user.courseType = $("#select3").val();
            user.description = $("textarea[name='description']").val();
            user.userAutograph = $("input[name='user-autograph']").val();
            user.userIcon = $("input[name='course-price']").val();
            user.userType = $("em").html() == "ON" ? 1: 0;
            user.userIcon = $("input[name='course-img']").attr("src");
            var check = $("input[name='check']")
            var check = $("input[name='check']").val();
            console.log(user);
            var str = JSON.stringify(user);
            console.log(str);
            $.ajax({
                url: '/user/'+ check,
                type: 'post',
                contentType: 'application/json; charset=utf-8',
                data: str,
                success: function (res) {
                    console.log(res);
                    if (res.status == 200) {
                        layer.msg('注册成功!!!', {icon: 1});
                    } else {
                        layer.alert(res.description, {icon: 5, skin: 'layer-ext-moon'});
                    }
                }
            });
            //阻止表单跳转。如果需要表单跳转，去掉这段即可。
            return false;
        });

        form.on('submit()', function(data){

        })

    });
}

function sendVerification(target){
    var reg = /^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/;
    var email = $("input[name='email']").val();
    console.log(reg.test(email));
    console.log(email);
    layui.use('layer', function(){
        var layer = layui.layer;
        if(!reg.test(email)){
            layer.msg("邮箱格式不正确",{icon: 2});
            return;
        }
        $(target).attr("disabled", "true").css("background-cole", "eee");
        $.ajax({
            url: '/mail/',
            type: 'get',
            data: {email: email},
            success: function(res){
                if(res.status == 200){
                    layer.msg("验证码以发送", {icon: 1});
                    $(target).attr("disabled", "false").css("background-color", "c5c5c5");
                } else {
                    layer.msg("验证码发送失败，请重试", {icon: 5});
                    $(target).attr("disabled", "false").css("background-color", "fff");
                }
            }
        });
    });

}