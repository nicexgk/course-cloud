<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>course</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="/css/mycss/home-page.css"/>
    <link rel="stylesheet" type="text/css" href="/css/jsuggest.css">
    <script type="text/javascript" src="/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="/js/jSuggest.js"></script>
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
                                    <a class="mod-nav_course-all" target="_blank" href="queryAllCourse.action">
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
                                            <a class="mod-nav_link-nav-first" target="_blank" href="#">${parentType.typeName}</a>
                                        </div>
                                        <!--===========主标题div end--> <!---热门选项 div[hot=3]-->
                                        <div class="mod-nav-wrap-nav-hot">
                                            <c:forEach items="${parentType.childList}" var="secondType" begin="0" end="2">
                                                <a class="mod-nav_link-nav-hot" target="_blank" href="#">${secondType.typeName}</a>
                                            </c:forEach>
                                        </div>
                                        <!---==========热门选项 div end --> <!--隐藏块div-->
                                        <div class="mod-nav_wrap-nav-side">
                                            <ul class="mod-nav_side-list">
                                                <c:forEach items="${parentType.childList}" var="secondType">
                                                    <!--有几个标题写几个li [li =4]-->
                                                    <li class="mod-nav_side-li">
                                                        <!--次标题-->
                                                        <a class="mod-nav_link-nav-second" target="_blank" href="">${secondType.typeName}</a>
                                                        <!--============次标题--> <!--小目录块-->
                                                        <div class="mod-nav_wrap-nav-third">
                                                            <!--目录项目 a标签块   [third=5]-->
                                                            <c:forEach items="${secondType.childList}" var="childType">
                                                                <a class="mod-nav_link-nav-third">${childType.typeName}</a>
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
                                <li style="display: block;">
                                    <a href="#" class="mod-big-banner_link-img" title="1" target="_blank">
                                        <img src="img/imgs/1.jpg" alt="1" class="mod-big-banner_img" width="760px" height="300"/>
                                    </a>
                                </li>
                                <li style="display: none;">
                                    <a href="#" class="mod-big-banner_link-img" title="1" target="_blank">
                                        <img src="img/imgs/2.png" alt="1" class="mod-big-banner_img" width="760px" height="300"/>
                                    </a>
                                </li>
                                <li style="display: none;">
                                    <a href="#" class="mod-big-banner_link-img" title="1" target="_blank">
                                        <img src="img/imgs/3.jpg" alt="1" class="mod-big-banner_img" width="760px" height="300"/>
                                    </a>
                                </li>
                                <li style="display: none;">
                                    <a href="#" class="mod-big-banner_link-img" title="1" target="_blank">
                                        <img src="img/imgs/4.jpg" alt="1" class="mod-big-banner_img" width="760px"
                                             height="300"/>
                                    </a>
                                </li>
                                <li style="display: none;">
                                    <a href="#" class="mod-big-banner_link-img" title="1" target="_blank">
                                        <img src="img/imgs/5.jpg" alt="1" class="mod-big-banner_img" width="760px" height="300"/>
                                    </a>
                                </li>
                                <li style="display: none;">
                                    <a href="#" class="mod-big-banner_link-img" title="1" target="_blank">
                                        <img src="img/imgs/6.jpg" alt="1" class="mod-big-banner_img" width="760px" height="300"/>
                                    </a>
                                </li>
                                <li style="display: none;">
                                    <a href="#" class="mod-big-banner_link-img" title="1" target="_blank">
                                        <img src="img/imgs/7.jpg" alt="1" class="mod-big-banner_img" width="760px" height="300"/>
                                    </a>
                                </li>
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
                <img class="activity-card_img" src="img/imgs/nightly.jpg"/>
            </a>
            <a class="activity-card_link" title="名企面试资格，精英定制" target="_blank" href="#">
                <img class="activity-card_img" src="img/imgs/job.jpg"/>
            </a>
            <a class="activity-card_link" title="群聚学习" target="_blank" href="#">
                <img class="activity-card_img" src="img/imgs/subscribe.jpg"/>
            </a>
        </div>
        <!----------------------- 活动DIV start ------------------------------->


        <!----------------------- 热门课程DIV start --------------------------->
        <div class="aBigDiv">
            <!------------------- 标题DIV start ------------------------------->
            <div class="aBigTopDiv">
                <!--热门课堂DIV-->
                <div class="aReMen">热门课程</div>
                <!--按钮大div-->
                <div class="aButtonBigDiv">
                    <!--按钮大div的直播课程-->
                    <div class="aZhiBo">查看更多</div>
                    <!--按钮大div的录播课程-->
                    <div id="aLuBoKe" class="aLuBo">
                        <!--装图标的-->
                        <!-- <span class="aBoFang"> </span> -->
                        <!--装录播课的-->
                        <!-- <span> 录播课 </span> -->
                    </div>
                </div>
            </div>
            <!------------------- 标题DIV end  -------------------------------->

            <!------------------- 课程DIV 框 start ---------------------------->
            <div id="aQieHuan1" class="aQieHuanBigBottom">
                <!--小div框框-->
                <!--------------- 第一个课程框 start ----------------->
                <div class="aRongQiDiv">
                    <!--装图片的a-->
                    <a class="aImgRongQi" href="#"> <img src="./img/imgs/img/a11.jpg"/>
                    </a>
                    <!--图片下面装字体的元素-->
                    <a class="aImgBottom" href="#"> 蓝铅笔公开课——小白学漫画 </a>
                    <!--装费用和学校的div-->
                    <div class="aBottomDivTwo">
                        <!--费用“免费”-->
                        <span class="aBottomDivTwoSpan1">免费</span>
                        <!--中间的竖线-->
                        <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" target="_blank"
                                                                     href="#"> 跨考直播 </a>
                    </div>
                </div>
                <!--------------- 第一个课程框 end  ------------------>

                <!--------------- 第二个课程框 start ----------------->
                <div class="aRongQiDiv">
                    <!--装图片的a-->
                    <a class="aImgRongQi" target="_blank" href="#"> <img
                            src="./img/imgs/img/a12.jpg"/>
                    </a>
                    <!--图片下面装字体的元素-->
                    <a class="aImgBottom" target="_blank" href="#"> 2014年12月四六级冲刺班 </a>
                    <!--装费用和学校的div-->
                    <div class="aBottomDivTwo">
                        <!--费用“免费”-->
                        <span class="aBottomDivTwoSpan1">免费</span>
                        <!--中间的竖线-->
                        <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                        应试宝 </a>
                    </div>
                </div>
                <!--------------- 第二个课程框 end  ------------------>

                <!--------------- 第三个课程框 start ----------------->
                <div class="aRongQiDiv">
                    <!--装图片的a-->
                    <a class="aImgRongQi" href="#"> <img src="./img/imgs/img/a13.jpg"/>
                    </a>
                    <!--图片下面装字体的元素-->
                    <a class="aImgBottom" href="#"> 2015年国考笔试高分速成班 </a>
                    <!--装费用和学校的div-->
                    <div class="aBottomDivTwo">
                        <!--费用“免费”-->
                        <span class="aBottomDivTwoSpan1">免费</span>
                        <!--中间的竖线-->
                        <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                        魁冠公考 </a>
                    </div>
                </div>
                <!--------------- 第三个课程框 end  ------------------>

                <!--------------- 第四个课程框 start ----------------->
                <div class="aRongQiDiv">
                    <!--装图片的a-->
                    <a class="aImgRongQi" href="#"> <img src="./img/imgs/img/a14.jpg"/>
                    </a>
                    <!--图片下面装字体的元素-->
                    <a class="aImgBottom" href="#"> 英语拼记忆 不怕底子薄 洛基英语 </a>
                    <!--装费用和学校的div-->
                    <div class="aBottomDivTwo">
                        <!--费用“免费”-->
                        <span class="aBottomDivTwoSpan1">免费</span>
                        <!--中间的竖线-->
                        <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                        洛基英语 </a>
                    </div>
                </div>
                <!--------------- 第四个课程框 end  ------------------>

                <!--------------- 第五个课程框 start ----------------->
                <div class="aRongQiDiv" style="margin-right: -50px;">
                    <!--装图片的a-->
                    <a class="aImgRongQi" href="#"> <img src="./img/imgs/img/a15.jpg"/>
                    </a>
                    <!--图片下面装字体的元素-->
                    <a class="aImgBottom" href="#"> web前端开发求职季试听课 </a>
                    <!--装费用和学校的div-->
                    <div class="aBottomDivTwo">
                        <!--费用“免费”-->
                        <span class="aBottomDivTwoSpan1">免费</span>
                        <!--中间的竖线-->
                        <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                        德科特 </a>
                    </div>
                </div>
                <!--------------- 第五个课程框 end  ------------------>
            </div>
            <!------------------- 课程DIV 框 end  ----------------------------->

            <!------------------- 隐藏的课程DIV start ------------------------->
            <div id="aQieHuan2" class="aQieHuanBigBottom" style="display: none;">
                <!--小div框框-->
                <!--重复的第一个start----------------->
                <div class="aRongQiDiv">
                    <!--装图片的a-->
                    <a class="aImgRongQi" href="#"> <img src="./img/imgs/img/a22.jpg"/>
                    </a>
                    <!--图片下面装字体的元素-->
                    <a class="aImgBottom" href="#"> 历代经济变革得失 </a>
                    <!--装费用和学校的div-->
                    <div class="aBottomDivTwo">
                        <!--费用“免费”-->
                        <span class="aBottomDivTwoSpan1">免费</span>
                        <!--中间的竖线-->
                        <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                        吴晓波 </a>
                    </div>
                </div>
                <!--重复的第一个end----------------->
                <!--小div框框-->
                <!--重复的第一个start----------------->
                <div class="aRongQiDiv">
                    <!--装图片的a-->
                    <a class="aImgRongQi" href="#"> <img src="./img/imgs/img/a21.jpg"/>
                    </a>
                    <!--图片下面装字体的元素-->
                    <a class="aImgBottom" href="#"> 从零开始学日语（和名师快乐玩 </a>
                    <!--装费用和学校的div-->
                    <div class="aBottomDivTwo">
                        <!--费用“免费”-->
                        <span class="aBottomDivTwoSpan1">免费</span>
                        <!--中间的竖线-->
                        <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                        海贝网校 </a>
                    </div>
                </div>
                <!--重复的第一个end----------------->

                <!--小div框框-->
                <!--重复的第一个start----------------->
                <div class="aRongQiDiv">
                    <!--装图片的a-->
                    <a class="aImgRongQi" href="#"> <img src="./img/imgs/img/a23.jpg"/>
                    </a>
                    <!--图片下面装字体的元素-->
                    <a class="aImgBottom" href="#"> 以礼走天下 </a>
                    <!--装费用和学校的div-->
                    <div class="aBottomDivTwo">
                        <!--费用“免费”-->
                        <span class="aBottomDivTwoSpan1">免费</span>
                        <!--中间的竖线-->
                        <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                        周思敏 </a>
                    </div>
                </div>
                <!--重复的第一个end----------------->

                <!--小div框框-->
                <!--重复的第一个start----------------->
                <div class="aRongQiDiv">
                    <!--装图片的a-->
                    <a class="aImgRongQi" href="#"> <img src="./img/imgs/img/a24.jpg"/>
                    </a>
                    <!--图片下面装字体的元素-->
                    <a class="aImgBottom" href="#"> 芩说红楼梦 </a>
                    <!--装费用和学校的div-->
                    <div class="aBottomDivTwo">
                        <!--费用“免费”-->
                        <span class="aBottomDivTwoSpan1">免费</span>
                        <!--中间的竖线-->
                        <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#"> 苏岑
                    </a>
                    </div>
                </div>
                <!--重复的第一个end----------------->

                <!--小div框框-->
                <!--重复的第一个start----------------->
                <div class="aRongQiDiv" style="margin-right: -50px;">
                    <!--装图片的a-->
                    <a class="aImgRongQi" href="#"> <img src="./img/imgs/img/a25.jpg"/>
                    </a>
                    <!--图片下面装字体的元素-->
                    <a class="aImgBottom" href="#"> 90后英语：iTop-[英语求职]潜规则 </a>
                    <!--装费用和学校的div-->
                    <div class="aBottomDivTwo">
                        <!--费用“免费”-->
                        <span class="aBottomDivTwoSpan1">免费</span>
                        <!--中间的竖线-->
                        <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                        北京新范文化 </a>
                    </div>
                </div>
            </div>
            <!------------------- 隐藏的课程DIV end  -------------------------->

        </div>
        <!----------------------- 人课程DIV start ----------------------------->


        <!----------------------- 课程总DIV start ----------------------------->
        <div id="indexcourse">

            <div class="bBigDiv">
                <!--居中div-->
                <div class="bBigCenter">
                    <!--左边的大div-->
                    <div class="bBigLeft">
                        <!--左边的大div上面div-->
                        <div class="bBigLeftTop">IT培训</div>
                        <!--左边的大div下面div-->
                        <div class="bBigLeftBottom">
                            <img src="./img/imgs/img1/It.jpg"/>
                        </div>
                    </div>
                    <!--右边的大div-->
                    <div class="bBigRight">
                        <!--右边的大div上面按钮divAll-->
                        <div id="bQieHuanButton" class="bBigRightTOp">
                            <!--右边的大div上面按钮5个元素-->
                            <a href="#" style="color: #188eee; border-bottom: 3px solid #188eee;"
                               onmouseenter="openurl('coursereflash.jsp?flag=你好')">推荐</a> <a href="#">编程开发</a> <a
                                href="#">工具软件</a> <a href="#">游戏设计</a> <a href="#">最新发布</a>
                        </div>
                        <!--右边的大div下面的切换大div-->
                        <div id="bBigQieHuan1" class="bBigRightBottom">
                            <iframe id="rightFrame" name="rightFrame" width="100%" height="100%"
                                    marginheight="0" marginwidth="0" align="center"
                                    style="border: 0px solid #CCC; margin: 0; padding: 0;"></iframe>
                        </div>
                    </div>
                </div>
            </div>

            <!---------------------IT培训 第一个课程DIV start ------------------------>
            <div class="bBigDiv" id="bBigDivYuYan">
                <!--居中div-->
                <div class="bBigCenter">
                    <!--左边的大div-->
                    <div class="bBigLeft">
                        <!--左边的大div上面div-->
                        <div class="bBigLeftTop">语言学习</div>
                        <!--左边的大div下面div-->
                        <div class="bBigLeftBottom">
                            <img src="./img/imgs/img1/xx.jpg"/>
                        </div>
                    </div>
                    <!--右边的大div-->
                    <div class="bBigRight">
                        <!--右边的大div上面按钮divAll-->
                        <div id="cQieHuanButton" class="bBigRightTOp">
                            <!--右边的大div上面按钮5个元素-->
                            <a href="#" style="color: #188eee; border-bottom: 3px solid #188eee;">推荐</a> <a
                                href="#">英语考试</a> <a href="#">韩语</a> <a href="#">日语</a> <a href="#">最新发布</a>
                        </div>
                        <!--右边的大div下面的切换大div-->
                        <div id="cBigQieHuan1" class="bBigRightBottom">
                            <!--右边的大div下面的切换大div左边框-->
                            <div class="bBigRightBottomLeft">
                                <!------------------------------------------------------------------------------------>
                                <div class="aRongQiDiv">
                                    <!--装图片的a-->
                                    <a class="aImgRongQi" href="#"> <img src="./img/imgs/img2/c11.jpg"/>
                                    </a>
                                    <!--图片下面装字体的元素-->
                                    <a class="aImgBottom" href="#"> 学会EXO歌曲 歌曲学唱【蓝轨迹】 </a>
                                    <!--装费用和学校的div-->
                                    <div class="aBottomDivTwo">
                                        <!--费用“免费”-->
                                        <span class="aBottomDivTwoSpan1">免费</span>
                                        <!--中间的竖线-->
                                        <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                        蓝轨迹 </a>
                                    </div>
                                </div>
                                <!------------------------------------------------------------------------------------>
                                <!------------------------------------------------------------------------------------>
                                <div class="aRongQiDiv">
                                    <!--装图片的a-->
                                    <a class="aImgRongQi" href="#"> <img src="./img/imgs/img2/c12.jpg"/>
                                    </a>
                                    <!--图片下面装字体的元素-->
                                    <a class="aImgBottom" href="#"> 看韩剧学韩语——“消灭”字幕党 </a>
                                    <!--装费用和学校的div-->
                                    <div class="aBottomDivTwo">
                                        <!--费用“免费”-->
                                        <span class="aBottomDivTwoSpan1">免费</span>
                                        <!--中间的竖线-->
                                        <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                        天和智胜 </a>
                                    </div>
                                </div>
                                <!------------------------------------------------------------------------------------>
                                <!------------------------------------------------------------------------------------>
                                <div class="aRongQiDiv">
                                    <!--装图片的a-->
                                    <a class="aImgRongQi" href="#"> <img src="./img/imgs/img2/c13.jpg"/>
                                    </a>
                                    <!--图片下面装字体的元素-->
                                    <a class="aImgBottom" href="#"> 潭州学院-韩语入门基础班免费学 </a>
                                    <!--装费用和学校的div-->
                                    <div class="aBottomDivTwo">
                                        <!--费用“免费”-->
                                        <span class="aBottomDivTwoSpan1">免费</span>
                                        <!--中间的竖线-->
                                        <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                        潭州学院 </a>
                                    </div>
                                </div>
                                <!------------------------------------------------------------------------------------>
                                <!------------------------------------------------------------------------------------>
                                <div class="aRongQiDiv">
                                    <!--装图片的a-->
                                    <a class="aImgRongQi" href="#"> <img src="./img/imgs/img2/c14.jpg"/>
                                    </a>
                                    <!--图片下面装字体的元素-->
                                    <a class="aImgBottom" href="#"> 每天学点日语/零基础免费日语学习 </a>
                                    <!--装费用和学校的div-->
                                    <div class="aBottomDivTwo">
                                        <!--费用“免费”-->
                                        <span class="aBottomDivTwoSpan1">免费</span>
                                        <!--中间的竖线-->
                                        <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                        潭州学院 </a>
                                    </div>
                                </div>
                                <!------------------------------------------------------------------------------------>
                                <!------------------------------------------------------------------------------------>
                                <div class="aRongQiDiv">
                                    <!--装图片的a-->
                                    <a class="aImgRongQi" href="#"> <img src="./img/imgs/img2/c15.jpg"/>
                                    </a>
                                    <!--图片下面装字体的元素-->
                                    <a class="aImgBottom" href="#"> 90后英语：iTop-[英语求职] 潜规则-WeLesson.com </a>
                                    <!--装费用和学校的div-->
                                    <div class="aBottomDivTwo">
                                        <!--费用“免费”-->
                                        <span class="aBottomDivTwoSpan1">免费</span>
                                        <!--中间的竖线-->
                                        <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                        北京新范文化 </a>
                                    </div>
                                </div>
                                <!------------------------------------------------------------------------------------>
                                <!------------------------------------------------------------------------------------>
                                <div class="aRongQiDiv">
                                    <!--装图片的a-->
                                    <a class="aImgRongQi" href="#"> <img src="./img/imgs/img2/c16.jpg"/>
                                    </a>
                                    <!--图片下面装字体的元素-->
                                    <a class="aImgBottom" href="#"> 新概念英语第一册同步（入门） </a>
                                    <!--装费用和学校的div-->
                                    <div class="aBottomDivTwo">
                                        <!--费用“免费”-->
                                        <span class="aBottomDivTwoSpan1">免费</span>
                                        <!--中间的竖线-->
                                        <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                        北京网赢 </a>
                                    </div>
                                </div>
                                <!------------------------------------------------------------------------------------>
                            </div>
                            <!--右边的大div下面的切换大div右边框-----第二切换-->
                            <div class="bBigRightBottomRight">
                                <!--免费和付费大div-->
                                <div class="MoneyDiv">
                                    <!--免费a-->
                                    <a id="cMianFei" href="#"
                                       style="color: #333333; border-bottom: 1px solid #188eee;">免费排行</a>
                                    <!--付费a-->
                                    <a id="cFuFei" href="#">付费排行</a>
                                </div>
                                <!---------------------------------------------------------------------------------------->
                                <div id="cQieHuan1">
                                    <!--下面第1个选项-->
                                    <div class="bFirst">
                                        <!--1-->
                                        <div class="bFirst1">1</div>
                                        <!--1列表旁边的字-->
                                        <a class="bFirstZiA" href="#">2014年12月四六级冲刺班</a> <a class="bFirstImg"
                                                                                            href="#"><img
                                            src="./img/imgs/img2/mf1.jpg"/></a>
                                        <ul class="bFirstUl">
                                            <li>645137人</li>
                                            <li>云中帆教育</li>
                                        </ul>
                                    </div>
                                    <!--下面8个选项-->
                                    <ul class="bEightUl">
                                        <li>
                                            <div class="bEightSX">2</div>
                                            <a href="#"> 四六级名师体验课</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">3</div>
                                            <a href="#"> 英语六级词汇课程</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">4</div>
                                            <a href="#"> 四六级系列体验课</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">5</div>
                                            <a href="#">大学英语四级—体验课程</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">6</div>
                                            <a href="#"> 英语四级综合提高【亿佳教</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">7</div>
                                            <a href="#"> 英语口语四六级冲刺大作战</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">8</div>
                                            <a href="#"> 职称英语理工类（2014年</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">9</div>
                                            <a href="#"> 2016考研复习的一个中心两</a>
                                        </li>
                                    </ul>
                                </div>
                                <!---------------------------------------------------------------------------------------->
                                <!---------------------------------------------------------------------------------------->
                                <div id="cQieHuan2" style="display: none;">
                                    <!--下面第1个选项-->
                                    <div class="bFirst">
                                        <!--1-->
                                        <div class="bFirst1">1</div>
                                        <!--1列表旁边的字-->
                                        <a class="bFirstZiA" href="#">2014年12月四级冲刺班</a> <a class="bFirstImg"
                                                                                           href="#"><img
                                            src="./img/imgs/img2/mf2.jpg"/></a>
                                        <ul class="bFirstUl">
                                            <li>468246人</li>
                                            <li>云中帆教育</li>
                                        </ul>
                                    </div>
                                    <!--下面8个选项-->
                                    <ul class="bEightUl">
                                        <li>
                                            <div class="bEightSX">2</div>
                                            <a href="#"> 陈正康2014考研独家真题</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">3</div>
                                            <a href="#"> 英语四级写作课程</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">4</div>
                                            <a href="#"> 英语学习周刊VIP四级翻译</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">5</div>
                                            <a href="#"> 英语学习周刊VIP四级高分</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">6</div>
                                            <a href="#"> 英语四级词汇课程</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">7</div>
                                            <a href="#"> 2014年12月六级冲刺抢分班</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">8</div>
                                            <a href="#"> 四六级考前重点词汇大串讲</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">9</div>
                                            <a href="#"> 英语六级听力课程</a>
                                        </li>
                                    </ul>
                                </div>
                                <!---------------------------------------------------------------------------------------->
                            </div>
                        </div>
                        <!--大大大大大大大大大大大大大大大大大大大大大大大大大大大大大-->
                        <div id="cBigQieHuan2" class="bBigRightBottom" style="display: none;">
                            <!--右边的大div下面的切换大div左边框-->
                            <div class="bBigRightBottomLeft">
                                <!------------------------------------------------------------------------------------>
                                <div class="aRongQiDiv">
                                    <!--装图片的a-->
                                    <a class="aImgRongQi" href="#"> <img src="./img/imgs/img2/c21.jpg"/>
                                    </a>
                                    <!--图片下面装字体的元素-->
                                    <a class="aImgBottom" href="#"> 英语六级词汇课程 </a>
                                    <!--装费用和学校的div-->
                                    <div class="aBottomDivTwo">
                                        <!--费用“免费”-->
                                        <span class="aBottomDivTwoSpan1">免费</span>
                                        <!--中间的竖线-->
                                        <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                        镇江慧峰管理 </a>
                                    </div>
                                </div>
                                <!------------------------------------------------------------------------------------>
                                <!------------------------------------------------------------------------------------>
                                <div class="aRongQiDiv">
                                    <!--装图片的a-->
                                    <a class="aImgRongQi" href="#"> <img src="./img/imgs/img2/c22.jpg"/>
                                    </a>
                                    <!--图片下面装字体的元素-->
                                    <a class="aImgBottom" href="#"> 英语口语四六级冲刺大作战【洛基英语】 </a>
                                    <!--装费用和学校的div-->
                                    <div class="aBottomDivTwo">
                                        <!--费用“免费”-->
                                        <span class="aBottomDivTwoSpan1">免费</span>
                                        <!--中间的竖线-->
                                        <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                        洛基英语 </a>
                                    </div>
                                </div>
                                <!------------------------------------------------------------------------------------>
                                <!------------------------------------------------------------------------------------>
                                <div class="aRongQiDiv">
                                    <!--装图片的a-->
                                    <a class="aImgRongQi" href="#"> <img src="./img/imgs/img2/c23.jpg"/>
                                    </a>
                                    <!--图片下面装字体的元素-->
                                    <a class="aImgBottom" href="#"> 大学英语四级—体验课程【蓝先生教育】 </a>
                                    <!--装费用和学校的div-->
                                    <div class="aBottomDivTwo">
                                        <!--费用“免费”-->
                                        <span class="aBottomDivTwoSpan1">免费</span>
                                        <!--中间的竖线-->
                                        <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                        蓝先生教育 </a>
                                    </div>
                                </div>
                                <!------------------------------------------------------------------------------------>
                                <!------------------------------------------------------------------------------------>
                                <div class="aRongQiDiv">
                                    <!--装图片的a-->
                                    <a class="aImgRongQi" href="#"> <img src="./img/imgs/img2/c24.jpg"/>
                                    </a>
                                    <!--图片下面装字体的元素-->
                                    <a class="aImgBottom" href="#"> 2014年12月四六级冲刺班 </a>
                                    <!--装费用和学校的div-->
                                    <div class="aBottomDivTwo">
                                        <!--费用“免费”-->
                                        <span class="aBottomDivTwoSpan1">免费</span>
                                        <!--中间的竖线-->
                                        <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                        应试宝 </a>
                                    </div>
                                </div>
                                <!------------------------------------------------------------------------------------>
                                <!------------------------------------------------------------------------------------>
                                <div class="aRongQiDiv">
                                    <!--装图片的a-->
                                    <a class="aImgRongQi" href="#"> <img src="./img/imgs/img2/c25.jpg"/>
                                    </a>
                                    <!--图片下面装字体的元素-->
                                    <a class="aImgBottom" href="#"> 英语四级题型全通过完整版 </a>
                                    <!--装费用和学校的div-->
                                    <div class="aBottomDivTwo">
                                        <!--费用“免费”-->
                                        <span class="aBottomDivTwoSpan1">免费</span>
                                        <!--中间的竖线-->
                                        <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                        对啊网 </a>
                                    </div>
                                </div>
                                <!------------------------------------------------------------------------------------>
                                <!------------------------------------------------------------------------------------>
                                <div class="aRongQiDiv">
                                    <!--装图片的a-->
                                    <a class="aImgRongQi" href="#"> <img src="./img/imgs/img2/c26.jpg"/>
                                    </a>
                                    <!--图片下面装字体的元素-->
                                    <a class="aImgBottom" href="#"> 2014大学英语四级全程通关班 </a>
                                    <!--装费用和学校的div-->
                                    <div class="aBottomDivTwo">
                                        <!--费用“免费”-->
                                        <span class="aBottomDivTwoSpan1">免费</span>
                                        <!--中间的竖线-->
                                        <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                        对啊网 </a>
                                    </div>
                                </div>
                                <!------------------------------------------------------------------------------------>
                            </div>
                            <!--右边的大div下面的切换大div右边框-----第二切换-->
                            <div class="bBigRightBottomRight">
                                <!--免费和付费大div-->
                                <div class="MoneyDiv">
                                    <!--免费a-->
                                    <a id="ccMianFei" href="#"
                                       style="color: #333333; border-bottom: 1px solid #188eee;">免费排行</a>
                                    <!--付费a-->
                                    <a id="ccFuFei" href="#">付费排行</a>
                                </div>
                                <!---------------------------------------------------------------------------------------->
                                <div id="ccQieHuan1">
                                    <!--下面第1个选项-->
                                    <div class="bFirst">
                                        <!--1-->
                                        <div class="bFirst1">1</div>
                                        <!--1列表旁边的字-->
                                        <a class="bFirstZiA" href="#">英语四级写作课程</a> <a class="bFirstImg" href="#"><img
                                            src="./img/imgs/img2/mf2.jpg"/></a>
                                        <ul class="bFirstUl">
                                            <li>356135人</li>
                                            <li>德克特</li>
                                        </ul>
                                    </div>
                                    <!--下面8个选项-->
                                    <ul class="bEightUl">
                                        <li>
                                            <div class="bEightSX">2</div>
                                            <a href="#">2014年12月六级冲刺抢分班</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">3</div>
                                            <a href="#"> 英语学习周刊VIP四级翻译</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">4</div>
                                            <a href="#">英语四级写作课程</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">5</div>
                                            <a href="#"> 英语学习周刊VIP四级高分</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">6</div>
                                            <a href="#"> 英语四级词汇课程</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">7</div>
                                            <a href="#"> 陈正康2014考研独家真题</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">8</div>
                                            <a href="#">英语六级听力课程 </a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">9</div>
                                            <a href="#">四六级考前重点词汇大串讲</a>
                                        </li>
                                    </ul>
                                </div>
                                <!---------------------------------------------------------------------------------------->
                                <!---------------------------------------------------------------------------------------->
                                <div id="ccQieHuan2" style="display: none;">
                                    <!--下面第1个选项-->
                                    <div class="bFirst">
                                        <!--1-->
                                        <div class="bFirst1">1</div>
                                        <!--1列表旁边的字-->
                                        <a class="bFirstZiA" href="#">大学英语四级</a> <a class="bFirstImg" href="#"><img
                                            src="./img/imgs/img2/mf1.jpg"/></a>
                                        <ul class="bFirstUl">
                                            <li>84664人</li>
                                            <li>潭州学院</li>
                                        </ul>
                                    </div>
                                    <!--下面8个选项-->
                                    <ul class="bEightUl">
                                        <li>
                                            <div class="bEightSX">2</div>
                                            <a href="#"> 潭州学院西班牙语VIPA2等</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">3</div>
                                            <a href="#">英语四级综合提高【亿佳教</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">4</div>
                                            <a href="#"> 四六级考前重点词汇大串讲</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">5</div>
                                            <a href="#">大学英语四级—体验课程</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">6</div>
                                            <a href="#">2016考研复习的一个中心两</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">7</div>
                                            <a href="#"> 英语口语四六级冲刺大作战</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">8</div>
                                            <a href="#"> 职称英语理工类（2014年</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">9</div>
                                            <a href="#">英语六级词汇课程</a>
                                        </li>
                                    </ul>
                                </div>
                                <!---------------------------------------------------------------------------------------->
                            </div>
                        </div>
                        <!--大大大大大大大大大大大大大大大大大大大大大大大大大大大大大-->
                        <div id="cBigQieHuan3" class="bBigRightBottom" style="display: none;">
                            <!--右边的大div下面的切换大div左边框-->
                            <div class="bBigRightBottomLeft">
                                <!------------------------------------------------------------------------------------>
                                <div class="aRongQiDiv">
                                    <!--装图片的a-->
                                    <a class="aImgRongQi" href="#"> <img src="./img/imgs/img2/c31.jpg"/>
                                    </a>
                                    <!--图片下面装字体的元素-->
                                    <a class="aImgBottom" href="#"> 韩语零基础直通口语-每天单词（疯狂韩语）【蓝轨迹】 </a>
                                    <!--装费用和学校的div-->
                                    <div class="aBottomDivTwo">
                                        <!--费用“免费”-->
                                        <span class="aBottomDivTwoSpan1">免费</span>
                                        <!--中间的竖线-->
                                        <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                        蓝轨迹 </a>
                                    </div>
                                </div>
                                <!------------------------------------------------------------------------------------>
                                <!------------------------------------------------------------------------------------>
                                <div class="aRongQiDiv">
                                    <!--装图片的a-->
                                    <a class="aImgRongQi" href="#"> <img src="./img/imgs/img2/c32.jpg"/>
                                    </a>
                                    <!--图片下面装字体的元素-->
                                    <a class="aImgBottom" href="#"> 韩语零基础直通口语-每天初级口语（疯狂韩语）【蓝轨迹 </a>
                                    <!--装费用和学校的div-->
                                    <div class="aBottomDivTwo">
                                        <!--费用“免费”-->
                                        <span class="aBottomDivTwoSpan1">免费</span>
                                        <!--中间的竖线-->
                                        <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                        蓝轨迹 </a>
                                    </div>
                                </div>
                                <!------------------------------------------------------------------------------------>
                                <!------------------------------------------------------------------------------------>
                                <div class="aRongQiDiv">
                                    <!--装图片的a-->
                                    <a class="aImgRongQi" href="#"> <img src="./img/imgs/img2/c33.jpg"/>
                                    </a>
                                    <!--图片下面装字体的元素-->
                                    <a class="aImgBottom" href="#"> 轻松学韩语，零基础学习韩语 </a>
                                    <!--装费用和学校的div-->
                                    <div class="aBottomDivTwo">
                                        <!--费用“免费”-->
                                        <span class="aBottomDivTwoSpan1">免费</span>
                                        <!--中间的竖线-->
                                        <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                        潭州学院 </a>
                                    </div>
                                </div>
                                <!------------------------------------------------------------------------------------>
                                <!------------------------------------------------------------------------------------>
                                <div class="aRongQiDiv">
                                    <!--装图片的a-->
                                    <a class="aImgRongQi" href="#"> <img src="./img/imgs/img2/c34.jpg"/>
                                    </a>
                                    <!--图片下面装字体的元素-->
                                    <a class="aImgBottom" href="#"> 潭州学院-韩语入门基础班免费学 </a>
                                    <!--装费用和学校的div-->
                                    <div class="aBottomDivTwo">
                                        <!--费用“免费”-->
                                        <span class="aBottomDivTwoSpan1">免费</span>
                                        <!--中间的竖线-->
                                        <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                        潭州学院 </a>
                                    </div>
                                </div>
                                <!------------------------------------------------------------------------------------>
                                <!------------------------------------------------------------------------------------>
                                <div class="aRongQiDiv">
                                    <!--装图片的a-->
                                    <a class="aImgRongQi" href="#"> <img src="./img/imgs/img2/c35.jpg"/>
                                    </a>
                                    <!--图片下面装字体的元素-->
                                    <a class="aImgBottom" href="#"> 韩语零基础发音技巧班【天和智胜教育】 </a>
                                    <!--装费用和学校的div-->
                                    <div class="aBottomDivTwo">
                                        <!--费用“免费”-->
                                        <span class="aBottomDivTwoSpan1">免费</span>
                                        <!--中间的竖线-->
                                        <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                        天和智胜教育 </a>
                                    </div>
                                </div>
                                <!------------------------------------------------------------------------------------>
                                <!------------------------------------------------------------------------------------>
                                <div class="aRongQiDiv">
                                    <!--装图片的a-->
                                    <a class="aImgRongQi" href="#"> <img src="./img/imgs/img2/c36.jpg"/>
                                    </a>
                                    <!--图片下面装字体的元素-->
                                    <a class="aImgBottom" href="#"> 看韩剧学韩语-女人篇（来自星星的你）【蓝轨迹】 </a>
                                    <!--装费用和学校的div-->
                                    <div class="aBottomDivTwo">
                                        <!--费用“免费”-->
                                        <span class="aBottomDivTwoSpan1">免费</span>
                                        <!--中间的竖线-->
                                        <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                        蓝轨迹 </a>
                                    </div>
                                </div>
                                <!------------------------------------------------------------------------------------>
                            </div>
                            <!--右边的大div下面的切换大div右边框-----第二切换-->
                            <div class="bBigRightBottomRight">
                                <!--免费和付费大div-->
                                <div class="MoneyDiv">
                                    <!--免费a-->
                                    <a id="cccMianFei" href="#"
                                       style="color: #333333; border-bottom: 1px solid #188eee;">免费排行</a>
                                    <!--付费a-->
                                    <a id="cccFuFei" href="#">付费排行</a>
                                </div>
                                <!---------------------------------------------------------------------------------------->
                                <div id="cccQieHuan1">
                                    <!--下面第1个选项-->
                                    <div class="bFirst">
                                        <!--1-->
                                        <div class="bFirst1">1</div>
                                        <!--1列表旁边的字-->
                                        <a class="bFirstZiA" href="#"> 100学时韩国语</a> <a class="bFirstImg" href="#"><img
                                            src="./img/imgs/img2/mf3.jpg"/></a>
                                        <ul class="bFirstUl">
                                            <li>432151人</li>
                                            <li>韩通韩语</li>
                                        </ul>
                                    </div>
                                    <!--下面8个选项-->
                                    <ul class="bEightUl">
                                        <li>
                                            <div class="bEightSX">2</div>
                                            <a href="#"> 【双11活动精选课】旅游</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">3</div>
                                            <a href="#"> 从零基础到topik初级</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">4</div>
                                            <a href="#"> 放学后玩转韩语（基础口语</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">5</div>
                                            <a href="#"> 双11活动精选 韩国旅</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">6</div>
                                            <a href="#"> 跟正雅老师一起学韩语发音 </a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">7</div>
                                            <a href="#"> 零基础学习韩语</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">8</div>
                                            <a href="#"> 韩国留学在线答疑会 </a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">9</div>
                                            <a href="#"> 韩国外教亲自授课 韩语</a>
                                        </li>
                                    </ul>
                                </div>
                                <!---------------------------------------------------------------------------------------->
                                <!---------------------------------------------------------------------------------------->
                                <div id="cccQieHuan2" style="display: none;">
                                    <!--下面第1个选项-->
                                    <div class="bFirst">
                                        <!--1-->
                                        <div class="bFirst1">1</div>
                                        <!--1列表旁边的字-->
                                        <a class="bFirstZiA" href="#">韩语零基础直通口语</a> <a class="bFirstImg" href="#"><img
                                            src="./img/imgs/img2/mf4.jpg"/></a>
                                        <ul class="bFirstUl">
                                            <li>75672人</li>
                                            <li>蓝轨迹</li>
                                        </ul>
                                    </div>
                                    <!--下面8个选项-->
                                    <ul class="bEightUl">
                                        <li>
                                            <div class="bEightSX">2</div>
                                            <a href="#"> 学会EXO歌曲 歌曲学唱</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">3</div>
                                            <a href="#">和韩国外教K老师教你</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">4</div>
                                            <a href="#">韩语零基础直通口语</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">5</div>
                                            <a href="#"> 男神季：看懂韩剧里的韩国</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">6</div>
                                            <a href="#">轻松学韩语，零基础学习</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">7</div>
                                            <a href="#"> 潭州学院-韩语入门基础班</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">8</div>
                                            <a href="#"> 看韩剧学韩语——“消灭</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">9</div>
                                            <a href="#">和韩国外教Ｋ老师一起学《</a>
                                        </li>
                                    </ul>
                                </div>
                                <!---------------------------------------------------------------------------------------->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!---------------------IT培训 第一个课程DIV end   ------------------------>

            <!-------------------- 职业技能 第二个课程DIV start ---------------------->
            <div class="bBigDiv">
                <!--居中div-->
                <div class="bBigCenter">
                    <!--左边的大div-->
                    <div class="bBigLeft">
                        <!--左边的大div上面div-->
                        <div class="bBigLeftTop">职业技能</div>
                        <!--左边的大div下面div-->
                        <div class="bBigLeftBottom">
                            <img src="./img/imgs/img3/zz.jpg"/>
                        </div>
                    </div>
                    <!--右边的大div-->
                    <div class="bBigRight">
                        <!--右边的大div上面按钮divAll-->
                        <div id="dQieHuanButton" class="bBigRightTOp">
                            <!--右边的大div上面按钮5个元素-->
                            <a href="#" style="color: #188eee; border-bottom: 3px solid #188eee;">推荐</a> <a
                                href="#">职场/求职</a> <a href="#">市场营销</a> <a href="#">技能类考试</a> <a href="#">最新发布</a>
                        </div>
                        <!--右边的大div下面的切换大div-->
                        <div id="dBigQieHuan1" class="bBigRightBottom">
                            <!--右边的大div下面的切换大div左边框-->
                            <div class="bBigRightBottomLeft">
                                <!------------------------------------------------------------------------------------>
                                <div class="aRongQiDiv">
                                    <!--装图片的a-->
                                    <a class="aImgRongQi" href="#"> <img src="./img/imgs/img3/d11.jpg"/>
                                    </a>
                                    <!--图片下面装字体的元素-->
                                    <a class="aImgBottom" href="#"> 电气控制技术基础【技成培训】 </a>
                                    <!--装费用和学校的div-->
                                    <div class="aBottomDivTwo">
                                        <!--费用“免费”-->
                                        <span class="aBottomDivTwoSpan1">免费</span>
                                        <!--中间的竖线-->
                                        <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                        技成培训网 </a>
                                    </div>
                                </div>
                                <!------------------------------------------------------------------------------------>
                                <!------------------------------------------------------------------------------------>
                                <div class="aRongQiDiv">
                                    <!--装图片的a-->
                                    <a class="aImgRongQi" href="#"> <img src="./img/imgs/img3/d12.jpg"/>
                                    </a>
                                    <!--图片下面装字体的元素-->
                                    <a class="aImgBottom" href="#"> 【双11活动精选课】“会计原来可以这么学”——解读管理中的动感数据 </a>
                                    <!--装费用和学校的div-->
                                    <div class="aBottomDivTwo">
                                        <!--费用“免费”-->
                                        <span class="aBottomDivTwoSpan1">免费</span>
                                        <!--中间的竖线-->
                                        <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                        中公会计 </a>
                                    </div>
                                </div>
                                <!------------------------------------------------------------------------------------>
                                <!------------------------------------------------------------------------------------>
                                <div class="aRongQiDiv">
                                    <!--装图片的a-->
                                    <a class="aImgRongQi" href="#"> <img src="./img/imgs/img3/d13.jpg"/>
                                    </a>
                                    <!--图片下面装字体的元素-->
                                    <a class="aImgBottom" href="#"> 微信公众平台入门到精通 </a>
                                    <!--装费用和学校的div-->
                                    <div class="aBottomDivTwo">
                                        <!--费用“免费”-->
                                        <span class="aBottomDivTwoSpan1">免费</span>
                                        <!--中间的竖线-->
                                        <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                        完美网络 </a>
                                    </div>
                                </div>
                                <!------------------------------------------------------------------------------------>
                                <!------------------------------------------------------------------------------------>
                                <div class="aRongQiDiv">
                                    <!--装图片的a-->
                                    <a class="aImgRongQi" href="#"> <img src="./img/imgs/img3/d14.jpg"/>
                                    </a>
                                    <!--图片下面装字体的元素-->
                                    <a class="aImgBottom" href="#"> 机械大师教你玩Solidworks【技成培训】 </a>
                                    <!--装费用和学校的div-->
                                    <div class="aBottomDivTwo">
                                        <!--费用“免费”-->
                                        <span class="aBottomDivTwoSpan1">免费</span>
                                        <!--中间的竖线-->
                                        <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                        技成培训网 </a>
                                    </div>
                                </div>
                                <!------------------------------------------------------------------------------------>
                                <!------------------------------------------------------------------------------------>
                                <div class="aRongQiDiv">
                                    <!--装图片的a-->
                                    <a class="aImgRongQi" href="#"> <img src="./img/imgs/img3/d15.jpg"/>
                                    </a>
                                    <!--图片下面装字体的元素-->
                                    <a class="aImgBottom" href="#"> 【双11活动精选课】如何成为一个优秀电工【技成培训】 </a>
                                    <!--装费用和学校的div-->
                                    <div class="aBottomDivTwo">
                                        <!--费用“免费”-->
                                        <span class="aBottomDivTwoSpan1">免费</span>
                                        <!--中间的竖线-->
                                        <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                        技成培训网 </a>
                                    </div>
                                </div>
                                <!------------------------------------------------------------------------------------>
                                <!------------------------------------------------------------------------------------>
                                <div class="aRongQiDiv">
                                    <!--装图片的a-->
                                    <a class="aImgRongQi" href="#"> <img src="./img/imgs/img3/d16.jpg"/>
                                    </a>
                                    <!--图片下面装字体的元素-->
                                    <a class="aImgBottom" href="#"> 平面设计实战入门到精通试听课 </a>
                                    <!--装费用和学校的div-->
                                    <div class="aBottomDivTwo">
                                        <!--费用“免费”-->
                                        <span class="aBottomDivTwoSpan1">免费</span>
                                        <!--中间的竖线-->
                                        <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                        潭州学院 </a>
                                    </div>
                                </div>
                                <!------------------------------------------------------------------------------------>
                            </div>
                            <!--右边的大div下面的切换大div右边框-----第二切换-->
                            <div class="bBigRightBottomRight">
                                <!--免费和付费大div-->
                                <div class="MoneyDiv">
                                    <!--免费a-->
                                    <a id="dMianFei" href="#"
                                       style="color: #333333; border-bottom: 1px solid #188eee;">免费排行</a>
                                    <!--付费a-->
                                    <a id="dFuFei" href="#">付费排行</a>
                                </div>
                                <!---------------------------------------------------------------------------------------->
                                <div id="dQieHuan1">
                                    <!--下面第1个选项-->
                                    <div class="bFirst">
                                        <!--1-->
                                        <div class="bFirst1">1</div>
                                        <!--1列表旁边的字-->
                                        <a class="bFirstZiA" href="#">新手开网店赚钱必学</a> <a class="bFirstImg" href="#"><img
                                            src="./img/imgs/img3/mf1.png"/></a>
                                        <ul class="bFirstUl">
                                            <li>143254人</li>
                                            <li>潭州学院</li>
                                        </ul>
                                    </div>
                                    <!--下面8个选项-->
                                    <ul class="bEightUl">
                                        <li>
                                            <div class="bEightSX">2</div>
                                            <a href="#"> 2015年国考笔试高分速成</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">3</div>
                                            <a href="#">电气控制技术基础</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">4</div>
                                            <a href="#">人际关系和搭讪沟通技巧</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">5</div>
                                            <a href="#">平面设计实战入门到精通试</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">6</div>
                                            <a href="#">淘宝从零开始系列实战运营</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">7</div>
                                            <a href="#">收入倍增，生活无处不销售</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">8</div>
                                            <a href="#">微信公众平台入门到精通</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">9</div>
                                            <a href="#">面设计实战入门到精通试</a>
                                        </li>
                                    </ul>
                                </div>
                                <!---------------------------------------------------------------------------------------->
                                <!---------------------------------------------------------------------------------------->
                                <div id="dQieHuan2" style="display: none;">
                                    <!--下面第1个选项-->
                                    <div class="bFirst">
                                        <!--1-->
                                        <div class="bFirst1">1</div>
                                        <!--1列表旁边的字-->
                                        <a class="bFirstZiA" href="#">【网络演说】赚钱模式</a> <a class="bFirstImg" href="#"><img
                                            src="./img/imgs/img3/mf2.jpg"/></a>
                                        <ul class="bFirstUl">
                                            <li>75462人</li>
                                            <li>云中帆教育</li>
                                        </ul>
                                    </div>
                                    <!--下面8个选项-->
                                    <ul class="bEightUl">
                                        <li>
                                            <div class="bEightSX">2</div>
                                            <a href="#">【双11活动精选课】如何成</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">3</div>
                                            <a href="#">月入10万就学网络演说</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">4</div>
                                            <a href="#">三菱PLC学习机实战到底</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">5</div>
                                            <a href="#">CAD新手必备基础技能</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">6</div>
                                            <a href="#">IE魔法技能之全能密训营</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">7</div>
                                            <a href="#">玩转微信（实操技术课后互</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">8</div>
                                            <a href="#">三菱工控系列答疑</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">9</div>
                                            <a href="#"> SEOVIP解答课程</a>
                                        </li>
                                    </ul>
                                </div>
                                <!---------------------------------------------------------------------------------------->
                            </div>
                        </div>
                        <!--大大大大大大大大大大大大大大大大大大大大大大大大大大大大大-->
                        <div id="dBigQieHuan2" class="bBigRightBottom" style="display: none;">
                            <!--右边的大div下面的切换大div左边框-->
                            <div class="bBigRightBottomLeft">
                                <!------------------------------------------------------------------------------------>
                                <div class="aRongQiDiv">
                                    <!--装图片的a-->
                                    <a class="aImgRongQi" href="#"> <img src="./img/imgs/img3/d21.jpg"/>
                                    </a>
                                    <!--图片下面装字体的元素-->
                                    <a class="aImgBottom" href="#"> 人际关系和搭讪沟通技巧【潭州学院】 </a>
                                    <!--装费用和学校的div-->
                                    <div class="aBottomDivTwo">
                                        <!--费用“免费”-->
                                        <span class="aBottomDivTwoSpan1">免费</span>
                                        <!--中间的竖线-->
                                        <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                        潭州学院 </a>
                                    </div>
                                </div>
                                <!------------------------------------------------------------------------------------>
                                <!------------------------------------------------------------------------------------>
                                <div class="aRongQiDiv">
                                    <!--装图片的a-->
                                    <a class="aImgRongQi" href="#"> <img src="./img/imgs/img3/d22.jpg"/>
                                    </a>
                                    <!--图片下面装字体的元素-->
                                    <a class="aImgBottom" href="#"> 平面设计实战入门到精通试听课 </a>
                                    <!--装费用和学校的div-->
                                    <div class="aBottomDivTwo">
                                        <!--费用“免费”-->
                                        <span class="aBottomDivTwoSpan1">免费</span>
                                        <!--中间的竖线-->
                                        <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                        潭州学院 </a>
                                    </div>
                                </div>
                                <!------------------------------------------------------------------------------------>
                                <!------------------------------------------------------------------------------------>
                                <div class="aRongQiDiv">
                                    <!--装图片的a-->
                                    <a class="aImgRongQi" href="#"> <img src="./img/imgs/img3/d23.jpg"/>
                                    </a>
                                    <!--图片下面装字体的元素-->
                                    <a class="aImgBottom" href="#"> CAD短期培训速成/挑战月薪5000+ </a>
                                    <!--装费用和学校的div-->
                                    <div class="aBottomDivTwo">
                                        <!--费用“免费”-->
                                        <span class="aBottomDivTwoSpan1">免费</span>
                                        <!--中间的竖线-->
                                        <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                        潭州学院 </a>
                                    </div>
                                </div>
                                <!------------------------------------------------------------------------------------>
                                <!------------------------------------------------------------------------------------>
                                <div class="aRongQiDiv">
                                    <!--装图片的a-->
                                    <a class="aImgRongQi" href="#"> <img src="./img/imgs/img3/d24.jpg"/>
                                    </a>
                                    <!--图片下面装字体的元素-->
                                    <a class="aImgBottom" href="#"> 【零基础学习服饰搭配】 </a>
                                    <!--装费用和学校的div-->
                                    <div class="aBottomDivTwo">
                                        <!--费用“免费”-->
                                        <span class="aBottomDivTwoSpan1">免费</span>
                                        <!--中间的竖线-->
                                        <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                        米兰欧国际 </a>
                                    </div>
                                </div>
                                <!------------------------------------------------------------------------------------>
                                <!------------------------------------------------------------------------------------>
                                <div class="aRongQiDiv">
                                    <!--装图片的a-->
                                    <a class="aImgRongQi" href="#"> <img src="./img/imgs/img3/d25.jpg"/>
                                    </a>
                                    <!--图片下面装字体的元素-->
                                    <a class="aImgBottom" href="#"> 心理修行心灵需要一次旅行智慧精品公开课 </a>
                                    <!--装费用和学校的div-->
                                    <div class="aBottomDivTwo">
                                        <!--费用“免费”-->
                                        <span class="aBottomDivTwoSpan1">免费</span>
                                        <!--中间的竖线-->
                                        <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                        邢帅教育 </a>
                                    </div>
                                </div>
                                <!------------------------------------------------------------------------------------>
                                <!------------------------------------------------------------------------------------>
                                <div class="aRongQiDiv">
                                    <!--装图片的a-->
                                    <a class="aImgRongQi" href="#"> <img src="./img/imgs/img3/d26.jpg"/>
                                    </a>
                                    <!--图片下面装字体的元素-->
                                    <a class="aImgBottom" href="#"> 100%找到好工作的秘诀 </a>
                                    <!--装费用和学校的div-->
                                    <div class="aBottomDivTwo">
                                        <!--费用“免费”-->
                                        <span class="aBottomDivTwoSpan1">免费</span>
                                        <!--中间的竖线-->
                                        <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                        达梦教育 </a>
                                    </div>
                                </div>
                                <!------------------------------------------------------------------------------------>
                            </div>
                            <!--右边的大div下面的切换大div右边框-----第二切换-->
                            <div class="bBigRightBottomRight">
                                <!--免费和付费大div-->
                                <div class="MoneyDiv">
                                    <!--免费a-->
                                    <a id="ddMianFei" href="#"
                                       style="color: #333333; border-bottom: 1px solid #188eee;">免费排行</a>
                                    <!--付费a-->
                                    <a id="ddFuFei" href="#">付费排行</a>
                                </div>
                                <!---------------------------------------------------------------------------------------->
                                <div id="ddQieHuan1">
                                    <!--下面第1个选项-->
                                    <div class="bFirst">
                                        <!--1-->
                                        <div class="bFirst1">1</div>
                                        <!--1列表旁边的字-->
                                        <a class="bFirstZiA" href="#">人际关系和搭讪沟通</a> <a class="bFirstImg" href="#"><img
                                            src="./img/imgs/img3/mf3.jpg"/></a>
                                        <ul class="bFirstUl">
                                            <li>643589人</li>
                                            <li>潭州学院</li>
                                        </ul>
                                    </div>
                                    <!--下面8个选项-->
                                    <ul class="bEightUl">
                                        <li>
                                            <div class="bEightSX">2</div>
                                            <a href="#">平面设计实战入门到精通试</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">3</div>
                                            <a href="#">收入倍增，生活无处不销售</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">4</div>
                                            <a href="#"> 【零基础学习服饰搭配】</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">5</div>
                                            <a href="#"> CAD短期培训速成/挑战月</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">6</div>
                                            <a href="#"> 《IE魔法技能训练营之职业</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">7</div>
                                            <a href="#"> PS零基础抠图合成带你玩</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">8</div>
                                            <a href="#"> 21天成就金口才！</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">9</div>
                                            <a href="#">100%创业成功的秘诀、零</a>
                                        </li>
                                    </ul>
                                </div>
                                <!---------------------------------------------------------------------------------------->
                                <!---------------------------------------------------------------------------------------->
                                <div id="ddQieHuan2" style="display: none;">
                                    <!--下面第1个选项-->
                                    <div class="bFirst">
                                        <!--1-->
                                        <div class="bFirst1">1</div>
                                        <!--1列表旁边的字-->
                                        <a class="bFirstZiA" href="#">月入10万就学网络演说</a> <a class="bFirstImg" href="#"><img
                                            src="./img/imgs/img3/mf4.jpg"/></a>
                                        <ul class="bFirstUl">
                                            <li>62380人</li>
                                            <li>云中帆教育</li>
                                        </ul>
                                    </div>
                                    <!--下面8个选项-->
                                    <ul class="bEightUl">
                                        <li>
                                            <div class="bEightSX">2</div>
                                            <a href="#"> CAD新手必备基础技能</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">3</div>
                                            <a href="#">CAD绘图设计班-腾讯课堂</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">4</div>
                                            <a href="#"> IE魔法技能之全能密训营</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">5</div>
                                            <a href="#"> 《2天网络营销精英特训营》</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">6</div>
                                            <a href="#">CAD设计进阶1.0实战</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">7</div>
                                            <a href="#">产品结构工程师培训</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">8</div>
                                            <a href="#">超强人生模式，强悍人生策</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">9</div>
                                            <a href="#">创业开公司20问</a>
                                        </li>
                                    </ul>
                                </div>
                                <!---------------------------------------------------------------------------------------->
                            </div>
                        </div>
                        <!--大大大大大大大大大大大大大大大大大大大大大大大大大大大大大-->
                        <div id="dBigQieHuan3" class="bBigRightBottom" style="display: none;">
                            <!--右边的大div下面的切换大div左边框-->
                            <div class="bBigRightBottomLeft">
                                <!------------------------------------------------------------------------------------>
                                <div class="aRongQiDiv">
                                    <!--装图片的a-->
                                    <a class="aImgRongQi" href="#"> <img src="./img/imgs/img3/d31.jpg"/>
                                    </a>
                                    <!--图片下面装字体的元素-->
                                    <a class="aImgBottom" href="#"> 网络推广（24小时推广机器） </a>
                                    <!--装费用和学校的div-->
                                    <div class="aBottomDivTwo">
                                        <!--费用“免费”-->
                                        <span class="aBottomDivTwoSpan1">免费</span>
                                        <!--中间的竖线-->
                                        <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                        云尧学院 </a>
                                    </div>
                                </div>
                                <!------------------------------------------------------------------------------------>
                                <!------------------------------------------------------------------------------------>
                                <div class="aRongQiDiv">
                                    <!--装图片的a-->
                                    <a class="aImgRongQi" href="#"> <img src="./img/imgs/img3/d32.jpg"/>
                                    </a>
                                    <!--图片下面装字体的元素-->
                                    <a class="aImgBottom" href="#"> 淘宝开店装修运营流程提升网店流量 淘宝客推广 销量打造爆款步骤 </a>
                                    <!--装费用和学校的div-->
                                    <div class="aBottomDivTwo">
                                        <!--费用“免费”-->
                                        <span class="aBottomDivTwoSpan1">免费</span>
                                        <!--中间的竖线-->
                                        <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                        邢帅教育 </a>
                                    </div>
                                </div>
                                <!------------------------------------------------------------------------------------>
                                <!------------------------------------------------------------------------------------>
                                <div class="aRongQiDiv">
                                    <!--装图片的a-->
                                    <a class="aImgRongQi" href="#"> <img src="./img/imgs/img3/d33.png"/>
                                    </a>
                                    <!--图片下面装字体的元素-->
                                    <a class="aImgBottom" href="#"> 淘宝运营实战课堂 </a>
                                    <!--装费用和学校的div-->
                                    <div class="aBottomDivTwo">
                                        <!--费用“免费”-->
                                        <span class="aBottomDivTwoSpan1">免费</span>
                                        <!--中间的竖线-->
                                        <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                        西安久佳 </a>
                                    </div>
                                </div>
                                <!------------------------------------------------------------------------------------>
                                <!------------------------------------------------------------------------------------>
                                <div class="aRongQiDiv">
                                    <!--装图片的a-->
                                    <a class="aImgRongQi" href="#"> <img src="./img/imgs/img3/d34.jpg"/>
                                    </a>
                                    <!--图片下面装字体的元素-->
                                    <a class="aImgBottom" href="#"> 淘宝网店开店数据运营步骤装修上传宝贝教程淘宝客推广课程 </a>
                                    <!--装费用和学校的div-->
                                    <div class="aBottomDivTwo">
                                        <!--费用“免费”-->
                                        <span class="aBottomDivTwoSpan1">免费</span>
                                        <!--中间的竖线-->
                                        <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                        邢帅教育 </a>
                                    </div>
                                </div>
                                <!------------------------------------------------------------------------------------>
                                <!------------------------------------------------------------------------------------>
                                <div class="aRongQiDiv">
                                    <!--装图片的a-->
                                    <a class="aImgRongQi" href="#"> <img src="./img/imgs/img3/d35.jpg"/>
                                    </a>
                                    <!--图片下面装字体的元素-->
                                    <a class="aImgBottom" href="#"> 微信营销：微信营销入门的几个要点 </a>
                                    <!--装费用和学校的div-->
                                    <div class="aBottomDivTwo">
                                        <!--费用“免费”-->
                                        <span class="aBottomDivTwoSpan1">免费</span>
                                        <!--中间的竖线-->
                                        <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                        优势营销 </a>
                                    </div>
                                </div>
                                <!------------------------------------------------------------------------------------>
                                <!------------------------------------------------------------------------------------>
                                <div class="aRongQiDiv">
                                    <!--装图片的a-->
                                    <a class="aImgRongQi" href="#"> <img src="./img/imgs/img3/d36.png"/>
                                    </a>
                                    <!--图片下面装字体的元素-->
                                    <a class="aImgBottom" href="#"> 微博创意：10大内容创意思维方法 </a>
                                    <!--装费用和学校的div-->
                                    <div class="aBottomDivTwo">
                                        <!--费用“免费”-->
                                        <span class="aBottomDivTwoSpan1">免费</span>
                                        <!--中间的竖线-->
                                        <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                        优势营销 </a>
                                    </div>
                                </div>
                                <!------------------------------------------------------------------------------------>
                            </div>
                            <!--右边的大div下面的切换大div右边框-----第二切换-->
                            <div class="bBigRightBottomRight">
                                <!--免费和付费大div-->
                                <div class="MoneyDiv">
                                    <!--免费a-->
                                    <a id="dddMianFei" href="#"
                                       style="color: #333333; border-bottom: 1px solid #188eee;">免费排行</a>
                                    <!--付费a-->
                                    <a id="dddFuFei" href="#">付费排行</a>
                                </div>
                                <!---------------------------------------------------------------------------------------->
                                <div id="dddQieHuan1">
                                    <!--下面第1个选项-->
                                    <div class="bFirst">
                                        <!--1-->
                                        <div class="bFirst1">1</div>
                                        <!--1列表旁边的字-->
                                        <a class="bFirstZiA" href="#">淘宝从零开始系列</a> <a class="bFirstImg" href="#"><img
                                            src="./img/imgs/img3/mf5.jpg"/></a>
                                        <ul class="bFirstUl">
                                            <li>85744人</li>
                                            <li>品牌智造</li>
                                        </ul>
                                    </div>
                                    <!--下面8个选项-->
                                    <ul class="bEightUl">
                                        <li>
                                            <div class="bEightSX">2</div>
                                            <a href="#"> 微信公众平台入门到精通</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">3</div>
                                            <a href="#">淘宝运营实战课堂</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">4</div>
                                            <a href="#"> 网络营销从入门到精通</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">5</div>
                                            <a href="#"> 淘宝开店装修运营流程提升</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">6</div>
                                            <a href="#">电脑组装维护从零开始</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">7</div>
                                            <a href="#">如何玩转微营销</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">8</div>
                                            <a href="#">网络营销从入门到精通</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">9</div>
                                            <a href="#">淘宝网店开店数据运营步骤</a>
                                        </li>
                                    </ul>
                                </div>
                                <!---------------------------------------------------------------------------------------->
                                <!---------------------------------------------------------------------------------------->
                                <div id="dddQieHuan2" style="display: none;">
                                    <!--下面第1个选项-->
                                    <div class="bFirst">
                                        <!--1-->
                                        <div class="bFirst1">1</div>
                                        <!--1列表旁边的字-->
                                        <a class="bFirstZiA" href="#"> 网络营销十八般技术</a> <a class="bFirstImg" href="#"><img
                                            src="./img/imgs/img3/mf6.png"/></a>
                                        <ul class="bFirstUl">
                                            <li>63342人</li>
                                            <li>云中帆教育</li>
                                        </ul>
                                    </div>
                                    <!--下面8个选项-->
                                    <ul class="bEightUl">
                                        <li>
                                            <div class="bEightSX">2</div>
                                            <a href="#"> 玩转微信（实操技术课后互</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">3</div>
                                            <a href="#">CAD绘图设计班-腾讯课堂</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">4</div>
                                            <a href="#"> SEOVIP解答课程【潭州学院】</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">5</div>
                                            <a href="#"> 微营销之《微电商如何打造</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">6</div>
                                            <a href="#"> 【华罡网校】全网营销，一</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">7</div>
                                            <a href="#">网络营销十八般技术</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">8</div>
                                            <a href="#"> 淘宝VIP创业班，不分时间</a>
                                        </li>
                                        <li>
                                            <div class="bEightSX">9</div>
                                            <a href="#"> 微信营销（引流十八式）</a>
                                        </li>
                                    </ul>
                                </div>
                                <!---------------------------------------------------------------------------------------->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-------------------- 职业技能 第二个课程DIV end   ---------------------->

            <!-------------------- 中小学大学的大 第三个课程DIV start ---------------->
            <div class="qBigDiv">
                <!--居中的div-->
                <div class="qCenterDiv">
                    <!--中小学大学上面空白div-->
                    <div class="qTopBlankDiv"></div>
                    <!--左边亲子和图片的大div-->
                    <div class="pLeftBigDiv">
                        <!--亲子div-->
                        <div class="pLeftTopDiv">中小学/大学</div>
                        <!--左边亲子下面的图片div-->
                        <div class="pLeftBottomDiv">
                            <img src="./img/imgs/img4/daXue.png"/>
                        </div>
                    </div>
                    <!--右边推荐等等以及下面切换的大DIV-->
                    <div class="pRightBigDiv">
                        <!--上面的五个切换divAll-->
                        <div id="pQieHuanButton" class="pRightTopDiv">
                            <!--分别5个按钮-->
                            <div style="color: #188eee; border-bottom: 2px solid #188eee;">推荐</div>
                            <div>考研/自考</div>
                            <div>高中</div>
                            <div>初中</div>
                            <div>最新发布</div>
                        </div>
                        <!--需要切换的整个大div-->
                        <div id="pQieHuanOne" class="pRightBottomDiv">
                            <!------------------------------------------------------------------------------------>
                            <div class="aRongQiDiv">
                                <!--装图片的a-->
                                <a class="aImgRongQi" href="#"> <img src="./img/imgs/img4/e1.jpg"/>
                                </a>
                                <!--图片下面装字体的元素-->
                                <a class="aImgBottom" href="#"> 初中数学全册攻略 </a>
                                <!--装费用和学校的div-->
                                <div class="aBottomDivTwo">
                                    <!--费用“免费”-->
                                    <span class="aBottomDivTwoSpan1">免费</span>
                                    <!--中间的竖线-->
                                    <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                    潭州学院 </a>
                                </div>
                            </div>
                            <!------------------------------------------------------------------------------------>
                            <!------------------------------------------------------------------------------------>
                            <div class="aRongQiDiv">
                                <!--装图片的a-->
                                <a class="aImgRongQi" href="#"> <img src="./img/imgs/img4/e2.jpg"/>
                                </a>
                                <!--图片下面装字体的元素-->
                                <a class="aImgBottom" href="#"> 八年级数学全册攻略 </a>
                                <!--装费用和学校的div-->
                                <div class="aBottomDivTwo">
                                    <!--费用“免费”-->
                                    <span class="aBottomDivTwoSpan1">免费</span>
                                    <!--中间的竖线-->
                                    <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                    睿思博考教育 </a>
                                </div>
                            </div>
                            <!------------------------------------------------------------------------------------>
                            <!------------------------------------------------------------------------------------>
                            <div class="aRongQiDiv">
                                <!--装图片的a-->
                                <a class="aImgRongQi" href="#"> <img src="./img/imgs/img4/e3.jpg"/>
                                </a>
                                <!--图片下面装字体的元素-->
                                <a class="aImgBottom" href="#"> 2015考研数学辅导课程-高等数学（李擂） </a>
                                <!--装费用和学校的div-->
                                <div class="aBottomDivTwo">
                                    <!--费用“免费”-->
                                    <span class="aBottomDivTwoSpan1">免费</span>
                                    <!--中间的竖线-->
                                    <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                    中公考研 </a>
                                </div>
                            </div>
                            <!------------------------------------------------------------------------------------>
                        </div>
                        <!--需要切换的整个大div-->
                        <div id="pQieHuanTwo" class="pRightBottomDiv" style="display: none;">
                            <!------------------------------------------------------------------------------------>
                            <div class="aRongQiDiv">
                                <!--装图片的a-->
                                <a class="aImgRongQi" href="#"> <img src="./img/imgs/img4/e4.jpg"/>
                                </a>
                                <!--图片下面装字体的元素-->
                                <a class="aImgBottom" href="#"> 2014年考研最后六十天冲刺班 </a>
                                <!--装费用和学校的div-->
                                <div class="aBottomDivTwo">
                                    <!--费用“免费”-->
                                    <span class="aBottomDivTwoSpan1">免费</span>
                                    <!--中间的竖线-->
                                    <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                    应试宝 </a>
                                </div>
                            </div>
                            <!------------------------------------------------------------------------------------>
                            <!------------------------------------------------------------------------------------>
                            <div class="aRongQiDiv">
                                <!--装图片的a-->
                                <a class="aImgRongQi" href="#"> <img src="./img/imgs/img4/e5.png"/>
                                </a>
                                <!--图片下面装字体的元素-->
                                <a class="aImgBottom" href="#"> 2015会计硕士MPAcc考研公开课 </a>
                                <!--装费用和学校的div-->
                                <div class="aBottomDivTwo">
                                    <!--费用“免费”-->
                                    <span class="aBottomDivTwoSpan1">免费</span>
                                    <!--中间的竖线-->
                                    <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                    学鸣考研 </a>
                                </div>
                            </div>
                            <!------------------------------------------------------------------------------------>
                            <!------------------------------------------------------------------------------------>
                            <div class="aRongQiDiv">
                                <!--装图片的a-->
                                <a class="aImgRongQi" href="#"> <img src="./img/imgs/img4/e6.jpg"/>
                                </a>
                                <!--图片下面装字体的元素-->
                                <a class="aImgBottom" href="#"> 2015考研数学辅导课程-高等数学（李擂） </a>
                                <!--装费用和学校的div-->
                                <div class="aBottomDivTwo">
                                    <!--费用“免费”-->
                                    <span class="aBottomDivTwoSpan1">免费</span>
                                    <!--中间的竖线-->
                                    <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                    中公考研 </a>
                                </div>
                            </div>
                            <!------------------------------------------------------------------------------------>
                        </div>
                    </div>
                </div>
            </div>
            <!-------------------- 中小学大学的大 第三个课程DIV end   ---------------->

            <!-------------------- 兴趣爱好开始 第四个课程DIV start ------------------>
            <div class="qBigDiv" style="background-color: #f9f9f9;">
                <!--居中的div-->
                <div class="qCenterDiv">
                    <!--中小学大学上面空白div-->
                    <div class="qTopBlankDiv"></div>
                    <!--左边亲子和图片的大div-->
                    <div class="pLeftBigDiv">
                        <!--亲子div-->
                        <div class="pLeftTopDiv">兴趣爱好</div>
                        <!--左边亲子下面的图片div-->
                        <div class="pLeftBottomDiv">
                            <img src="./img/imgs/img6/xingQu.png"/>
                        </div>
                    </div>
                    <!--右边推荐等等以及下面切换的大DIV-->
                    <div class="pRightBigDiv">
                        <!--上面的五个切换divAll-->
                        <div id="ppQieHuanButton" class="pRightTopDiv">
                            <!--分别5个按钮-->
                            <div style="color: #188eee; border-bottom: 2px solid #188eee;">推荐</div>
                            <div>生活百科</div>
                            <div>文化艺术</div>
                            <div>时尚健康</div>
                            <div>最新发布</div>
                        </div>
                        <!--需要切换的整个大div-->
                        <div id="ppQieHuanOne" class="pRightBottomDiv">
                            <!------------------------------------------------------------------------------------>
                            <div class="aRongQiDiv">
                                <!--装图片的a-->
                                <a class="aImgRongQi" href="#"> <img src="./img/imgs/img6/f1.jpg"/>
                                </a>
                                <!--图片下面装字体的元素-->
                                <a class="aImgBottom" href="#"> 23-60岁理财必学：《财富的觉醒》 </a>
                                <!--装费用和学校的div-->
                                <div class="aBottomDivTwo">
                                    <!--费用“免费”-->
                                    <span class="aBottomDivTwoSpan1">免费</span>
                                    <!--中间的竖线-->
                                    <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                    今日英才 </a>
                                </div>
                            </div>
                            <!------------------------------------------------------------------------------------>
                            <!------------------------------------------------------------------------------------>
                            <div class="aRongQiDiv">
                                <!--装图片的a-->
                                <a class="aImgRongQi" href="#"> <img src="./img/imgs/img6/f2.jpg"/>
                                </a>
                                <!--图片下面装字体的元素-->
                                <a class="aImgBottom" href="#"> 数码摄影从入门到精通-潭州学院 </a>
                                <!--装费用和学校的div-->
                                <div class="aBottomDivTwo">
                                    <!--费用“免费”-->
                                    <span class="aBottomDivTwoSpan1">免费</span>
                                    <!--中间的竖线-->
                                    <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                    潭州学院 </a>
                                </div>
                            </div>
                            <!------------------------------------------------------------------------------------>
                            <!------------------------------------------------------------------------------------>
                            <div class="aRongQiDiv">
                                <!--装图片的a-->
                                <a class="aImgRongQi" href="#"> <img src="./img/imgs/img6/f3.jpg"/>
                                </a>
                                <!--图片下面装字体的元素-->
                                <a class="aImgBottom" href="#"> 互联网模式之道 </a>
                                <!--装费用和学校的div-->
                                <div class="aBottomDivTwo">
                                    <!--费用“免费”-->
                                    <span class="aBottomDivTwoSpan1">免费</span>
                                    <!--中间的竖线-->
                                    <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                    姜奇平 </a>
                                </div>
                            </div>
                            <!------------------------------------------------------------------------------------>
                        </div>
                        <!--需要切换的整个大div-->
                        <div id="ppQieHuanTwo" class="pRightBottomDiv" style="display: none;">
                            <!------------------------------------------------------------------------------------>
                            <div class="aRongQiDiv">
                                <!--装图片的a-->
                                <a class="aImgRongQi" href="#"> <img src="./img/imgs/img6/f4.jpg"/>
                                </a>
                                <!--图片下面装字体的元素-->
                                <a class="aImgBottom" href="#"> 韩版发饰DIY制作 手工DIY - 【潭州学院】 </a>
                                <!--装费用和学校的div-->
                                <div class="aBottomDivTwo">
                                    <!--费用“免费”-->
                                    <span class="aBottomDivTwoSpan1">免费</span>
                                    <!--中间的竖线-->
                                    <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                    潭州学院 </a>
                                </div>
                            </div>
                            <!------------------------------------------------------------------------------------>
                            <!------------------------------------------------------------------------------------>
                            <div class="aRongQiDiv">
                                <!--装图片的a-->
                                <a class="aImgRongQi" href="#"> <img src="./img/imgs/img6/f5.jpg"/>
                                </a>
                                <!--图片下面装字体的元素-->
                                <a class="aImgBottom" href="#"> 冷老师手工课堂【蓝先生教育】 </a>
                                <!--装费用和学校的div-->
                                <div class="aBottomDivTwo">
                                    <!--费用“免费”-->
                                    <span class="aBottomDivTwoSpan1">免费</span>
                                    <!--中间的竖线-->
                                    <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                    蓝先生教育 </a>
                                </div>
                            </div>
                            <!------------------------------------------------------------------------------------>
                            <!------------------------------------------------------------------------------------>
                            <div class="aRongQiDiv">
                                <!--装图片的a-->
                                <a class="aImgRongQi" href="#"> <img src="./img/imgs/img6/f6.jpg"/>
                                </a>
                                <!--图片下面装字体的元素-->
                                <a class="aImgBottom" href="#"> 风水大师徐梅山为您讲解风水奥秘【天下网校】 </a>
                                <!--装费用和学校的div-->
                                <div class="aBottomDivTwo">
                                    <!--费用“免费”-->
                                    <span class="aBottomDivTwoSpan1">免费</span>
                                    <!--中间的竖线-->
                                    <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                    天下网校 </a>
                                </div>
                            </div>
                            <!------------------------------------------------------------------------------------>
                        </div>
                    </div>
                </div>
            </div>
            <!-------------------- 兴趣爱好开始 第四个课程DIV end   ------------------>

            <!-------------------- 亲子课堂开始 第五个课程DIV start ------------------>
            <div class="qBigDiv">
                <!--居中的div-->
                <div class="qCenterDiv">
                    <!--中小学大学上面空白div-->
                    <div class="qTopBlankDiv"></div>
                    <!--左边亲子和图片的大div-->
                    <div class="pLeftBigDiv">
                        <!--亲子div-->
                        <div class="pLeftTopDiv">亲子课堂</div>
                        <!--左边亲子下面的图片div-->
                        <div class="pLeftBottomDiv">
                            <img src="./img/imgs/img7/qingZi.jpg"/>
                        </div>
                    </div>
                    <!--右边推荐等等以及下面切换的大DIV-->
                    <div class="pRightBigDiv">
                        <!--上面的五个切换divAll-->
                        <div id="pppQieHuanButton" class="pRightTopDiv">
                            <!--分别5个按钮-->
                            <div style="color: #188eee; border-bottom: 2px solid #188eee;">推荐</div>
                            <div>幼儿教育</div>
                            <div>学前教育</div>
                            <div>家长训练营</div>
                            <div>最新发布</div>
                        </div>
                        <!--需要切换的整个大div-->
                        <div id="pppQieHuanOne" class="pRightBottomDiv">
                            <!------------------------------------------------------------------------------------>
                            <div class="aRongQiDiv">
                                <!--装图片的a-->
                                <a class="aImgRongQi" href="#"> <img src="./img/imgs/img7/g1.jpg"/>
                                </a>
                                <!--图片下面装字体的元素-->
                                <a class="aImgBottom" href="#"> 家长的坐标（家庭教育第一品牌—博瑞智家庭教育） </a>
                                <!--装费用和学校的div-->
                                <div class="aBottomDivTwo">
                                    <!--费用“免费”-->
                                    <span class="aBottomDivTwoSpan1">免费</span>
                                    <!--中间的竖线-->
                                    <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                    瑞智家庭教育 </a>
                                </div>
                            </div>
                            <!------------------------------------------------------------------------------------>
                            <!------------------------------------------------------------------------------------>
                            <div class="aRongQiDiv">
                                <!--装图片的a-->
                                <a class="aImgRongQi" href="#"> <img src="./img/imgs/img7/g2.jpg"/>
                                </a>
                                <!--图片下面装字体的元素-->
                                <a class="aImgBottom" href="#"> 用新思维关爱我们的孩子 </a>
                                <!--装费用和学校的div-->
                                <div class="aBottomDivTwo">
                                    <!--费用“免费”-->
                                    <span class="aBottomDivTwoSpan1">免费</span>
                                    <!--中间的竖线-->
                                    <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                    爱情与人生 </a>
                                </div>
                            </div>
                            <!------------------------------------------------------------------------------------>
                            <!------------------------------------------------------------------------------------>
                            <div class="aRongQiDiv">
                                <!--装图片的a-->
                                <a class="aImgRongQi" href="#"> <img src="./img/imgs/img7/g3.jpg"/>
                                </a>
                                <!--图片下面装字体的元素-->
                                <a class="aImgBottom" href="#"> 郭建国教授--亲子学堂 </a>
                                <!--装费用和学校的div-->
                                <div class="aBottomDivTwo">
                                    <!--费用“免费”-->
                                    <span class="aBottomDivTwoSpan1">免费</span>
                                    <!--中间的竖线-->
                                    <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                    山东大嫂 </a>
                                </div>
                            </div>
                            <!------------------------------------------------------------------------------------>
                        </div>
                        <!--需要切换的整个大div-->
                        <div id="pppQieHuanTwo" class="pRightBottomDiv" style="display: none;">
                            <!------------------------------------------------------------------------------------>
                            <div class="aRongQiDiv">
                                <!--装图片的a-->
                                <a class="aImgRongQi" href="#"> <img src="./img/imgs/img7/g4.jpg"/>
                                </a>
                                <!--图片下面装字体的元素-->
                                <a class="aImgBottom" href="#"> Tony亲子英语 </a>
                                <!--装费用和学校的div-->
                                <div class="aBottomDivTwo">
                                    <!--费用“免费”-->
                                    <span class="aBottomDivTwoSpan1">免费</span>
                                    <!--中间的竖线-->
                                    <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                    技成培训网 </a>
                                </div>
                            </div>
                            <!------------------------------------------------------------------------------------>
                            <!------------------------------------------------------------------------------------>
                            <div class="aRongQiDiv">
                                <!--装图片的a-->
                                <a class="aImgRongQi" href="#"> <img src="./img/imgs/img7/g5.jpg"/>
                                </a>
                                <!--图片下面装字体的元素-->
                                <a class="aImgBottom" href="#"> 笔迹心理学 </a>
                                <!--装费用和学校的div-->
                                <div class="aBottomDivTwo">
                                    <!--费用“免费”-->
                                    <span class="aBottomDivTwoSpan1">免费</span>
                                    <!--中间的竖线-->
                                    <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                    深圳市神尔科技 </a>
                                </div>
                            </div>
                            <!------------------------------------------------------------------------------------>
                            <!------------------------------------------------------------------------------------>
                            <div class="aRongQiDiv">
                                <!--装图片的a-->
                                <a class="aImgRongQi" href="#"> <img src="./img/imgs/img7/g6.jpg"/>
                                </a>
                                <!--图片下面装字体的元素-->
                                <a class="aImgBottom" href="#"> 美国最新早教课程（幼儿创造性游戏）【天下网校】 </a>
                                <!--装费用和学校的div-->
                                <div class="aBottomDivTwo">
                                    <!--费用“免费”-->
                                    <span class="aBottomDivTwoSpan1">免费</span>
                                    <!--中间的竖线-->
                                    <span class="aBottomDivTwoSpan2">|</span> <a class="aBottomSchool" href="#">
                                    天下网校 </a>
                                </div>
                            </div>
                            <!------------------------------------------------------------------------------------>
                        </div>
                    </div>
                </div>
            </div>
            <!-------------------- 亲子课堂开始 第五个课程DIV end   ------------------>
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