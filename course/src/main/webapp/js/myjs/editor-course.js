var ue;
var i = 0;
// 目录变量
var catalogEditor = '<span class="catalog-tool catalog-add layui-icon" onclick="addCatalog(this)">&#xe608;</span>' +
    '<span class="catalog-tool catalog-sub layui-icon" onclick="removeCatalog(this)">&#x1006;</span>' +
    '<span class="catalog-tool catalog-editor layui-icon" onclick="editorCatalog(this)">&#xeb61;</span>';
// 子目录变量
var catalogEditorChild = '<span class="catalog-tool catalog-add layui-icon" onclick="addChildCatalog(this)">&#xe608;</span>' +
    '<span class="catalog-tool catalog-sub layui-icon" onclick="removeCatalog(this)">&#x1006;</span>' +
    '<span class="catalog-tool catalog-editor layui-icon" onclick="editorCatalog(this)">&#xeb61;</span>' +
    '<span class="catalog-tool catalog-view layui-icon" onclick="">&#xe652;</span>' +
    '<span class="catalog-tool catalog-upload layui-icon upload-file-' + ++i + '" onclick="">&#xe681;</span>' +
    '<span class="catalog-tool catalog-open layui-icon open-file-' + i + '" onclick="">&#xe655;</span>';

$(document).ready(function () {
    // 实例化Ueditor编辑器
    var width = document.body.clientWidth - 300;
    var height = document.body.clientHeight;
    console.log(width);
    console.log(height);
    ue = UE.getEditor('container', {initialFrameHeight: 300, initialFrameWidth: width});
    console.log("nice nice nice");
    form_init();
    ue.ready(function () {
        fullDate(course);
    });
    uploadFile();
    i++;
    uploadFile();
    i++
    uploadFile();
    i++
});


