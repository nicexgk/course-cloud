


$(document).ready(function () {
    layui.use('element', function () {
        var element = layui.element;
        //事件监听
        element.on('nav(test)', function (elem) {
            console.log(elem); //得到当前点击的DOM对象
        });
    });
    var contain_left = window.screen.height;
    var left = document.getElementById("contain_left");
    left.style.height = (contain_left-190)+"px";
});
