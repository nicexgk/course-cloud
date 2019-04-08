var ue;

$(function () {
    // 实例化Ueditor编辑器
    var width = document.body.clientWidth - 200;
    var height = document.body.clientHeight;
    console.log(width);
    console.log(height);
    ue = UE.getEditor('container',{initialFrameHeight:300 ,initialFrameWidth:width});
    //
    // form_init()


    form_init();


});



function form_init() {
    layui.use(['element', 'upload', 'form', 'layer'], function () {
        var upload = layui.upload;
        var form = layui.form;
        var layer = layui.layer;
        // 图片上传
        upload.render({
            elem: '#uploadimg',
            url: '/upload/image',
            accept: 'file',
            exts: 'img|jpg|jpeg|png',
            done: function (res) {
                if (res.status == 200) {
                    layer.msg("上传成功", {icon: 1});
                    $("#courseimg").attr("src", res.resource);
                    $("#upload-thumb").append("<input type='hidden' name='photo' value='" + res.resource + "'>");
                } else if (res.status == 400) {
                    layer.msg("图片上传失败，稍后请重试。。。", {icon: 5});
                }
            },
            error: function () {
                // 演示失败状态，并实现重传
            }
        });
        // 选择框局部更新 select1
        form.on('select(select1)', function (data) {
            if (data.value == 0) {
                $("#select2").html("");
                form.render('select');
            } else {
                // $.ajax({
                //     type: "get",
                //     url: "queryCourseTypeForPid.action ",
                //     async: true, 	//是否异步
                //     data: {selectvalue: data.value},
                //     success: function (data) {
                //         res = $.parseJSON(data);	// 将字符串的json数组转成json类型的json数组
                //         var str = "";
                //         for (var i = 0; i < res.length; i++) {
                //             str += "<option value='" + res[i].typeId + "'>" + res[i].typeName + "</option>"
                //         }
                //         $("#select2").html(str);
                //         form.render('select');
                //     }
                // });
                sortSelect_1(data.value);
                form.render('select');
            }
        });
        // 选择框局部更新 select2
        form.on('select(select2)', function (data) {
            if (data.value == 0 || data == null) {
                $("#select3").html("");
                form.render('select');
            } else {
                sortSelect_2(data.value);
                form.render('select');
            }
        });
        // 表单提交
        form.on('submit(addcoursesubmit)', function (data) {
            var course = new Object();
            course.courseName = $("input[name='course-name']").val();
            course.picUrl = $("input[name='photo']").val();
            course.courseDetail = $("input[name='course-detail']").val();
            course.courseType = $("#select3").val();
            course.description = ue.getContent();
            course.coursePrice = $("input[name='course-price']").val();
            console.log(course);
            $.post("/course/", course, function (res) {
                console.log(res);
                if (res.status == 200) {
                    layer.msg('添加成功!!!', {icon: 1});
                } else {
                    layer.alert(res.description, {icon: 5 , skin: 'layer-ext-moon'} );
                }
            });
            //阻止表单跳转。如果需要表单跳转，去掉这段即可。
            return false;
        });
    });
}

function sortSelect_1(index) {
    //layer.msg('添加成功!!!',{icon: 1});
    //setSecond();
    console.log(index);
    var select_2 = $("#select2").html("");
    for (var parentType in courseTypeCatalog) {
        if (courseTypeCatalog[parentType].typeId == index) {
            var secondTypeList = courseTypeCatalog[parentType].childList;
            // 当没有子列表时设置其他选择框的内容为空
            if (secondTypeList.length == 0) {
                $("#select2").html("");
                $("#select3").html("");
            }
            for (var secondType in secondTypeList) {
                if(secondType == 0){
                    sortSelect_2(secondTypeList[secondType].typeId);
                }
                select_2.append('<option value="' + secondTypeList[secondType].typeId + '">' + secondTypeList[secondType].typeName + '</option>');
            }
            break;
        }
    }
}

function sortSelect_2(index_2) {
    var index = $("#select1").val();
    //index_2 = index_2.value;
    console.log(index);
    console.log(index_2);
    var select_3 = $("#select3").html("");
    var secondTypeList;
    for (parentType in courseTypeCatalog) {
        if (courseTypeCatalog[parentType].typeId == index) {
            secondTypeList = courseTypeCatalog[parentType].childList;
            break;
        }
    }
    console.log(secondTypeList);
    for (var secondType in secondTypeList) {
        if (secondTypeList[secondType].typeId == index_2) {
            var chileTypeList = secondTypeList[secondType].childList;
            for (var chileType in chileTypeList) {
                select_3.append('<option value="' + chileTypeList[chileType].typeId + '">' + chileTypeList[chileType].typeName + '</option>');
            }
        }
    }
}


function tt() {
    layer.tips('我是另外一个tips，只不过我长得跟之前那位稍有些不一样。', '吸附元素选择器', {
        tips: [1, '#3595CC'],
        time: 4000
    });
}
// function submitForm() {
//     $("#form").ajaxSend(function (data) {
//         alert("data" + "dfdjfldfjd");
//         layer.msg(" submigform tip");
//     });
//     alert("sdsdsd");
//     return false;
// }