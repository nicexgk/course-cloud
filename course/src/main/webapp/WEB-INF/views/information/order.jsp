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
                <c:forEach items="${requestScope.orderList}" var="order">
                    <div class="flex-list-item">
                        <div class="flex-row head">
                            <div class="time">
                                <span>${order.orderDate}</span>
                            </div>
                        </div>
                        <div class="flex-row content">
                            <div class="flex-cell first cover item-block">
                                <a href="" class="link js-report-link" target="_blank">
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
                                        <span class="black">等待支付</span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="flex-cell operating item-block">
                                <c:if test="${order.orderCommentary == 0 && order.orderStatus == 1}">
                                    <a href="" class="link-block" target="_blank">评价课程</a>
                                </c:if>
                                <c:if test="${order.orderStatus == 1}">
                                    <a href="javascript:void(0);" class="link-block">取消报名</a>
                                </c:if>
                                <c:if test="${order.orderStatus == 0}">
                                    <a href="javascript:void(0);" class="link-block">取消订单</a>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </main>
    </section>
</div>
</body>
</html>