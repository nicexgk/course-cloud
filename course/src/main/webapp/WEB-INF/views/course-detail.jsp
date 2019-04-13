<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>课程详情</title>
    <link rel="stylesheet" href="/css/course.css">
    <script src="/js/jquery.js"></script>

    <script type="text/javascript">
        function mypage1(arg1, arg2, arg3) {
            var i =${requestScope.course.courseId};
            $.getJSON("mycomment", {courseid: i, page: arg1, size: arg2, myradio: arg3}, function (data) {
                if (data == null || data.list.length <= 0) {
                    $("#mycomment").html("暂无评论");

                } else {
                    var str = "";
                    var j
                    var s = "";
                    for (var i = 0; i < data.list.length; i++) {
                        j = 0;
                        j = data.list[i].commentGrade;
                        for (var k = 0; k < j; k++) {
                            s = s + "<img src='../../img/star.png' alt=''>";
                        }
                        str = str + "<div class='user-comment'><div class='user-comment-left'>" +
                            "<img src='../../img/user.jpg' alt=''></div><div class='user-comment-right'>" +
                            "<div class='score'><p id='myxx'>" + s + "" +
                            "</p><div class='comment-info'>" + data.list[i].commentContent + "</div>" +
                            "<div class='comment-time'>" + data.list[i].commentDate + "</div>" +
                            "</div></div></div>";
                        s = "";
                    }
                    if (data.list.length >= 5) {
                        $("#mycomment").html(str);
                        $("#mypage").html("<a href='javascript:mypage1(1,5," + arg3 + ")'>首页</a>" +
                            "<a href='javascript:mypage1(" + data.lastpage + ",5," + arg3 + ")'>上一页</a>" +
                            "<a href='javascript:mypage1(" + data.nextpage + ",5," + arg3 + ")'>下一页</a>" +
                            "<a href='javascript:mypage1(" + data.pagecount + ",5," + arg3 + ")'>尾页</a>");
                    } else {
                        $("#mypage").html("<a href='javascript:mypage1(1,5," + arg3 + ")'>首页</a>" +
                            "<a href='javascript:mypage1(" + data.lastpage + ",5," + arg3 + ")'>上一页</a>");
                    }
                }
            });
        }

    </script>

</head>
<body>

<div>
    <jsp:include page="/WEB-INF/views/common/header.jsp" flush="true"></jsp:include>
</div>


