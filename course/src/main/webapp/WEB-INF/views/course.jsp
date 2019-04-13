<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>课程详情</title>
    <link rel="stylesheet" href="/css/course.css">
    <link rel="stylesheet" href="/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="/css/mycss/home-page.css"/>

    <script src="/js/jquery.js"></script>
    <script src="/layui/layui.js"></script>
    <script src="/ueditor/ueditor.config_1.js"></script>
    <script src="/ueditor/ueditor.all.js"></script>
    <script src="/ueditor/ueditor.parse.js"></script>
    <script src="/js/myjs/course.js"></script>d
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
                <%--<img src="${requestScope.course.picURL}" alt="" width="600px" height="340px">--%>
                    <c:choose>
                        <c:when test="${requestScope.course.catalogList != null}">
                        <video class="header-video" src="${requestScope.course.catalogList[0].childList[0].catalogResource}" style="width: 600px;height: 340px;" controls="controls"></video>
                        </c:when>
                        <c:otherwise>
                        <video class="header-video" src="" style="width: 600px;height: 340px;" controls="controls"></video>
                        </c:otherwise>
                    </c:choose>
                </div>
                <p>
                    <a href="#">服务承诺 : </a>
                    <a href="#"><img src="../../img/icon_01.png">&nbsp;支付保障</a>
                    <a href="#"><img src="../../img/icon_03.png">&nbsp;课前随时退</a>
                    <a href="#"><img src="../../img/icon_13.png">&nbsp;课后有回放</a>
                </p>
            </div>

            <div class="course-info-right">
                <h3>${requestScope.course.courseName}</h3>
                <span>购买人数 100</span>
                <span>好评度10%</span>
                <span>
                    <img src="../../img/share-icon.png">
                    分享
                </span>
                <span>
                    <img src="../../img/like.png">
                    收藏
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
                        <c:when test="${requestScope.course.coursePrice eq 0}">
                            <a href="trade?courseId=${requestScope.course.courseId }"><input type="button" class="btn2" value="立即报名"></a>
                        </c:when>
                        <c:otherwise>
                            <a href="trade?courseId=${requestScope.course.courseId }"><input type="button" class="btn2" value="立即购买"></a>
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
                    <div class="comment-filter"></div>
                    <div class="comment-last">
                        <div class="comment-item">
                            <div class="item-left" style="float: left;">
                                <img class="user-avatar" src="//thirdqq.qlogo.cn/g?b=sdk&amp;k=Gk3lFDN7QFHA3Sta1Rbtnw&amp;s=140&amp;t=1552926024" alt="唯****" style="width: 40px;height: 40px;margin-top: 20px">
                                <p class="user-name">唯****</p>
                            </div>
                            <div class="item-right" style="float: right;width: 1100px;">
                                <%--<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">--%>
                                    <%--<legend>评分</legend>--%>
                                <%--</fieldset>--%>
                                <ul>
                                    <li><div id="test10"></div></li>
                                    <li><div id="test11"></div></li>
                                    <li><div id="test12"></div></li>
                                    <li><div id="test13"></div></li>
                                    <li><div id="test14"></div></li>
                                </ul>
                                <div class="comment-bd">讲的很详细，很基础，简明易懂，很适合小白，扩展的知识点也很好，学到了很多，也十分有趣，不枯燥，让人能学下去。我花了大概两周的时间把这些视频都看完，掌握其中的知识点，一遍不行就两遍，学到的知识都是有用的，很感谢成哥。</div>
                                <div class="comment-ft">
                                    <span class="comment-where">已上课83小时55分钟时评价</span>
                                    <span class="comment-time">2019-02-27</span>
                                    <span class="comment-report" data-id="465656028">举报</span>
                                </div>
                                <div class="comment-reply"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--------------评论 end --------------->

                <!--------------交流start--------------->
                <div class="layui-tab-item chat-container">
                    <div class="chat-content">
                        <textarea name="chat-ue-editor-content" id="chat-ue-editor-content" cols="30" rows="10"></textarea>
                    </div>
                    <div class="chat-input">
                        <textarea name="chat-ue-editor-input" id="chat-ue-editor-input" cols="30" rows="10"></textarea>
                        <div class="chat-tools">
                            <button class="chat-send">发送</button>
                        </div>
                    </div>
                </div>
                <!--------------交流 end --------------->

                <!--------------其他start--------------->
                <div class="layui-tab-item">
                    内容5
                </div>
                <!--------------其他 end --------------->
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
        //只读
        rate.render({
            elem: '#test10'
            ,value: 4
            ,readonly: true
        });

        rate.render({
            elem: '#test10'
            ,value: 5
            ,readonly: true
        });
        //…
    });
</script>
</body>

</html>