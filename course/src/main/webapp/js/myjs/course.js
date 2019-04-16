var ue;
var ueInput;
$(function () {
    ue = UE.getEditor("ue-editor");
    ue.ready(function () {
        ue.setDisabled();
    });

    ueInput = UE.getEditor("chat-ue-editor-input",
        {
            toolbars: [
                [
                    'bold', //加粗
                    'fontborder', //字符边框
                    'time', //时间
                    'date', //日期
                    'insertcode', //代码语言
                    'fontfamily', //字体
                    'fontsize', //字号
                    'emotion', //表情
                    'spechars', //特殊字符
                    'map', //Baidu地图
                    'gmap', //Google地图
                    'forecolor', //字体颜色
                    'backcolor', //背景色
                    'insertorderedlist', //有序列表
                    'insertunorderedlist', //无序列表
                    'edittip ', //编辑提示
                    'background', //背景
                    'template', //模板
                    'scrawl', //涂鸦
                ]
            ]
        });

})


function previewVideo(target) {
    var resource = $(target).parent().attr("data-resource");
    $(".header-video").attr('src', resource)[0].play();

}

function downloadVideo(target) {
    var resource = $(target).parent().attr("data-resource");
    window.open("/download/path=" + resource);
}

var sendDiv = '<div class="receive-text">' +
    '<img class="receive-head-img" src="">' +
    '<div class="receive-content-text"></div>' +
    '</div>';


var receiveDiv = '<div class="send-text">' +
    '<img class="send-head-img" src="">' +
    '<div class="send-content-text"></div>' +
    '</div>';


var webSocket;

function send() {

    if (typeof(WebSocket) == "undefine") {
        console.log("你的浏览器不支持webSocket通信");
    } else {
        webSocket = new WebSocket("/social/4/4");

    }
    webSocket.onmessage = function (data) {
        console.log(data);
    }
}

function onTrade(target) {
    var courseId = $(target).attr("data-course");
    $.ajax({
        url: "/order/trade/" + courseId,
        type: "get",
        success: function (res) {
            console.log(res);
            layui.use("layer", function () {
                var layer = layui.layer;
                if (res.status == 200) {
                    layer.msg("报名成功！", {icon: 1});
                    $(target).val("以报名").attr("disabled", true).attr("class", "btn-disabled");
                    // location.reload(true);
                } else if (res.status == 300) {
                    layer.msg("请先支付！", {icon: 3});
                    $(".header-video").html(res.resource);
                    showTrade(res.resource);

                } else {
                    layer.msg("出错啦！请重试,,,", {icon: 2});
                }
            });
        }
    });
}


function showTrade(data) {
    layer.open({
        type: 2,
        title: false,
        closeBtn: 0, //不显示关闭按钮
        shade: [0],
        // area: ['340px', '215px'],
        offset: 'rb', //右下角弹出
        time: 2000, //2秒后自动关闭
        anim: 2,
        content: [data, 'no'], //iframe的url，no代表不显示滚动条
        end: function () { //此处用于演示
            layer.open({
                type: 2,
                title: '很多时候，我们想最大化看，比如像这个页面。',
                shadeClose: true,
                shade: false,
                maxmin: true, //开启最大化最小化按钮
                area: ['893px', '600px'],
                content: data
            });
        }
    });
}

function collection(target) {
    var cid = $(target).attr("data-course");
    var isCollect = $(target).attr("data-collect");
    if (isCollect == "0") {
        collectOperation(cid, "post");
        $(target).attr("data-collect", "1")
    } else {
        collectOperation(cid, "delete");
        $(target).attr("data-collect", "0")
    }
}

function collectOperation(cid, type) {
    $.ajax({
        url: "/collection/" + cid,
        type: type,
        data: {cid: cid},
        success: function (res) {
            layui.use("layer", function () {
                var layer = layui.layer;
                if (res.status == 200) {
                    if (type == "post") {
                        layer.msg(res.description, {icon: 1});
                        $(".collection-icon").css("color", "red")
                    } else {
                        layer.msg(res.description, {icon: 7});
                        $(".collection-icon").css("color", "#999")
                    }
                } else {
                    layer.msg(res.description, {icon: 5});
                    if (type == "put") {
                        $(".collection-icon").css("color", "#999")
                    } else {
                        $(".collection-icon").css("color", "red")
                    }
                }
            });
        }
    });
}
