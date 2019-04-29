
$(function(){
    open();
});

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
    ueInput.setContext("");
}

function onMessage(msg) {
    msg = msg.data
    msg = JSON.parse(msg);
    console.log(msg);
    if(msg.sendUser == undefined){

    } else {
        var text = '<div class="receive-text">' +
            '<img class="receive-head-img" src="'+ msg.sendUser.userIcon +'">' +
            '<div class="receive-content-text">'+ msg.content +'</div>' +
            '</div>'
        $('.chat-content').append(text).scrollTop(9999999);
    }
}


function open() {
    if (typeof(sid) != "undefined") {
        webSocket = new WebSocket("ws://localhost:8080/web/socket/" + cid + "/" + sid);
        $('.chat-send').click(function () {
            send();
        });
        webSocket.onmessage = onMessage;
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
