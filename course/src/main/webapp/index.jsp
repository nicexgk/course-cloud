<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>course</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="/css/mycss/home-page.css"/>
    <script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript" src="/js/bootstrap-popover.js"></script>
    <script type="text/javascript" src="/js/myjs/blanner.js"></script>
</head>
<body>
<c:if test="${requestScope.courseTypeCatalog == null}">
    <jsp:forward page="/index.html"></jsp:forward>
</c:if>
<!------------------------------ header start --------------------------------------->
<div>
    <jsp:include page="/WEB-INF/views/common/header.jsp" flush="true"></jsp:include>
</div>
<!------------------------------ header end ----------------------------------------->


<!------------------------------ 主体DIV start -------------------------------------->
<div class="aBigDiv">
    <!-------------------------- 内嵌DIV start -------------------------------------->
    <div class="aBigTopDiv">
        <!----------------------- 网页头部 start ------------------------------>
        <div class="wrap-banner">
            <!-------wrap-little-banner=上边框-------------->
            <div class="wrap-little-banner"></div>
            <!-------------小banner end--------------------->
            <!-----基本上所有东西都在这个大的bg divl里面---->
            <div class="wrap-banner-bg" id="js-wrap-banner-bg">
                <!--wrap banner core-->
                <div class="wrap-banner-core">
                    <!-------------------- 导航栏目录DIV start ----------------->
                    <div class="wrap-nav">
                        <!--导航组件-->
                        <div class="mod-nav" id="navigator">
                            <ul class="mod-nav_list">
                                <!---------------第1个li start ----------------->
                                <li class="mod-nav_li-first">
                                    <a class="mod-nav_course-all" target="_blank" href="/course/page/0/20">
                                        <i class="icon-hamburg"></i>
                                        <span>全部课程</span>
                                    </a>
                                </li>
                                <!---------------第1个li  end  ----------------->
                                <!---------------循环输出第n个li start  ---------------->
                                <c:forEach items="${requestScope.courseTypeCatalog}" var="parentType">
                                    <li class="mod-nav_li">
                                        <!--主标题div-->
                                        <div class="mod-nav_wrap-nav-first">
                                            <i class="icon-nav-arrow-right"></i>
                                            <a class="mod-nav_link-nav-first" target="_blank" href="/course/page/${parentType.typeId}/0/20">${parentType.typeName}</a>
                                        </div>
                                        <!--===========主标题div end--> <!---热门选项 div[hot=3]-->
                                        <div class="mod-nav-wrap-nav-hot">
                                            <c:forEach items="${parentType.childList}" var="secondType" begin="0" end="2">
                                                <a class="mod-nav_link-nav-hot" target="_blank" href="/course/page/${secondType.typeId}/0/20">${secondType.typeName}</a>
                                            </c:forEach>
                                        </div>
                                        <!---==========热门选项 div end --> <!--隐藏块div-->
                                        <div class="mod-nav_wrap-nav-side">
                                            <ul class="mod-nav_side-list">
                                                <c:forEach items="${parentType.childList}" var="secondType">
                                                    <!--有几个标题写几个li [li =4]-->
                                                    <li class="mod-nav_side-li">
                                                        <!--次标题-->
                                                        <a class="mod-nav_link-nav-second" target="_blank" href="/course/page/${secondType.typeId}/0/20">${secondType.typeName}</a>
                                                        <!--============次标题--> <!--小目录块-->
                                                        <div class="mod-nav_wrap-nav-third">
                                                            <!--目录项目 a标签块   [third=5]-->
                                                            <c:forEach items="${secondType.childList}" var="childType">
                                                                <a class="mod-nav_link-nav-third" target="_blank" href="/course/page/${childType.typeId}/0/20">${childType.typeName}</a>
                                                            </c:forEach>
                                                            <!--==============目录项目 a标签块-->
                                                        </div>
                                                        <!--=============小目录块-->
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </li>
                                </c:forEach>
                                <!---------------循环输出第n个li end   ----------------->
                            </ul>
                        </div>
                        <!--导航组件 end-->
                    </div>
                    <!-------------------- 导航栏目录DIV start ----------------->
                    <!-------------------- 轮播图 DIV start -------------------->
                    <div class="wrap-big-banner">
                        <!--big banner mod-->
                        <div class="mod-big-banner" id="js_banner">
                            <!--包含一个u（用来放置图片）一个div（图片底部的状态方块）两个a（两个按钮用于给图片翻页）-->
                            <!--mod-big-banner_imgs-->
                            <ul id="js_sliderbox" class="mod-big-banner_imgs">
                                <c:forEach items="${purchaseCourseList}" var="course" end="6" varStatus="status">
                                    <li style="display: ${status.count == 1 ? "block" : "none"};">
                                        <a href="/course/page/${course.courseId}" class="mod-big-banner_link-img" title="1" target="_blank">
                                            <img src="${course.picUrl}" alt="1" class="mod-big-banner_img" width="760px" height="300"/>
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>
                            <!--=========================================================mod-big-banner_imgs end-->
                            <!--mod-big-banner_banner-status-->
                            <div class="mod-big-banner_banner-status">
                                <ul class="mod-big-banner_status-bar" id="js-big-banner">
                                    <li class="mod-big-banner_status  current"></li>
                                    <!--mod-big-banner_status_current-->
                                    <li class="mod-big-banner_status"></li>
                                    <li class="mod-big-banner_status"></li>
                                    <li class="mod-big-banner_status"></li>
                                    <li class="mod-big-banner_status"></li>
                                    <li class="mod-big-banner_status"></li>
                                    <li class="mod-big-banner_status"></li>
                                </ul>
                            </div>
                            <!--=====================================================mod-big-banner_banner-status end-->
                            <a class="mod-big-banner_btn-pre" id="js_slider_pre"></a> <a
                                class="mod-big-banner_btn-next" id="js_slider_next"></a>
                        </div>
                        <!--========================big banner mod end -->
                    </div>
                    <!-------------------- 轮播图 DIV start -------------------->
                    <!-------------------- 广告牌 DIV  start ------------------->
                    <div class="wrap-board">
                        <!--公告牌组件-->
                        <div class="mod-board">
                            <!--上半部分-->
                            <div class="mod-board_top">
                                <!--公告板内容   3个li-->
                                <ul class="mod-board_top-notice-list">
                                    <!--1-->
                                    <li><a class="mod-board_top-notice" target="_blank">最后六十天考研冲刺</a></li>
                                    <!--2-->
                                    <li><a class="mod-board_top-notice" target="_blank">2015国考快速解体</a></li>
                                    <!--3-->
                                    <li><a class="mod-board_top-notice" target="_blank">跟亚洲宝贝一起玩转韩国</a></li>
                                </ul>
                                <!--公告板内容   3个li end -->
                            </div>
                            <!--======================上半部分 end-->
                            <!--下半部分-->
                            <div class="mod-board_bottom">
                                <!--下载qq链接-->
                                <a href="#" class="mod-board_link-dl" target="_blank"> <i class="icon-dl"></i>
                                    <span class="mod-board_link-text"> <span
                                            class="mod-board_link-text-large">下载</span> <br> 专用QQ
									</span>
                                </a>
                                <!--二维码-->
                                <div class="mod-board_wrap-qr">
                                    <i class="icon-scan"></i> <span class="mod-board_link-text"> <span
                                        class="mod-board_link-text-large">扫一扫</span> <br> QQ公众号
										</span>
                                    <div class="mod-board_qr">
                                        <img src="img/imgs/bg-board-qr.png" alt="公众号"/>
                                    </div>
                                </div>
                            </div>
                            <!--======================下半部分 end-->
                        </div>
                        <!--======================公告牌组件 end-->
                    </div>
                    <!-------------------- 广告牌 DIV end  --------------------->
                </div>
            </div>
            <!-----基本上所有东西都在这个大的bg divl里面 end-->
        </div>
        <!----------------------- 网页头部 end -------------------------------->


        <!----------------------- 活动DIV start ------------------------------->
        <div class="wrap-activities">
            <a class="activity-card_link" title="挑灯夜学" target="_blank" href="#">
                <img class="activity-card_img" src="/img/imgs/nightly.jpg"/>
            </a>
            <a class="activity-card_link" title="名企面试资格，精英定制" target="_blank" href="#">
                <img class="activity-card_img" src="/img/imgs/job.jpg"/>
            </a>
            <a class="activity-card_link" title="群聚学习" target="_blank" href="#">
                <img class="activity-card_img" src="/img/imgs/subscribe.jpg"/>
            </a>
        </div>
        <!----------------------- 活动DIV start ------------------------------->


        <!----------------------- 热门课程DIV start --------------------------->
        <div class="aBigDiv">
            <!------------------- 标题DIV start ------------------------------->
            <div class="aBigTopDiv">
                <!--热门课堂DIV-->
                <div class="aReMen">热门课程</div>
            </div>
            <!------------------- 标题DIV end  -------------------------------->

            <!------------------- 课程DIV 框 start ---------------------------->
            <div id="aQieHuan1" class="aQieHuanBigBottom">
                <!--小div框框-->
                <c:forEach items="${requestScope.popularCourseList}" var="course" end="4">
                    <!--------------- 第一个课程框 start ----------------->
                    <div class="aRongQiDiv">
                        <!--装图片的a-->
                        <a class="aImgRongQi" target="_blank" href="/course/page/${course.courseId}"><img src="${course.picUrl}"/>
                        </a>
                        <!--图片下面装字体的元素-->
                        <a class="aImgBottom" target="_blank" href="/course/page/${course.courseId}">${course.courseName}</a>
                        <!--装费用和学校的div-->
                        <div class="aBottomDivTwo">
                            <!--费用“免费”-->
                            <c:if test="${course.coursePrice > 0 }">
                                <span class="aBottomDivTwoSpan1 course-price">￥${course.coursePrice}</span>
                            </c:if>
                            <c:if test="${course.coursePrice <= 0 }">
                                <span class="aBottomDivTwoSpan1 course-price course-money-null">免费</span>
                            </c:if>
                            <a class="aBottomSchool course-teacher" href="#">${course.courseTeacher.userName} </a>
                        </div>
                    </div>
                    <!--------------- 第一个课程框 end ------------------>
                </c:forEach>
            </div>
            <!------------------- 课程DIV 框 end  ----------------------------->

        </div>
        <!----------------------- 人课程DIV start ----------------------------->


        <!----------------------- 课程总DIV start ----------------------------->
        <div id="indexcourse">


            <!---------------------IT培训 第一个课程DIV start ------------------------>
            <div class="bBigDiv">
                <!--居中div-->
                <div class="bBigCenter">
                    <!--左边的大div-->
                    <div class="bBigLeft">
                        <!--左边的大div上面div-->
                        <div class="bBigLeftTop">IT·互联网</div>
                        <!--左边的大div下面div-->
                        <div class="bBigLeftBottom">
                            <a href="#bBigDivYuYan" target="_top"><img src="/img/imgs/img1/It.jpg"/></a>
                        </div>
                    </div>
                    <!--右边的大div-->
                    <div class="bBigRight">
                        <!--右边的大div上面按钮divAll-->
                        <div id="" class="bBigRightTOp">
                            <!--右边的大div上面按钮5个元素-->
                            <c:forEach items="${requestScope.superType0}" var="map" varStatus="status">
                                <a href="javascript:;" onclick="onChange(this)" class="${status.count == 1 ? "course-link-title": "none"}">${map.key}</a>
                            </c:forEach>
                        </div>
                        <c:forEach items="${requestScope.superType0}" var="entry" varStatus="status">
                            <!--右边的大div下面的切换大div-->
                            <div class="bBigRightBottom" style="display: ${status.count == 1 ? "block" : "none"};">
                                <!--右边的大div下面的切换大div左边框-->
                                <div class="bBigRightBottomLeft">
                                    <c:forEach items="${entry.value}" var="course">
                                        <div class="aRongQiDiv">
                                            <!--装图片的a-->
                                            <a class="aImgRongQi" target="_blank" href="/course/page/${course.courseId}"><img src="${course.picUrl}"/></a>
                                            <!--图片下面装字体的元素-->
                                            <a class="aImgBottom" target="_blank" href="/course/page/${course.courseId}">${course.courseName}</a>
                                            <!--装费用和学校的div-->
                                            <div class="aBottomDivTwo">
                                                <!--费用“免费”-->
                                                <c:if test="${course.coursePrice > 0 }">
                                                    <span class="aBottomDivTwoSpan1 course-price">￥${course.coursePrice}</span>
                                                </c:if>
                                                <c:if test="${course.coursePrice <= 0 }">
                                                    <span class="aBottomDivTwoSpan1 course-price course-money-null">免费</span>
                                                </c:if>
                                                <a class="aBottomSchool course-teacher" href="#">${course.courseTeacher.userName} </a>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <!---------------------IT培训 第一个课程DIV end   ------------------------>

            <!---------------------语言学习 第二个课程DIV start ---------------------->
            <div class="bBigDiv" id="bBigDivYuYan">
                <!--居中div-->
                <div class="bBigCenter">
                    <!--左边的大div-->
                    <div class="bBigLeft">
                        <!--左边的大div上面div-->
                        <div class="bBigLeftTop">设计·创作</div>
                        <!--左边的大div下面div-->
                        <div class="bBigLeftBottom">
                            <a href="#" target="_blank"><img src="/img/imgs/img1/xx.jpg"/></a>
                        </div>
                    </div>
                    <!--右边的大div-->
                    <div class="bBigRight">
                        <!--右边的大div上面按钮divAll-->
                        <div id="cQieHuanButton" class="bBigRightTOp">
                            <!--右边的大div上面按钮5个元素-->
                            <c:forEach items="${requestScope.superType1}" var="entry">
                                <a href="javascript:;" onclick="onChange(this)" class="${status.count == 1 ? "course-link-title": "none"}">${entry.key}</a>
                            </c:forEach>
                        </div>
                        <c:forEach items="${requestScope.superType1}" var="entry" varStatus="status">
                            <div id="cBigQieHuan1" class="bBigRightBottom" style="display: ${status.count == 1 ? "block" : "none"};">
                                <!--右边的大div下面的切换大div左边框-->
                                <div class="bBigRightBottomLeft">
                                    <c:forEach items="${entry.value}" var="course">
                                        <div class="aRongQiDiv">
                                            <!--装图片的a-->
                                            <a class="aImgRongQi" target="_blank" href="/course/page/${course.courseId}"><img src="${course.picUrl}"/></a>
                                            <!--图片下面装字体的元素-->
                                            <a class="aImgBottom" target="_blank" href="/course/page/${course.courseId}">${course.courseName}</a>
                                            <!--装费用和学校的div-->
                                            <div class="aBottomDivTwo">
                                                <!--费用“免费”-->
                                                <c:if test="${course.coursePrice > 0 }">
                                                    <span class="aBottomDivTwoSpan1 course-price">￥${course.coursePrice}</span>
                                                </c:if>
                                                <c:if test="${course.coursePrice <= 0 }">
                                                    <span class="aBottomDivTwoSpan1 course-price course-money-null">免费</span>
                                                </c:if>
                                                <a class="aBottomSchool course-teacher" href="#">${course.courseTeacher.userName} </a>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <!---------------------语言学习 第二个课程DIV end   ---------------------->

            <!-------------------- 职业技能 第三个课程DIV start ---------------------->
            <div class="bBigDiv">
                <!--居中div-->
                <div class="bBigCenter">
                    <!--左边的大div-->
                    <div class="bBigLeft">
                        <!--左边的大div上面div-->
                        <div class="bBigLeftTop">考研·留学</div>
                        <!--左边的大div下面div-->
                        <div class="bBigLeftBottom">
                            <a href="#" target="_blank"><img src="/img/imgs/img3/zz.jpg"/></a>
                        </div>
                    </div>
                    <!--右边的大div-->
                    <div class="bBigRight">
                        <!--右边的大div上面按钮divAll-->
                        <div id="dQieHuanButton" class="bBigRightTOp">
                            <!--右边的大div上面按钮5个元素-->
                            <c:forEach items="${requestScope.superType2}" var="entry" varStatus="status">
                                <a href="javascript:;" onclick="onChange(this)" class="${status.count == 1 ? "course-link-title": "none"}">${entry.key}</a>
                            </c:forEach>
                        </div>

                        <c:forEach items="${requestScope.superType2}" var="entry" varStatus="status">
                            <div id="cBigQieHuan1" class="bBigRightBottom" style="display: ${status.count == 1 ? "block" : "none"};">
                                <!--右边的大div下面的切换大div左边框-->
                                <div class="bBigRightBottomLeft">
                                    <c:forEach items="${entry.value}" var="course">
                                        <!------------------------------------------------------------------------------------>
                                        <div class="aRongQiDiv">
                                            <!--装图片的a-->
                                            <a class="aImgRongQi" target="_blank" href="/course/page/${course.courseId}"><img src="${course.picUrl}"/></a>
                                            <!--图片下面装字体的元素-->
                                            <a class="aImgBottom" target="_blank" href="/course/page/${course.courseId}">${course.courseName}</a>
                                            <!--装费用和学校的div-->
                                            <div class="aBottomDivTwo">
                                                <!--费用“免费”-->
                                                <c:if test="${course.coursePrice > 0 }">
                                                    <span class="aBottomDivTwoSpan1 course-price">￥${course.coursePrice}</span>
                                                </c:if>
                                                <c:if test="${course.coursePrice <= 0 }">
                                                    <span class="aBottomDivTwoSpan1 course-price course-money-null">免费</span>
                                                </c:if>
                                                <a class="aBottomSchool course-teacher" href="#">${course.courseTeacher.userName} </a>
                                            </div>
                                        </div>
                                        <!------------------------------------------------------------------------------------>
                                    </c:forEach>
                                </div>
                            </div>
                        </c:forEach>

                    </div>
                </div>
            </div>
            <!-------------------- 职业技能 第三个课程DIV end   ---------------------->

            <!-------------------- 中小学大学的大 第四个课程DIV start ---------------->
            <div class="qBigDiv">
                <!--居中的div-->
                <div class="qCenterDiv">
                    <!--中小学大学上面空白div-->
                    <div class="qTopBlankDiv"></div>
                    <!--左边亲子和图片的大div-->
                    <div class="pLeftBigDiv">
                        <!--亲子div-->
                        <div class="pLeftTopDiv">职业·技能</div>
                        <!--左边亲子下面的图片div-->
                        <div class="pLeftBottomDiv">
                            <a href="#" target="_blank"><img src="/img/imgs/img4/daXue.png"/></a>
                        </div>
                    </div>
                    <!--右边推荐等等以及下面切换的大DIV-->
                    <div class="pRightBigDiv">
                        <!--上面的五个切换divAll-->
                        <div id="pQieHuanButton" class="bBigRightTOp">
                            <c:forEach items="${requestScope.superType3}" var="entry" varStatus="status">
                                <a href="javascript:;" onclick="onChange(this)" class="${status.count == 1 ? "course-link-title": "none"}">${entry.key}</a>
                            </c:forEach>
                        </div>
                        <c:forEach items="${requestScope.superType3}" var="entry" varStatus="status">
                            <!--需要切换的整个大div-->
                            <div id="pQieHuanOne" class="pRightBottomDiv" style="display: ${status.count == 1 ? "block" : "none"};">
                                <c:forEach items="${entry.value}" var="course" end="2">
                                    <!------------------------------------------------------------------------------------>
                                    <div class="aRongQiDiv">
                                        <!--装图片的a-->
                                        <a class="aImgRongQi" target="_blank" href="/course/page/${course.courseId}"><img src="${course.picUrl}"/>
                                        </a>
                                        <!--图片下面装字体的元素-->
                                        <a class="aImgBottom" target="_blank" href="/course/page/${course.courseId}">${course.courseName}</a>
                                        <!--装费用和学校的div-->
                                        <div class="aBottomDivTwo">
                                            <!--费用“免费”-->
                                            <c:if test="${course.coursePrice > 0 }">
                                                <span class="aBottomDivTwoSpan1 course-price">￥${course.coursePrice}</span>
                                            </c:if>
                                            <c:if test="${course.coursePrice <= 0 }">
                                                <span class="aBottomDivTwoSpan1 course-price course-money-null">免费</span>
                                            </c:if>
                                            <a class="aBottomSchool course-teacher" href="#">${course.courseTeacher.userName} </a>
                                        </div>
                                    </div>
                                    <!------------------------------------------------------------------------------------>
                                </c:forEach>
                            </div>
                        </c:forEach>
                        <!--需要切换的整个大div-->
                    </div>
                </div>
            </div>
            <!-------------------- 中小学大学的大 第四个课程DIV end   ---------------->

            <!-------------------- 兴趣爱好开始 第五个课程DIV start ------------------>
            <div class="qBigDiv" style="background-color: #f9f9f9;">
                <!--居中的div-->
                <div class="qCenterDiv">
                    <!--中小学大学上面空白div-->
                    <div class="qTopBlankDiv"></div>
                    <!--左边亲子和图片的大div-->
                    <div class="pLeftBigDiv">
                        <!--亲子div-->
                        <div class="pLeftTopDiv">语言·学习</div>
                        <!--左边亲子下面的图片div-->
                        <div class="pLeftBottomDiv">
                            <a href="#" target="_blank"><img src="/img/imgs/img6/xingQu.png"/></a>
                        </div>
                    </div>
                    <!--右边推荐等等以及下面切换的大DIV-->
                    <div class="pRightBigDiv">
                        <!--上面的五个切换divAll-->
                        <div id="ppQieHuanButton" class="bBigRightTOp">
                            <c:forEach items="${requestScope.superType4}" var="entry" varStatus="status">
                                <a href="javascript:;" onclick="onChange(this)" class="${status.count == 1 ? "course-link-title": "none"}">${entry.key}</a>
                            </c:forEach>
                        </div>
                        <c:forEach items="${requestScope.superType4}" var="entry" varStatus="status">
                            <!--需要切换的整个大div-->
                            <div id="pQieHuanOne" class="pRightBottomDiv" style="display: ${status.count == 1 ? "block" : "none"};">
                                <c:forEach items="${entry.value}" var="course" end="2">
                                    <!------------------------------------------------------------------------------------>
                                    <div class="aRongQiDiv">
                                        <!--装图片的a-->
                                        <a class="aImgRongQi" target="_blank" href="/course/page/${course.courseId}"><img src="${course.picUrl}"/>
                                        </a>
                                        <!--图片下面装字体的元素-->
                                        <a class="aImgBottom" target="_blank" href="/course/page/${course.courseId}">${course.courseName}</a>
                                        <!--装费用和学校的div-->
                                        <div class="aBottomDivTwo">
                                            <!--费用“免费”-->
                                            <c:if test="${course.coursePrice > 0 }">
                                                <span class="aBottomDivTwoSpan1 course-price">￥${course.coursePrice}</span>
                                            </c:if>
                                            <c:if test="${course.coursePrice <= 0 }">
                                                <span class="aBottomDivTwoSpan1 course-price course-money-null">免费</span>
                                            </c:if>
                                            <a class="aBottomSchool course-teacher" href="#">${course.courseTeacher.userName} </a>
                                        </div>
                                    </div>
                                    <!------------------------------------------------------------------------------------>
                                </c:forEach>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <!-------------------- 兴趣爱好开始 第五个课程DIV end   ------------------>

            <!-------------------- 亲子课堂开始 第六个课程DIV start ------------------>
            <div class="qBigDiv">
                <!--居中的div-->
                <div class="qCenterDiv">
                    <!--中小学大学上面空白div-->
                    <div class="qTopBlankDiv"></div>
                    <!--左边亲子和图片的大div-->
                    <div class="pLeftBigDiv">
                        <!--亲子div-->
                        <div class="pLeftTopDiv">性趣·爱好</div>
                        <!--左边亲子下面的图片div-->
                        <div class="pLeftBottomDiv">
                            <a href="#" target="_blank"></a><img src="/img/imgs/img7/qingZi.jpg"/>
                        </div>
                    </div>
                    <!--右边推荐等等以及下面切换的大DIV-->
                    <div class="pRightBigDiv">
                        <!--上面的五个切换divAll-->
                        <div id="pppQieHuanButton" class="bBigRightTOp">
                            <!--分别5个按钮-->
                            <c:forEach items="${requestScope.superType5}" var="entry" varStatus="status">
                                <a href="javascript:;" onclick="onChange(this)" class="${status.count == 1 ? "course-link-title": "none"}">${entry.key}</a>
                            </c:forEach>
                        </div>
                        <!--需要切换的整个大div-->
                        <c:forEach items="${requestScope.superType5}" var="entry" varStatus="status">
                            <!--需要切换的整个大div-->
                            <div id="pQieHuanOne" class="pRightBottomDiv" style="display: ${status.count == 1 ? "block" : "none"};">
                                <c:forEach items="${entry.value}" var="course" end="2">
                                    <!------------------------------------------------------------------------------------>
                                    <div class="aRongQiDiv">
                                        <!--装图片的a-->
                                        <a class="aImgRongQi" target="_blank" href="/course/page/${course.courseId}"><img src="${course.picUrl}"/>
                                        </a>
                                        <!--图片下面装字体的元素-->
                                        <a class="aImgBottom" target="_blank" href="/course/page/${course.courseId}">${course.courseName}</a>
                                        <!--装费用和学校的div-->
                                        <div class="aBottomDivTwo">
                                            <!--费用“免费”-->
                                            <c:if test="${course.coursePrice > 0 }">
                                                <span class="aBottomDivTwoSpan1 course-price">￥${course.coursePrice}</span>
                                            </c:if>
                                            <c:if test="${course.coursePrice <= 0 }">
                                                <span class="aBottomDivTwoSpan1 course-price course-money-null">免费</span>
                                            </c:if>
                                            <a class="aBottomSchool course-teacher" href="#">${course.courseTeacher.userName} </a>
                                        </div>
                                    </div>
                                    <!------------------------------------------------------------------------------------>
                                </c:forEach>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <!-------------------- 亲子课堂开始 第六个课程DIV end   ------------------>
        </div>
        <!----------------------- 课程总DIV end   ----------------------------->


        <!------------------------ 入住机构 start ----------------------------->
        <div class="rzBigDiv">
            <!--入住机构居中DIV-->
            <div class="rzCenterDiv">
                <!--包裹全部的长条div-->
                <div class="rzCenterChangDiv">
                    <!--装左边的字的大div-->
                    <div class="rzFontBigDiv">
                        <!--装上面的字的div-->
                        <div>入驻机构</div>
                        <!--装上面的字的a-->
                        <a target="_blank" href="../入驻机构/入驻机构.html"> 我要申请入住 </a>
                    </div>
                    <!--装按钮和机构图片的div-->
                    <div class="rzRightChangDiv">
                        <!--左切换按钮-->
                        <div id="rzLeftButton" class="rzLeftButton"></div>
                        <!--需要移动的整个长条div窗口-->
                        <div class="rzYiDongChuangKouDiv">
                            <!--需要移动的整个长条div很长的div-->
                            <div id="rzChangTiaoDiv" class="rzYiDongDiv">
                                <!--每一条div第一条-->
                                <div class="rzMeiTiaoDivFirst">
                                    <!--各个入住机构a-->
                                    <a href="#"><img src="./img/imgs/img5/rz1.jpg"/></a>
                                    <a href="#"><img src="./img/imgs/img5/rz2.jpg"/></a>
                                    <a href="#"><img src="./img/imgs/img5/rz3.png"/></a>
                                    <a href="#"><img src="./img/imgs/img5/rz4.jpg"/></a>
                                    <a href="#"><img src="./img/imgs/img5/rz5.jpg"/></a>
                                    <a href="#"><img src="./img/imgs/img5/rz6.jpg"/></a>
                                    <a href="#"><img src="./img/imgs/img5/rz7.jpg"/></a>
                                    <a href="#"><img src="./img/imgs/img5/rz8.png"/></a>
                                </div>
                                <!--每一条div第二条-->
                                <div class="rzMeiTiaoDivFirst">
                                    <!--各个入住机构a-->
                                    <a href="#"><img src="./img/imgs/img5/rz11.jpg"/></a>
                                    <a href="#"><img src="./img/imgs/img5/rz12.jpg"/></a>
                                    <a href="#"><img src="./img/imgs/img5/rz13.jpg"/></a>
                                    <a href="#"><img src="./img/imgs/img5/rz14.jpg"/></a>
                                    <a href="#"><img src="./img/imgs/img5/rz15.jpg"/></a>
                                    <a href="#"><img src="./img/imgs/img5/rz16.jpg"/></a>
                                    <a href="#"><img src="./img/imgs/img5/rz17.png"/></a>
                                    <a href="#"><img src="./img/imgs/img5/rz18.jpg"/></a>
                                </div>
                            </div>
                        </div>
                        <!--右切换按钮-->
                        <div id="rzRightButton" class="rzRightButton"></div>
                    </div>
                </div>
            </div>
        </div>
        <!------------------------ 入住机构 end   ----------------------------->


        <!------------------------ 页脚DIV start ------------------------------>
        <div class="footer">
            <jsp:include page="/WEB-INF/views/common/footer.jsp" flush="true"></jsp:include>
        </div>
        <!------------------------ 页脚DIV end   ------------------------------>
    </div>
    <!-------------------------- 内嵌DIV end   ---------------------------------------------->
</div>
<!------------------------------ 主体DIV end  --------------------------------------->
</body>
</html>