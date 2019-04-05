
var t;
var index = 0;
// 自动播放定时器
t = setInterval(play, 3000);

// 当文档加载完成是给小按钮添加事件
$(document).ready(function(){
    // 添加获得鼠事件
    $("#js-big-banner li").mouseover(function () {
        var target = $("#js-big-banner li");
        console.log("nice nice nice nice");
        for (var i = 0; i < 7; i ++){
            if(target.eq(i)[0] == this){
                $("#js_sliderbox li").eq(index).css("display", "none");
                $("#js-big-banner li").eq(index).attr("class", "mod-big-banner_status");
                $("#js_sliderbox li").eq(i).css("display", "block");
                $("#js-big-banner li").eq(i).attr("class", "mod-big-banner_status  current");
                index = i;
                clearInterval(t);
                t = setInterval(play, 3000);
            }
        }
    });
    // 添加点击事件
    $("#js-big-banner li").click(function () {
        var target = $("#js-big-banner li");
        console.log("nice nice nice nice");
        for (var i = 0; i < 7; i ++){
            if(target.eq(i)[0] == this){
                $("#js_sliderbox li").eq(index).css("display", "none");
                $("#js-big-banner li").eq(index).attr("class", "mod-big-banner_status");
                $("#js_sliderbox li").eq(i).css("display", "block");
                $("#js-big-banner li").eq(i).attr("class", "mod-big-banner_status  current");
                index = i;
                clearInterval(t);
                t = setInterval(play, 3000);
            }
        }
    });
});

// 轮播函数
function play() {
    //console.log($("#js_sliderbox li"));
    $("#js_sliderbox li").eq(index).css("display", "none");
    $("#js-big-banner li").eq(index).attr("class", "mod-big-banner_status");
    index++;
    if (index > 6) {
        index = 0
    }

    $("#js_sliderbox li").eq(index).css("display", "block");
    $("#js-big-banner li").eq(index).attr("class", "mod-big-banner_status  current");
};


