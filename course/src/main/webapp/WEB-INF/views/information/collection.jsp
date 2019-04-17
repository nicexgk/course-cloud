<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                    <li class="l-nav-item"><a title="全部订单" href="/order.html">全部订单</a></li>
                    <li class="l-nav-item"><a title="收藏" href="/collection.html" class="active">收藏列表</a></li>
                    <li class="l-nav-item"><a title="个人信息" href="/userinfo.html">个人信息</a></li>
                </ul>
            </div>
        </aside>
        <main class="main main-container">
            <div class="im-table-wrap">
                <table class="im-table">
                    <thead>
                    <tr>
                        <th style="width: 70%;">课程信息</th>
                        <th style="width: 16%;">金额</th>
                        <th style="width: 14%;">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${requestScope.collects}" var="collect">
                        <tr>
                            <td>
                                <div class="fav-info clearfix">
                                    <a class="fav-info-cover" href="/course/page/${collect.collectCourse.courseId}" target="_blank">
                                        <img src="${collect.collectCourse.picUrl}" alt="封面">
                                    </a>
                                    <div class="fav-info-desc">
                                        <p class="fav-info-name">
                                            <a class="link-3" href="/course/page/${collect.collectCourse.courseId}" target="_blank">${collect.collectCourse.courseName}</a>
                                        </p>
                                        <a class="fav-info-agency link-3" target="_blank" href="javascript:;">${collect.collectDate}</a>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <c:if test="${collect.collectCourse.coursePrice == 0}">
                                    <div class="fav-price">免费</div>
                                </c:if>
                                <c:if test="${collect.collectCourse.coursePrice != 0}">
                                    <div class="fav-price">￥${collect.collectCourse.coursePrice}</div>
                                </c:if>
                            </td>
                            <td><span class="link-3">取消收藏</span></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </main>
    </section>
</div>
</body>
</html>