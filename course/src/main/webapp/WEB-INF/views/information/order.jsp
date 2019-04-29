<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>个人信息</title>
    <link rel="stylesheet" type="text/css" href="/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="/css/mycss/home-page.css"/>
    <link rel="stylesheet" type="text/css" href="/css/mycss/informataion.css">

    <script href="/js/jquery.js"></script>
    <script href="/layui/layui.js"></script>
</head>
<body class="l-aside-left l-min">

<div>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
</div>

<div id="react-body">
    <section class="inner-center clearfix">
        <aside class="aside-left">
            <div class="l-nav-area">
                <ul class="l-nav">
                    <li class="l-nav-item"><a title="课程表" href="/studentcourse.html">课程表</a></li>
                    <li class="l-nav-item"><a title="全部订单" href="/order.html" class="active">全部订单</a></li>
                    <li class="l-nav-item"><a title="收藏" href="/collection.html">收藏列表</a></li>
                    <li class="l-nav-item"><a title="个人信息" href="/userinfo.html">个人信息</a></li>
                </ul>
            </div>
        </aside>
        <main class="main main-container">
            <div class="flex-list">
                <div class="flex-list-header clear-fix">
                    <div class="flex-row">
                        <div class="flex-cell first">课程订单</div>
                        <div class="flex-cell">价格</div>
                        <div class="flex-cell">状态</div>
                        <div class="flex-cell">操作</div>
                    </div>
                </div>
                <div class="order-body clear-fix">
                    <c:forEach items="${requestScope.orderList}" var="order">
                        <div class="flex-list-item">
                            <div class="flex-row head">
                                <div class="time">
                                    <span>${order.orderDate}</span>
                                </div>
                            </div>
                            <div class="flex-row content">
                                <div class="flex-cell first cover item-block">
                                    <a href="/course/page/${order.orderCourse.courseId}" class="link js-report-link" target="_blank">
                                        <img src="${order.orderCourse.picUrl}" alt="课程封面">
                                        <div class="title">
                                            <span title="${order.orderCourse.courseName}">${order.orderCourse.courseName}</span>
                                        </div>
                                    </a>
                                </div>
                                <c:if test="${order.orderCourse.coursePrice <= 0}">
                                    <div class="flex-cell price item-block">免费</div>
                                </c:if>
                                <c:if test="${order.orderCourse.coursePrice > 0}">
                                    <div class="flex-cell price item-block">${order.orderCourse.coursePrice}</div>
                                </c:if>
                                <div class="flex-cell wording item-block">
                                    <c:choose>
                                        <c:when test="${order.orderStatus == 1}">
                                            <span class="black">报名成功</span>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="/alipay/trade/page/${order.orderOn}" target="_blank"><span class="black">等待支付</span></a>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="flex-cell operating item-block">
                                    <c:if test="${order.orderCommentary == 0 && order.orderStatus == 1}">
                                        <a href="/commentary/${order.orderCourse.courseId}" class="link-block" target="_blank">评价课程</a>
                                    </c:if>
                                    <c:if test="${order.orderStatus == 1}">
                                        <a href="javascript:void(0);" onclick="cancelCourse(this)" data-cid="${order.orderCourse.courseId}" class="link-block">取消课程</a>
                                    </c:if>
                                    <c:if test="${order.orderStatus == 0}">
                                        <a href="javascript:void(0);" onclick="cancelOrder(this)" data-oid="${order.orderId}" class="link-block">取消订单</a>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="flex-list-header clear-fix" style="margin: 0 auto;width: 1200px;">
                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
                        <legend></legend>
                    </fieldset>
                    <div id="page"></div>
                </div>
            </div>
        </main>
    </section>
