var dialogInstace, onMoveStartId, mousePos = {x: 0, y: 0};

// 根据元素的id获取元素
function g(id) {
    return document.getElementById(id);
}

// 元素居中
function autoCenter(el) {
    var bodyW = document.documentElement.clientWidth;
    var bodyH = document.documentElement.clientHeight;
    var elW = el.offsetWidth;
    var elH = el.offsetHeight;
    el.style.left = (bodyW - elW) / 2 + 'px';
    el.style.top = (bodyH - elH) / 2 + 'px';
}

// 设置元素填充整个页面大小
function fillToBody(el) {
    el.style.width = document.documentElement.clientWidth + 'px';
    el.style.height = document.documentElement.clientHeight + 'px';
}

// 设置弹出框的样式方法
function Dialog(dragId, moveId) {
    var instace = {};
    instace.dragElement = g(dragId);
    instace.moveElement = g(moveId);
    instace.mouseOffsetLeft = 0;
    instace.mouseOffsetTop = 0;
    instace.dragElement.addEventListener('mousedown', function (e) {
        var e = e || window.event;
        dialogInstace = instace;
        instace.mouseOffsetLeft = e.pageX - instace.moveElement.offsetLeft;
        instace.mouseOffsetTop = e.pageY - instace.moveElement.offsetTop;
        onMoveStartId = setInterval(onMoveStart, 10);
        return false;
    });
    return instace;
}

document.onmouseup = function (e) {
    dialogInstace = false;
    clearInterval(onMoveStartId);
}

document.onmousemove = function (e) {
    var e = window.event || e;
    mousePos.x = e.clientX;
    mousePos.y = e.clientY;
    e.stopPropagation && e.stopPropagation();
    e.cancelBubble = true;
    e = this.originalEvent;
    e && (e.preventDefault ? e.preventDefault() : e.returnValue = false);
    document.body.style.MozUserSelect = 'none';
}

function onMoveStart() {
    var instace = dialogInstace;
    if (instace) {
        var maxX = document.documentElement.clientWidth - instace.moveElement.offsetWidth;
        var maxY = document.documentElement.clientHeight - instace.moveElement.offsetHeight;
        instace.moveElement.style.left = Math.min(Math.max((mousePos.x - instace.mouseOffsetLeft), 0), maxX) + "px";
        instace.moveElement.style.top = Math.min(Math.max((mousePos.y - instace.mouseOffsetTop), 0), maxY) + "px";
    }
}

// 隐藏登录框
function hideDialog() {
    g('dialogMove').style.display = 'none';
    g('mask').style.display = 'none';
}

// 显示登录框
function showDialog() {
    g('dialogMove').style.display = 'block';
    g('mask').style.display = 'block';
    autoCenter(g('dialogMove'));
    fillToBody(g('mask'));
}

//window.onresize = showDialog;
//showDialog();

function updateHidden(hiddentrue, hiddenfalse) {
    document.getElementById(hiddentrue).style.display = 'block';
    document.getElementById(hiddenfalse).style.display = 'none';
}


// ============== 从后端获取数据 ================//

// 登录成功操作
function loginSuccess(data){
    $("#js_logout_outer").css("display", "none");
    $("#js_logout_inter").css("display", "block");
    $(".mod-header__user-avatar").attr("src", data.user_icon);
    $(".js-username").attr("title", data.user_name).html(data.user_name);
    hideDialog();
}

// 退登操作
function loginOuter(){
    $.getJSON(
        "user/login/outer"
        ,function(data){
            console.log(data);
            if (data.status == 1) {
                $("#js_logout_inter").css("display", "none");
                $("#js_logout_outer").css("display", "block");
            }
             else {
                console.log("login outer final");
            }
        }
    )
}
// 登录操作
function login() {
    var account = $(".ui-dialog-input-username").val();
    var pwd = $(".ui-dialog-input-password").val();
    console.log(account);
    console.log(pwd);
    $.getJSON(
        "/user/login/inter"
        ,{account: account , pwd: pwd}
        ,function(data){
            console.log(data);
            if(data.user_id == undefined){
                console.log("incorrect user or password ")
            } else {
                loginSuccess(data);
            }
        }
    )

}