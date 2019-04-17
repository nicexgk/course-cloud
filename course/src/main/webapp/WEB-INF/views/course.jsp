<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>课程详情</title>
    <link rel="stylesheet" href="/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="/css/mycss/home-page.css"/>
    <link rel="stylesheet" href="/css/course.css">

    <script src="/js/jquery.js"></script>
    <script src="/layui/layui.js"></script>
    <script src="/ueditor/ueditor.config_1.js"></script>
    <script src="/ueditor/ueditor.all.js"></script>
    <script src="/ueditor/ueditor.parse.js"></script>
    <script src="/js/myjs/course.js"></script>
</head>
<body>

<div>
    <jsp:include page="/WEB-INF/views/common/header.jsp" flush="true"></jsp:include>
</div>


<div class="content" style="margin:0 auto; width: 1200px;">

    <div class="content-course">
        <!------类型导航start----->
        <div class="map">
            <a href="#">全部课程</a>
            &gt;
            <a href="#">IT·互联网</a>
            &gt;
            <a href="#">${requestScope.course.courseName}</a>
        </div>
        <!------类型导航 end ----->

        <!---------课程信息描述 start----------->
        <div class="course-information">
            <div class="course-info-left">
                <div class="banner">
                    <c:choose>
                        <c:when test="${requestScope.course.catalogList != null}">
                            <video class="header-video" src="${requestScope.course.catalogList[0].childList[0].catalogResource}" style="width: 600px;height: 340px;" controls="controls"></video>
                        </c:when>
                        <c:otherwise>
                            <video class="header-video" src="" style="width: 600px;height: 340px;" controls="controls"></video>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <div class="course-info-right">
                <h3>${requestScope.course.courseName}</h3>

                <span>报名人数 100</span>
                <span>好评度10%</span>
                <span>
                    <i class="layui-icon collection-icon" data-collect="${requestScope.collect == null ? "0":"1"}" data-course="${requestScope.course.courseId}"
                       onclick="collection(this)" style="color:${requestScope.collect == null ? "#999":"red"};">&#xe600;&nbsp;</i>收藏
                </span>
                <div class="class-info">
                    <label>${requestScope.course.courseName}</label>
                    <p>${requestScope.course.courseDetail}</p>
                </div>
                <div class="price">
                    <c:choose>
                        <c:when test="${requestScope.course.coursePrice eq 0}">
                            免费
                        </c:when>
                        <c:otherwise>
                            ¥ ${requestScope.course.coursePrice}
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="btn-group">
                    <c:choose>
                        <c:when test="${requestScope.studentCourse != null}">
                            <a href="javascript:;"><input type="button" data-course="${requestScope.course.courseId}" class="btn-disabled" value="以报名"></a>
                        </c:when>
                        <c:when test="${requestScope.course.coursePrice eq 0}">
                            <a href="javascript:;"><input type="button" onclick="onTrade(this)" data-course="${requestScope.course.courseId}" class="btn2" value="立即报名"></a>
                        </c:when>
                        <c:otherwise>
                            <a href="javascript:;"><input type="button" onclick="onTrade(this)" data-course="${requestScope.course.courseId}" class="btn2" value="立即购买"></a>
                        </c:otherwise>
                    </c:choose>
                    <c:if test=""></c:if>
                    <ul>
                        <li id="call">
                            <strong>咨询</strong>
                            <dl id="bd"><a href="#">在线</a></dl>
                            <dl><a href="#">电话</a></dl>
                        </li>
                    </ul>
                </div>
            </div>

        </div>
        <!---------课程信息描述 end----------->
    </div>

    <!------------课程信息--------------->
    <div class="over-view-warp" style="min-height: 350px; background: #f4f4f4">
        <div class="layui-tab">
            <ul class="layui-tab-title">
                <li class="layui-this"> 课程简介</li>
                <li>课程目录</li>
                <li>课程评论</li>
                <li>交流平台</li>
            </ul>
            <div class="layui-tab-content">
                <!--------------简介start--------------->
                <div class="layui-tab-item layui-show">
                    <textarea id="ue-editor" data-content="${requestScope.course.description}" style="width: 1200px;"></textarea>
                </div>
                <!--------------简介 end --------------->

                <!--------------目录start--------------->
                <div class="layui-tab-item">
                    <ul class="layui-nav layui-nav-tree layui-inline catalog-nav" lay-filter="catalog" style=" width: 100%;">
                        <c:if test="${requestScope.course != null}">
                            <c:forEach items="${requestScope.course.catalogList}" var="catalog">
                                <li class="layui-nav-item layui-nav-itemed">
                                    <a href="javascript:;" data-nam="${catalog.catalogName}">
                                        <span>${catalog.catalogName}</span>
                                    </a>
                                    <dl class="layui-nav-child">
                                        <c:forEach items="${catalog.childList}" var="child">
                                            <dd><a href="javascript:;" data-resource="${child.catalogResource}" data-name="${child.catalogName}">
                                                <span>${child.catalogName}</span>
                                                <span class="catalog-tool catalog-download layui-icon" onclick="downloadVideo(this)">&#xe601;</span>
                                                <span class="catalog-tool catalog-view layui-icon" onclick="previewVideo(this)">&#xe652;</span>
                                            </a></dd>
                                        </c:forEach>
                                    </dl>
                                </li>
                            </c:forEach>
                        </c:if>
                    </ul>
                </div>
                <!--------------目录 end --------------->

                <!--------------评论start--------------->
                <div class="layui-tab-item">
                    <div class="commentary-contain">
                        <c:forEach items="${requestScope.commentaryList}" var="comment">
                            <div class="comment-item clear-fix">
                                <div class="item-left" style="float: left;">
                                    <img class="user-avatar" src="${comment.commentUser.userIcon}" style="width: 40px;height: 40px;margin-top: 20px">
                                    <p class="user-name">${comment.commentUser.userName}</p>
                                </div>
                                <div class="item-right" style="float: right;width: 1100px;">
                                    <ul class="commentary-rate clear-fix">
                                        <c:forEach begin="1" end="5" varStatus="status">
                                            <li><i class="layui-icon ${comment.commentGrade >= status.count ? "layui-icon-rate-solid" : "layui-icon-rate"}"></i></li>
                                        </c:forEach>
                                    </ul>
                                    <div class="comment-bd">${comment.commentContent}</div>
                                    <div class="comment-ft">
                                        <span class="comment-time">${comment.commentDate}</span>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div style="margin: 0 auto;width: 1200px;">
                        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
                            <legend></legend>
                        </fieldset>
                        <div id="page"></div>
                    </div>
                </div>
                <!--------------评论 end --------------->

                <!--------------交流start--------------->
                <div class="layui-tab-item chat-container">
                    <div class="chat-content">
                        <div class="receive-text">
                            <img class="receive-head-img" src="">
                            <div class="receive-content-text"></div>
                        </div>
                        <div class="send-text">
                            <img class="send-head-img" src="">
                            <div class="send-content-text"></div>
                        </div>
                    </div>
                    <div class="chat-input">
                        <textarea name="chat-ue-editor-input" id="chat-ue-editor-input" style="height: 250px"></textarea>
                        <div class="chat-tools">
                            <button class="chat-send">发送</button>
                        </div>
                    </div>
                </div>
                <!--------------交流 end --------------->
            </div>
        </div>
    </div>
    <!------------课程信息------------->

</div>


<script>
    //注意：选项卡 依赖 element 模块，否则无法进行功能性操作
    layui.use(['element', 'rate'], function () {
        var element = layui.element;
        var rate = layui.rate;
        element.on('nav(catalog-nav)', function () {
            console.log("nice nice nice nice");
        });
    });

</script>
<script>

    var size = ${requestScope.pojo.size};
    var type = ${requestScope.pojo.type};
    var cid = ${requestScope.course.courseId};
    layui.use(['laypage', 'layer'], function () {
        var laypage = layui.laypage
            , layer = layui.layer;
        //开启HASH
        console.log(${requestScope.pojo.count});
        laypage.render({
            elem: 'page'
            , count: ${requestScope.pojo.count}
            , curr: ${requestScope.pojo.page + 1} //获取hash值为fenye的当前页
        });
    });
    var recodePage = $(".layui-laypage-prev").attr("data-page");
    console.log(parseInt(recodePage));


    window.onload = function () {
        $("#page>div>a").each(function (i) {
            $(this).attr("onclick", "paging(this)")
        });
    }

</script>
</body>

</html>