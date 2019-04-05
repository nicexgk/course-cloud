<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/17
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>全部订单</title>
    <jsp:include page="common/head.jsp"/>
</head>
<body class="l-aside-left l-min">
<div id="index_87d1ccfce071f024bf1348bcfed03a9b"></div>
<!-- header -->
<jsp:include page="common/header.jsp"/>

<div id="react-body">
    <section class="inner-center clearfix">
        <aside class="aside-left">
            <div class="l-nav-area">
                <ul class="l-nav">
                    <li class="l-nav-item"><a title="课程表" href="courses">课程表</a></li>
                    <li class="l-nav-item"><a title="全部订单" href="orders" class="active" aria-current="page">全部订单</a></li>
                    <li class="l-nav-item"><a title="收藏" href="collections">收藏</a></li>
                    <li class="l-nav-item"><a title="个人信息" href="information">个人信息</a></li>
                </ul>
            </div>
        </aside>
        <main class="main">
            <div class="wrapper-plan"><h1 class="wrapper-tt">全部订单</h1>
            </div>

            <!-- 订单列表区 -->

        </main>
    </section>
    <!-- footer -->
    <jsp:include page="common/footer.jsp"/>
</div>
</body>
</html>