<div class="content">

    <div class="content-c">
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
                    <video src="" style="width: 600px;height: 340px;"></video>
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
                <span>购买人数 ${requestScope.course.coursePersonNumber}</span>
                <span>好评度${requestScope.po.rating}%</span>
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
                    <p>${requestScope.course.courseContent}</p>
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

    <!------------课程信息------------->
    <div class="over-view-warp">
        <div class="over-view-cont">
            <div class="over-view-cont-left">


                <div class="tab-title">
                    <ul>
                        <li class="tab-bg" data-tab="1"><a>课程概述</a></li>
                        <li data-tab="2"><a>课程目录</a></li>
                        <li data-tab="3"><a>学员评论（${requestScope.po.commentnum}）</a></li>
                        <li data-tab="2"><a href="querycourse.action?courseid=${requestScope.course.courseId }">我也要评论</a></li>
                        <input type="button" class="btn2" id="btn2" value="立即购买">
                    </ul>
                </div>

                <!-- 选项卡1 -->
                <div class="tab" id="tab1">
                    <div class="teacher">
                        <h3>老师介绍</h3>
                        <div class="teacher-card">
                            <div class="teacher-img">
                                <img src="../../img/teacher.jpg" alt="">
                            </div>
                            <div class="teacher-info">
                                <span><a href="#">${requestScope.teacher.userName}</a></span>
                                <p>${requestScope.teacher.userIntroduce}</p>
                            </div>
                        </div>
                    </div>
                    <div class="course-introduction">
                        <h1>${requestScope.course.description}</h1>
                    </div>
                    <div class="download">
                        <div class="download-tit">
                            资料下载 <span>报名后支持下载</span>
                        </div>
                        <ul class="download-link">
                            <li><a href="#">1-1-Linux系统介</a></li>
                            <li><a href="#">1-1-Linux系统介绍和操作系统Linux系统介绍和操作系统</a></li>
                            <li><a href="#">1-1-Linux系统介绍和操作系统Linux系统介绍和操作系统</a></li>
                            <li><a href="#">1-1-Linux系统介绍和操作系统Linux系统介绍和操作系统</a></li>
                            <li><a href="#">1-1-Linux系统介绍和操作系统Linux系统介绍和操作系统</a></li>
                            <li><a href="#">1-1-Linux系统介绍和操作系统Linux系统介绍和操作系统</a></li>
                        </ul>
                        <ul class="download-link-hide">
                            <li><a href="#">1-1-Linux系统介</a></li>
                            <li><a href="#">1-1-Linux系统介绍和操作系统Linux系统介绍和操作系统</a></li>
                            <li><a href="#">1-1-Linux系统介绍和操作系统Linux系统介绍和操作系统</a></li>
                            <li><a href="#">1-1-Linux系统介绍和操作系统Linux系统介绍和操作系统</a></li>
                            <li><a href="#">1-1-Linux系统介绍和操作系统Linux系统介绍和操作系统</a></li>
                            <li><a href="#">1-1-Linux系统介绍和操作系统Linux系统介绍和操作系统</a></li>
                        </ul>
                        <div class="more" data-state="0">
                            <a>更多 </a>
                        </div>
                    </div>
                </div>
                <!-- 选项卡2 -->
                <div class="tab" id="tab2">
                    <div class="tab-box">
                        <h3 class="class-name">${requestScope.course.courseName}</h3>
                    </div>
                    <div class="tab-box">
                        <c:forEach items="${requestScope.list}" var="catalog">
                            <div class="course-name">
                                <span>第${catalog.catalogOrder}节</span>
                                <p>${catalog.catalogName}</p>
                                <div class="course">
                                    <ul>
                                        <c:forEach items="${catalog.contentList}" var="content">
                                            <li>
                                                <img src="../../img/video.png">&nbsp;&nbsp;&nbsp;
                                                <a href="#">${content.contentName }</a>
                                            </li>
                                        </c:forEach>

                                    </ul>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <!-- 选项卡3 -->
                <div class="tab" id="tab3">
                    <div class="comment">
                        <ul>
                            <li class="exc">
                                <span>${requestScope.po.rating}%</span>
                                <p>好评度</p>
                            </li>
                            <li><input type="radio" id="myradio" name="myradio" value="1" onclick="myclick(this.value)"> 全部评价（${requestScope.po.commentnum}）</li>
                            <li><input type="radio" id="myradio" name="myradio" value="2" onclick="myclick(this.value)"> 好评（${requestScope.po.gcommentnum}）</li>
                            <li><input type="radio" id="myradio" name="myradio" value="3" onclick="myclick(this.value)"> 中评（${requestScope.po.mcommentnum}）</li>
                            <li><input type="radio" id="myradio" name="myradio" value="4" onclick="myclick(this.value)"> 差评（${requestScope.po.bcommentnum}）</li>
                        </ul>
                    </div>
                    <!-- 用户1评论 -->
                    <div id="mycomment">
                    </div>

                    <!-- 上一页下一页按钮组 -->
                    <div class="btn-group" id="mypage">
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!------------课程信息------------->

    <!-----------课程推荐start--------------->
    <div class="recommend">
        <div class="recommend-c">
            <h3>老师还为你推荐了以下几门课程</h3>
            <div class="course-group">
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
        </div>
    </div>
    <!-----------课程推荐end ---------------->
</div>

<!----------页脚start---------->
<div class="footer">
    <div class="footer-content">
        <p><img src="../../img/logo-min.png"></p>
        <p>Copyright © 2017 Tencent. All Rights Reserved.</p>
        <p>深圳市腾讯计算机系统有限公司 版权所有 | 腾讯课堂服务协议 | 站点地图</p>
    </div>
</div>
<!----------页脚 end ---------->

</body>

</html>

<script>
    $(function () {
        $("#call").hover(function () {
            $(this).find("strong").hide();
            $(this).find("dl").show();
        }, function () {
            $(this).find("strong").show();
            $(this).find("dl").hide();
        });

        $(".more").click(function () {
            var kk = $(this).attr("data-state");
            if (kk == 0) {
                $(".download-link-hide").show();
                $(this).find("a").text("收起");
                $(this).attr("data-state", "1")
            } else {
                $(".download-link-hide").hide();
                $(this).attr("data-state", "0")
            }
        });

        $(".tab-title ul li").click(function () {
            var tab = $(this).attr("data-tab");
            $(".tab-title ul li").css("borderTop", "5px solid #fff");
            $(this).css("borderTop", "5px solid #0087ff");
            if (tab == 1) {
                $("#tab1").show();
                $("#tab2").hide();
                $("#tab3").hide();
            } else if (tab == 2) {

                $("#tab1").hide();
                $("#tab2").show();
                $("#tab3").hide();
            } else {
                $("#tab1").hide();
                $("#tab2").hide();
                $("#tab3").show();
            }
        });

        $(window).scroll(function () {
            var top = $(this).scrollTop();
            if (top > 400) {
                $(".tab-title").css("position", "fixed").css({
                    "border": "1px solid #ccc",
                    "background": "#fff",
                    "z-index": "1000",
                    "top": "0px",
                    "width": "100%",
                    "marginLeft": "-100px",
                });
                $("#btn2").show().css({
                    "marginTop": "5px",
                    "marginLeft": "30px",
                });
            } else {
                $(".tab-title").css({
                    "position": "relative",
                    "border": "0px",
                    "marginLeft": "0px",
                });
                $("#btn2").hide();
            }
        });
    });

</script>