</div>
</body>
<script>

    function cancelCourse(target){
        var cid = $(target).attr("data-cid");
        $.ajax({
            url: "/student/course/" + cid,
            type: "delete",
            success: function(res){
                layui.use('element', function(){
                    var layer = layui.layer;
                    if(res.status == 200){
                        layer.msg("取消课程成功", {icon: 1});
                        $(target).parent().parent().parent().remove();
                    } else {
                        layer.msg("服务正忙，请重试。。。", {icon: 5});
                    }
                });
            }
        })
    }

    function cancelOrder(target){
        var oid = $(target).attr("data-oid");
        $.ajax({
            url: "/order/" + oid,
            type: "delete",
            success: function(res){
                layui.use('element', function(){
                    var layer = layui.layer;
                    if(res.status == 200){
                        layer.msg("取消订单成功", {icon: 1});
                        $(target).parent().parent().parent().remove();
                    } else {
                        layer.msg("服务正忙，请重试。。。", {icon: 5});
                    }
                });
            }
        })
    }

    function pagingFull(data) {
        var content = "";
        for (var i in data) {
            var order = data[i];
            var price = '免费';
            var cancel = '';
            var commentary = '';
            var cancelOrder = '';
            var wartTrade = '<a href="/alipay/trade/page/' + order.orderOn + '" target="_blank"><span class="black">等待支付</span></a>';

            if(order.orderCourse.coursePrice != 0){
                price = '￥' + order.orderCourse.coursePrice;
            }
            if(order.orderStatus == 1){
                wartTrade = '<span class="black">报名成功</span>'
            }
            if (order.orderCommentary == 0 && order.orderStatus == 1){
                commentary = '<a href="/commentary/' + order.orderCourse.courseId + '" class="link-block" target="_blank">评价课程</a>';
            }
            if (order.orderStatus == 1){
                cancel = '<a href="javascript:void(0);" onclick="cancelCourse(this)" data-cid="' + order.orderCourse.courseId + '" class="link-block">取消课程</a>';
            }
            if(order.orderStatus == 0){
                cancelOrder = '<a href="javascript:void(0);" onclick="cancelOrder(this)" data-oid="'+ order.orderId + '" class="link-block">取消订单</a>';
            }

            var str = '<div class="flex-list-item">' +
                '<div class="flex-row head">' +
                '<div class="time">' +
                '<span>'+ order.orderDate +'</span>' +
                '</div>' +
                '</div>' +
                '<div class="flex-row content">' +
                '<div class="flex-cell first cover item-block">' +
                '<a href="" class="link js-report-link" target="_blank">' +
                '<img src="'+ order.orderCourse.picUrl + '" alt="课程封面">' +
                '<div class="title">' +
                '<span title="'+ order.orderCourse.courseName + '">'+ order.orderCourse.courseName+ '</span>' +
                '</div>' +
                '</a>' +
                '</div>' +
                '<div class="flex-cell price item-block">'+ price +'</div>' +
                '<div class="flex-cell wording item-block">' +
                wartTrade +
                '</div>' +
                '<div class="flex-cell operating item-block">' +
                commentary +
                cancel +
                cancelOrder +
                '</div>' +
                '</div>' +
                '</div>';
            content += str;
        }
        $(".order-body").html(content);
    }

    function pageSplit(target) {
        console.log("nice nice nice");
        var page = $(target).attr("data-page") - 1;
        $.getJSON("/order/" + page + "/" + size, function (data) {
            console.log(data);
            layui.use(['laypage', 'layer'], function () {
                var laypage = layui.laypage;
                laypage.render({
                    elem: 'page'
                    , count: data.count
                    //获取hash值为fenye的当前页
                    , curr: data.page + 1
                });
            });

            pagingFull(data.resource);
            $("#page>div>a").each(function (i) {
                $(this).attr("onclick", "pageSplit(this)")
            });
        });
    }

    function nice() {
        console.log("nice nice ncie");
    }

</script>
<script>
    var size = ${requestScope.pojo.size};
    var type = ${requestScope.pojo.type};

    layui.use(['laypage', 'layer'], function () {
        var laypage = layui.laypage;
        laypage.render({
            elem: 'page'
            , count: ${requestScope.pojo.count}
            //获取hash值为fenye的当前页
            , curr: ${requestScope.pojo.page + 1}
        });
    });

    window.onload = function () {
        $("#page>div>a").each(function (i) {
            $(this).attr("onclick", "pageSplit(this)")
        });
    }
</script>
</html>
