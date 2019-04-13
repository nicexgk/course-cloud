<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>课程列表</title>
    <link rel="stylesheet" type="text/css" href="/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="/css/list.css">
    <link rel="stylesheet" type="text/css" href="/css/mycss/course-list.css">
    <link rel="stylesheet" type="text/css" href="/css/mycss/home-page.css"/>
    <script src="/js/jquery.js"></script>
    <script src="/js/jquery.js"></script>
</head>
<body>

<div>
    <jsp:include page="/WEB-INF/views/common/header.jsp" flush="true"></jsp:include>
</div>

<div class="content">
    <div class="content-course">
        <div class="cont-left">
            <div class="map">
                <a href="/course/page/0/20">全部课程</a>
                <c:forEach items="${requestScope.routeList}" var="courseType">
                    &nbsp;&gt; &nbsp;<a href="/course/page/${courseType.typeId}/0/20">${courseType.typeName}</a>
                </c:forEach>
                <%--<a href="#"> IT · 互联网 </a>&nbsp;&gt;--%>
            </div>
            <div class="guide-wrap">
                <div class="guide">
                    <div class="guide-left">
                        <h3>学习方向</h3>
                    </div>
                    <div class="guide-right" id="parenttype">
                        <c:if test="${requestScope.pojo.type == -1 || requestScope.parentType == null}">
                            <a href="/course/page/0/20" class="nav-bg">全部</a>
                        </c:if>
                        <c:if test="${requestScope.pojo.type != -1 && requestScope.parentType != null}">
                            <a href="/course/page/${requestScope.parentType.typeId}/0/20" class="nav-bg">全部</a>
                        </c:if>
                        <c:forEach items="${requestScope.studyList}" var="courseType">
                            <a href="/course/page/${courseType.typeId}/0/20">${courseType.typeName}</a>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <%--<div class="order">--%>
                <%--<ul>--%>
                    <%--<li class="order-bg"><a href="#">综合排序</a></li>--%>
                    <%--<li><a href="#">最新</a></li>--%>
                    <%--<li><a href="#">评分</a></li>--%>
                    <%--<li>--%>
                        <%--<a href="#">价格</a>--%>
                        <%--<img src="/img/order.png" alt="">--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="#" id="pri">价格区间</a>--%>
                        <%--<img src="/img/bb.png" alt="">--%>
                        <%--<ol class="price">--%>
                            <%--<dl><a href="#">不限</a></dl>--%>
                            <%--<dl><a href="#">￥1-99</a></dl>--%>
                            <%--<dl><a href="#">￥1-99</a></dl>--%>
                            <%--<dl><a href="#">￥1-99</a></dl>--%>
                            <%--<dl><a href="#">￥1-99</a></dl>--%>
                        <%--</ol>--%>
                    <%--</li>--%>
                    <%--<li data-state="0">--%>
                        <%--<input type="checkbox" class="c-box">只看免费公开课--%>
                    <%--</li>--%>
                    <%--<li data-state="0">--%>
                        <%--<input type="checkbox" class="c-box">只看认证课程--%>
                    <%--</li>--%>
                <%--</ul>--%>
                <%--<div class="state">--%>
                <%--</div>--%>
            <%--</div>--%>

            <!-------------课程列表 start ---------->
            <div class="card-group course-content-list">
                <ul class="card-ul-list">
                    <c:forEach items="${requestScope.courseList}" var="course">
                        <li class="card-li-item">
                            <a class="item-img-link" href="/course/page/${course.courseId}" target="_blank"><img class="item-inline-img" src="${course.picUrl}"></a>
                            <div class="item-status-going"><span>nice nice nice</span></div>
                            <h4 class="item-title"><a href="/course/page/${course.courseId}" target="_blank">${course.courseName}</a></h4>
                            <div class="item-card-parson item-card">
                                <span class="item-inline-date">${fn:substring(course.courseDate, 0, 10)}</span>
                                <a href="" target="_blank"><span class="item-inline-teacher">${course.courseTeacher.userName}</span></a>
                            </div>
                            <c:if test="${course.coursePrice eq 0}">
                                <div class="item-card-price item-card"><span>免费</span></div>
                            </c:if>
                            <c:if test="${course.coursePrice != 0}">
                                <div class="item-card-price item-card"><span>￥${course.coursePrice}</span></div>
                            </c:if>
                        </li>
                    </c:forEach>

                    <%--<li class="card-li-item">--%>
                    <%--<a class="item-img-link" target="_blank"><img class="item-inline-img" src="/img/6.jpg"></a>--%>
                    <%--<div class="item-status-going"><span>nice nice nice</span></div>--%>
                    <%--<h4 class="item-title"><a>PHP开发入门基础/web前端/MySQL/模板引擎/框架</a></h4>--%>
                    <%--<div class="item-card-parson item-card">--%>
                    <%--<span class="item-inline-date">2018-15-15</span>--%>
                    <%--<span class="item-inline-teacher">nice nice nice</span>--%>
                    <%--</div>--%>
                    <%--<div class="item-card-price item-card"><span>免费</span></div>--%>
                    <%--</li>--%>

                </ul>

            </div>
            <!-------------课程列表 end ------------>
        </div>


        <!-- 右边热门推荐卡片组 -->
        <div class="cont-right">
            <div class="hot">
                <h3>热门推荐</h3>
            </div>
            <div class="course-card">
                <div class="course-img">
                    <img src="../../img/course1.png" alt="">
                    <div class="course-info">随到随学（共59节）</div>
                    <div class="course-name">
                        <a href="#">PHP开发入门基础/web前端/MySQL/模板引擎/框架</a>
                    </div>
                    <div class="author">
                        <span>免费</span>
                        <a href="#">马哥教育</a>
                    </div>
                </div>
            </div>
            <div class="course-card">
                <div class="course-img">
                    <img src="../../img/course1.png" alt="">
                    <div class="course-info">随到随学（共59节）</div>
                    <div class="course-name">
                        <a href="#">PHP开发入门基础/web前端/MySQL/模板引擎/框架</a>
                    </div>
                    <div class="author">
                        <span>免费</span>
                        <a href="#">马哥教育</a>
                    </div>
                </div>
            </div>
            <div class="course-card">
                <div class="course-img">
                    <img src="../../img/course1.png" alt="">
                    <div class="course-info">随到随学（共59节）</div>
                    <div class="course-name">
                        <a href="#">PHP开发入门基础/web前端/MySQL/模板引擎/框架</a>
                    </div>
                    <div class="author">
                        <span>免费</span>
                        <a href="#">马哥教育</a>
                    </div>
                </div>
            </div>
            <div class="course-card">
                <div class="course-img">
                    <img src="../../img/course1.png" alt="">
                    <div class="course-info">随到随学（共59节）</div>
                    <div class="course-name">
                        <a href="#">PHP开发入门基础/web前端/MySQL/模板引擎/框架</a>
                    </div>
                    <div class="author">
                        <span>免费</span>
                        <a href="#">马哥教育</a>
                    </div>
                </div>
            </div>
            <div class="course-card">
                <div class="course-img">
                    <img src="../../img/course1.png" alt="">
                    <div class="course-info">随到随学（共59节）</div>
                    <div class="course-name">
                        <a href="#">PHP开发入门基础/web前端/MySQL/模板引擎/框架</a>
                    </div>
                    <div class="author">
                        <span>免费</span>
                        <a href="#">马哥教育</a>
                    </div>
                </div>
            </div>
            <div class="course-card">
                <div class="course-img">
                    <img src="../../img/course1.png" alt="">
                    <div class="course-info">随到随学（共59节）</div>
                    <div class="course-name">
                        <a href="#">PHP开发入门基础/web前端/MySQL/模板引擎/框架</a>
                    </div>
                    <div class="author">
                        <span>免费</span>
                        <a href="#">马哥教育</a>
                    </div>
                </div>
            </div>
            <div class="course-card">
                <div class="course-img">
                    <img src="../../img/course1.png" alt="">
                    <div class="course-info">随到随学（共59节）</div>
                    <div class="course-name">
                        <a href="#">PHP开发入门基础/web前端/MySQL/模板引擎/框架</a>
                    </div>
                    <div class="author">
                        <span>免费</span>
                        <a href="#">马哥教育</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- 猜你喜欢 -->


    </div>
    <div style="margin: 0 auto;width: 1200px;">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
            <legend></legend>
        </fieldset>
        <div id="demo5"></div>
    </div>
