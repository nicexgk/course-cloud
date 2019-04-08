
$(document).ready(function(){
    layui.use(['element', 'layer'], function () {
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
        var layer = layui.layer;
        //监听导航点击
        element.on('nav(nav)', function (elem) {
            console.log(elem);
            layer.msg(elem.text());
            var url = elem.attr('data-source');
            console.log(url);
            if (url != undefined){
                loadContain(url);
            }
        });
    });
});


function loadContain(url){
    $.get(url , function (data) {
        $(".page-contain").html(data);
    });
}