function form_init() {
    layui.use(['element', 'upload', 'form', 'layer'], function () {
        var upload = layui.upload;
        var form = layui.form;
        var layer = layui.layer;
        var element = layui.element;
        //监听目录的点击事件
        element.render("nav(catalog)");
        element.on('nav(catalog)', function (data) {
            // console.log(data);
        });
        // 图片上传
        upload.render({
            elem: '#uploadimg',
            url: '/upload/image',
            accept: 'file',
            exts: 'img|jpg|jpeg|png',
            done: function (res) {
                if (res.status == 200) {
                    layer.msg("上传成功", {icon: 1});
                    $("img[name='course-img']").attr("src", res.resource);
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
            console.log(course);
            course.courseName = $("input[name='course-name']").val();
            course.picUrl = $("img[name='course-img']").attr("src");
            course.courseDetail = $("input[name='course-detail']").val();
            course.courseType = $("#select3").val();
            course.description = ue.getContent();
            course.coursePrice = $("input[name='course-price']").val();
            var catalogList = getCatalog();
            course.catalogList = catalogList;
            console.log(course);
            console.log(catalogList);
            var str = JSON.stringify(course);
            console.log(str);
            $.ajax({
                url: '/course/',
                type: 'put',
                contentType: 'application/json; charset=utf-8',
                data: str,
                success: function (res) {
                    console.log(res);
                    if (res.status == 200) {
                        layer.msg('修改成功!!!', {icon: 1});
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

// select的内容联动
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
                if (secondType == 0) {
                    sortSelect_2(secondTypeList[secondType].typeId);
                }
                select_2.append('<option value="' + secondTypeList[secondType].typeId + '">' + secondTypeList[secondType].typeName + '</option>');
            }
            break;
        }
    }
}

// select的内容联动
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

// 添加目录
function addCatalog(target) {
    var catalogEditorChild = '<span class="catalog-tool catalog-add layui-icon" onclick="addChildCatalog(this)">&#xe608;</span>' +
        '<span class="catalog-tool catalog-sub layui-icon" onclick="removeCatalog(this)">&#x1006;</span>' +
        '<span class="catalog-tool catalog-editor layui-icon" onclick="editorCatalog(this)">&#xeb61;</span>' +
        '<span class="catalog-tool catalog-view layui-icon" onclick="">&#xe652;</span>' +
        '<span class="catalog-tool catalog-upload layui-icon upload-file-' + ++i + '" onclick="">&#xe681;</span>' +
        '<span class="catalog-tool catalog-open layui-icon open-file-' + i + '" onclick="">&#xe655;</span>';

    var catalogChild = '<dd><a href="javascript:;" data-name="子目录"><span>子目录</span>' + catalogEditorChild + '</a></dd>';
    var catalog = '<li class="layui-nav-item"><a href="javascript:;" data-name="目录"><span>目录</span>' + catalogEditor + '</a><dl class="layui-nav-child">' + catalogChild + '</dl></li>';
    $(target).parent().parent().after(catalog);
    uploadFile();
    renderNav();
}

// 添加子目录
function addChildCatalog(target) {
    var catalogEditorChild = '<span class="catalog-tool catalog-add layui-icon" onclick="addChildCatalog(this)">&#xe608;</span>' +
        '<span class="catalog-tool catalog-sub layui-icon" onclick="removeCatalog(this)">&#x1006;</span>' +
        '<span class="catalog-tool catalog-editor layui-icon" onclick="editorCatalog(this)">&#xeb61;</span>' +
        '<span class="catalog-tool catalog-view layui-icon" onclick="">&#xe652;</span>' +
        '<span class="catalog-tool catalog-upload layui-icon upload-file-' + ++i + '" onclick="">&#xe681;</span>' +
        '<span class="catalog-tool catalog-open layui-icon open-file-' + i + '" onclick="">&#xe655;</span>';

    var catalogChild = '<dd><a href="javascript:;" data-name="子目录"><span>子目录</span>' + catalogEditorChild + '</a></dd>';
    $(target).parent().parent().after(catalogChild);
    var target = console.log($(target).parent().parent().next());
    renderNav();
    uploadFile();
}

// 移除目录
function removeCatalog(target) {
    console.log(target);
    $(target).parent().parent().remove();
    renderNav();
}

// 编辑目录的名字
function editorCatalog(target) {
    layer.prompt({title: '请输入目录名：', formType: 2}, function (text, index) {
        layer.close(index);
        $(target).parent().children()[0].innerHTML = text;
        $(target).parent().attr('data-name', text);
    });
}

// 视频上传函数
function uploadFile() {
// 创建一个上传组件
    var opernfile = '.open-file-' + i
    var uploadfile = '.upload-file-' + i
    layui.use('upload', function (data) {
        upload = layui.upload;
        layer = layui.layer;
        var parent;
        console.log('upload reader');
        console.log(data);
        upload.render({
            elem: opernfile // 绑定对象
            , url: '/upload/video'  // 上传url
            , auto: false // 关闭自动上传
            , bindAction: uploadfile  // 触发上传的对象
            , accept: 'file' //允许上传的文件类型
            , size: 1024 * 512 //最大允许上传的文件大小
            , choose: function (obj) {
                console.log("choose choose choose choose");
                var view = $(this.bindAction).prev();
                parent = $(this.elem).parent();
                // 预览
                obj.preview(function (index, file, result) {
                    var url = URL.createObjectURL(file);
                    console.log(url);
                    view[0].onclick = function (e) {
                        console.log("view view view ");
                        console.log(e);
                        layer.open({
                            type: 2,
                            title: false,
                            area: ['630px', '360px'],
                            shade: 0.8,
                            closeBtn: 0,
                            shadeClose: true,
                            content: url
                        });
                    };
                });
            }
            , before: function (obj) { //obj参数包含的信息，跟 choose回调完全一致，可参见上文。
                console.log("before before before before");
            }
            , done: function (res, index, upload) { //上传后的回调
                console.log(res);
                if (res.status === 200) {
                    layer.msg("视频上传成功！", {icon: 1});
                    console.log(this);
                    console.log(parent);
                    parent.attr('data-resource', res.resource);
                    console.log(parent.attr('data-resource'));
                } else {
                    layer.msg("视频上传失败！", {icon: 5});
                }
            }
        })
    });
}

// 重新渲染目录结构
function renderNav() {
    layui.use('element', function () {
        var element = layui.element;
        element.render('nav', 'catalog');
    })
}

//获取目录的json对象结构
function getCatalog() {
    var catalogArray = [];
    var catalogList = $('.catalog-nav>li>a');
    console.log(catalogList);
    for (var i = 0; i < catalogList.length; i++) {
        console.log(i);
        var catalog = $(catalogList[i]);
        var parentCatalog = {};
        parentCatalog.catalogName = catalog.attr('data-name');
        parentCatalog.childList = [];
        var childList = catalog.next('dl').children('dd').children('a');
        for (var j = 0; j < childList.length; j++) {
            var child = $(childList[j]);
            var childCatalog = {};
            childCatalog.catalogName = child.attr('data-name');
            childCatalog.catalogResource = child.attr('data-resource')
            parentCatalog.childList.push(childCatalog);
        }
        catalogArray.push(parentCatalog);
    }
    console.log(catalogArray);
    console.log(catalogArray);
    return catalogArray;
}


// 填充数据
function fullDate(course) {
    if (course != undefined && course.courseId != undefined) {
        $("input[name='course-name']").val(course.courseName);
        $("input[name='photo']").val(course.picUrl);
        $("img[name='course-img']").attr('src', course.picUrl);
        $("input[name='course-detail']").val(course.courseDetail);
        if (course.description != undefined || course.description != null) {
            ue.setContent(course.description);
        }
        if (course.coursePrice != 0) {
            $("input[name='course-price']").val(course.coursePrice);
        }
        initCatalog();
        reversChangeSelect(course.courseType);
        layui.use('form', function () {
            layui.form.render('select');
        });
    }
}

// 改变select的选择
function reversChangeSelect(index) {
    console.log(index);
    var parentCourse;
    var secondCourse;
    var childCourse;
    var flag = false;
    var select1 = $("#select1");
    var select2 = $("#select2");
    var select3 = $("#select3");
    console.log(courseTypeCatalog);
    for (var parent in courseTypeCatalog) {
        if (flag) {
            break;
        }
        parentCourse = courseTypeCatalog[parent];
        for (var second in parentCourse.childList) {
            if (flag) {
                break;
            }
            secondCourse = parentCourse.childList [second];
            for (var child in secondCourse.childList) {
                childCourse = secondCourse.childList[child];
                if (childCourse.typeId == index) {
                    flag = true;
                    break;
                }
            }
        }
        console.log(parent);
    }
    console.log("dddddddddddddddd===============>");
    console.log(parentCourse);
    console.log(secondCourse);
    console.log(childCourse);
    console.log("dddddddddddddddd===============>");

    select2.html("");
    select3.html("");
    for (var child in secondCourse.childList) {
        childCourse = secondCourse.childList[child];
        console.log(childCourse);
        if (childCourse.typeId == index) {
            select3.append('<option value="' + childCourse.typeId + '"selected="selected">' + childCourse.typeName + '</option>');
        } else {
            select3.append('<option value="' + childCourse.typeId + '">' + childCourse.typeName + '</option>');
        }
    }

    console.log(secondCourse);
    for (var second in parentCourse.childList) {
        var secondCourse2 = parentCourse.childList[second];
        if (secondCourse2.typeId == secondCourse.typeId) {

            console.log(" secondCourse2 secondCourse2 secondCourse2 ");
            console.log(secondCourse2);
            select2.append('<option value="' + secondCourse2.typeId + '"selected="selected">' + secondCourse2.typeName + '</option>');
        } else {
            select2.append('<option value="' + secondCourse2.typeId + '">' + secondCourse2.typeName + '</option>');
        }

    }

    $("#select1>option").each(function () {
        console.log(this);
        if (parentCourse.typeId == $(this).attr("value")) {
            $(this).attr("selected", "selected");
        }
    });

    layui.use('form', function () {
        layui.form.render('select');
    });
}

// 初始化目录
function initCatalog() {
    var catalogList = course.catalogList;
    var start = i;
    var end;
    $(".catalog-nav").html("");
    for (var par in catalogList) {
        var parent = catalogList[par];
        var str = "";
        for (var chi in parent.childList) {
            var child = parent.childList[chi];
            var catalogEditorChild = '<span class="catalog-tool catalog-add layui-icon" onclick="addChildCatalog(this)">&#xe608;</span>' +
                '<span class="catalog-tool catalog-sub layui-icon" onclick="removeCatalog(this)">&#x1006;</span>' +
                '<span class="catalog-tool catalog-editor layui-icon" onclick="editorCatalog(this)">&#xeb61;</span>' +
                '<span class="catalog-tool catalog-view layui-icon" onclick="previewVideo(this)">&#xe652;</span>' +
                '<span class="catalog-tool catalog-upload layui-icon upload-file-' + ++i + '" onclick="">&#xe681;</span>' +
                '<span class="catalog-tool catalog-open layui-icon open-file-' + i + '" onclick="">&#xe655;</span>';
            var catalogChild = '<dd><a href="javascript:;" data-name="' + child.catalogName + '" data-resource="' + child.catalogResource + '"><span>' + child.catalogName + '</span>' + catalogEditorChild + '</a></dd>';
            str += catalogChild;
        }
        var catalog = '<li class="layui-nav-item"><a href="javascript:;" data-name="' + parent.catalogName + '"><span>' + parent.catalogName + '</span>' + catalogEditor + '</a><dl class="layui-nav-child">' + str + '</dl></li>';
        console.log(catalog);
        $(".catalog-nav").append(catalog);
    }
    end = i;
    console.log(course);
    console.log(start);
    console.log(end);
    for (i = start; i <= end; i++) {
        console.log(i);
        uploadFile();
    }
    renderNav();
}

function previewVideo(target) {
    console.log($(target).parent('a'));
    console.log(this);
    var resource = $(target).parent('a').attr('data-resource');
    if(resource === undefined || resource === null || resource == 'null'){
        layer.msg('该目录没有视频哦！请上传。', {icon: 4});
        return;
    }
    if (resource !== undefined) {
        layer.open({
            type: 2,
            title: false,
            area: ['630px', '360px'],
            shade: 0.8,
            closeBtn: 0,
            shadeClose: true,
            content: resource
        });
    }
}