</div>

<div class="footer">
    <div class="footer-content">
        <p><img src="../../img/logo-min.png"></p>
        <p>Copyright © 2017 Tencent. All Rights Reserved.</p>
        <p>深圳市腾讯计算机系统有限公司 版权所有 | 腾讯课堂服务协议 | 站点地图</p>
    </div>
</div>
<script>

    var size = ${requestScope.pojo.size};
    var type = ${requestScope.pojo.type};
    layui.use(['laypage', 'layer'], function () {
        var laypage = layui.laypage
            , layer = layui.layer;
        //开启HASH
        console.log(${requestScope.pojo.count});
        laypage.render({
            elem: 'demo5'
            , count: ${requestScope.pojo.count} / 2
            , curr: ${requestScope.pojo.page + 1} //获取hash值为fenye的当前页
        });

    });
    var recodePage = $(".layui-laypage-prev").attr("data-page");
    console.log(parseInt(recodePage));


    window.onload = function () {
        $("#demo5>div>a").each(function (i) {
            console.log(this);
            var target = $(this);
            var page = target.attr("data-page");
            page = parseInt(page) - 1;
            if (type == -1) {
                target.attr("href", "/course/page/" + page + "/" + size);
            } else {
                target.attr("href", "/course/page/" + type + "/" + page + "/" + size);
            }
        });
    }

</script>
</body>
</html>