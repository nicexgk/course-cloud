function uploadAvatar() {
    // 得到图片的表单
    var form = $('#upload-avatar')[0];
    // 通过ajax将表单提交（只有图片的表单），服务器返回图片地址和状态
    $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url: "uploadImg",
        data: new FormData(form),
        processData: false,
        contentType: false,
        cache: false,
        success: function (data) {
            // 将结果转为对象
            var avatar = $.parseJSON(data);
            // 成功
            if (avatar.status == 1) {
                // 将图片地址设置到需要提交的表单
                $("#avatar-url").val(avatar.picurl);
                // 将图片显示出来
                $("#avatar").attr("src", avatar.picurl);
            } else {
                alert("上传失败");
            }
        }
    });
}