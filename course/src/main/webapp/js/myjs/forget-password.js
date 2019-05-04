
$(function(){
    layui.use(["form", "element", "layer"], function(data){
        var form = layui.form;
        var layer = layui.layer;
        form.on('submit(submit)', function (data) {
            var userEmail = $("input[name='email']").val();
            var userPwd = $("input[name='password']").val();
            var userPwd2 = $("input[name='password-check']").val();
            var check = $("input[name='check']").val();
            if(userPwd != userPwd2){
                layui.use('element', function(){
                    var layer = layui.layer;
                    layer.msg("密码与确认密码不相同", {icon: 3});
                });
                return false;
            }
            console.log(userEmail);
            console.log(userPwd);

            $.ajax({
                url: '/user/reset/'+ check,
                type: 'put',
                data: {email: userEmail, pwd: userPwd},
                success: function (res) {
                    console.log(res);
                    if (res.status == 200) {
                        layer.msg(res.description, {icon: 1});
                    } else {
                        layer.alert(res.description, {icon: 5, skin: 'layer-ext-moon'});
                    }
                }
            });
            //阻止表单跳转。如果需要表单跳转，去掉这段即可。
            return false;
        });
    })
})



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

