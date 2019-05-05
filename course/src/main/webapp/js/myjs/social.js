
$(function(){
    open();
});
function divScroll(target){
    //页面上卷的高度
    var scrollTop=target.scrollTop;
    var wholeHeight=target.scrollHeight;//页面底部到顶部的距离
    var divHeight=target.clientHeight;//页面可视区域的高度
    if(scrollTop== 0){
        console.log("get history");
        getHistory();
    }
}

var chatPage = 0;
var chatSize = 20;
var done = false;
function send() {
    var str = ueInput.getContent();
    console.log(str);
    var msg = {};
    msg.ope = 0;
    msg.msg = str;
    var jsonMsg = JSON.stringify(msg);
    webSocket.send(jsonMsg);
    var text = '<div class="send-text">' +
        '<img class="send-head-img" src="'+ $('.mod-header__user-avatar').attr('src') +'">' +
        '<div class="send-content-text">'+ str +'</div>' +
        '</div>';
    $('.chat-content').append(text).scrollTop(9999999);
    ueInput.setContent("");
}

function getHistory(){
    if(!done){
        var msg = {};
        msg.ope = 1;
        msg.page = chatPage ++;
        msg.size = chatSize;
        var jsonMsg = JSON.stringify(msg);
        webSocket.send(jsonMsg);
    } else {
        layui.use("layer", function(){
            layui.layer.msg("已经没有更多的聊天信息了")
        })
    }
}
function onMessage(msg) {
    msg = msg.data
    msg = JSON.parse(msg);
    console.log(msg);
    if(msg.sendUser == undefined){
        if(msg.count < chatPage * chatSize){
            done = true;
        }
        var text = ""
        for(var i in msg.resource){
            var chat = msg.resource[i];
            if(chat.sendUser.userId == sid){
               text = '<div class="send-text">' +
                    '<img class="send-head-img" src="'+ $('.mod-header__user-avatar').attr('src') +'">' +
                    '<div class="send-content-text">'+ chat.content +'</div>' +
                    '</div>' + text;
            } else {
                text = '<div class="receive-text">' +
                    '<img class="receive-head-img" src="'+ chat.sendUser.userIcon +'">' +
                    '<div class="receive-content-text">'+ chat.content +'</div>' +
                    '</div>' + text;
            }
        }
        $('.chat-content').prepend(text).scrollTop(200);
    } else {
        var text = '<div class="receive-text">' +
            '<img class="receive-head-img" src="'+ msg.sendUser.userIcon +'">' +
            '<div class="receive-content-text">'+ msg.content +'</div>' +
            '</div>'
        $('.chat-content').append(text).scrollTop(9999999);
    }
}

function onOpen(){
    getHistory();
}

function open() {
    if (typeof(sid) != "undefined") {
        webSocket = new WebSocket("ws://localhost:8080/web/socket/" + cid + "/" + sid);
        $('.chat-send').click(function () {
            send();
        });
        webSocket.onmessage = onMessage;
        webSocket.onopen = onOpen;
    } else {
        webSocket = new WebSocket("ws://localhost:8080/web/socket/" + cid + "/" + -1);
        $('.chat-send').click(function () {
            layui.use('element', function () {
                layui.layer.msg("请先登录！", {icon: 5});
            });
        });
    }
}

// function
