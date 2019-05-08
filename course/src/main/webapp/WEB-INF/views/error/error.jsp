<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>错误</title>
    <link rel="stylesheet" type="text/css" href="/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="/css/mycss/home-page.css"/>
    <script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript" src="/js/bootstrap-popover.js"></script>
    <script type="text/javascript" src="/js/myjs/blanner.js"></script>
</head>
<body class="l-aside-left l-min">
<!------------------------------ header start --------------------------------------->
<div>
    <jsp:include page="/WEB-INF/views/common/header.jsp" flush="true"></jsp:include>
</div>

<div id="react-body">
    <section class="inner-center clearfix">
        <main class="main">
            <div class="wrapper-plan"><h1 class="wrapper-tt">出错啦！！！</h1></div>
            <div class="wrapper-plan"><h1 class="wrapper-tt">出错信息为：${requestScope.error}</h1></div>
        </main>
    </section>
    <!-- footer -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</div>

</body>
</html>
