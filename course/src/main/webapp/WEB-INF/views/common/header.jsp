<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/17
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>header</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="css/jsuggest.css">
    <link rel="stylesheet" href="css/mycss/home-page-body.css">
    <script src="js/jquery.js"></script>
    <script src="/js/jSuggest.js"></script>
    <script src="js/myjs/login-form.js"></script>
    <script src="js/myjs/courseTypeCatalog.js"></script>
    <script>
        $(document).ready(function () {
            //绑定输入框，产生自动补全效果
            $("#js_keyword").jSuggest({
                url: "queryByKey",
                type: "GET",
                data: "key",
                autoChange: true,
                loadingText: '正在查找,请稍后...'
            });
        });
    </script>
</head>
<body>
<header class="header-index" id="js_main_nav">

    <div class="header-index-inner clearfix">
        <a href="." class="header-index-logo" report-tdw="action=rainbow-logo-clk" title="专业的在线教育平台"></a>

        <!--------------- 分类菜单 start ----------------------------->
        <div class="header-index-category js-header-index-category header-index-category__show"
             report-hover="obj1=cates">
            <div class="header-index-category-text">
                <i class="icon-font i-list-index">
                </i>
                <a href="." target="_blank" title="首页">首页</a>
                <a href="." target="_blank" title="首页">课程</a>
            </div>
            <!--导航组件-->
            <div class="mod-nav header-nav" id="navigator">
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
        <!--------------- 分类菜单 end  ------------------------------>

        <!--------------- 搜索框 start ------------------------------->
        <div class="header-index-search" id="js-searchbox">
            <div class="mod-search">
                <a class="mod-search-dropdown">
                </a>
                <!-- 默认搜索词 -->
                <input type="text" id="js_keyword" maxlength="38" class="mod-search__input" placeholder="课程搜索">
                <a id="js_search" href="javascript:void(0)" class="mod-search__btn-search">
                    <i class="icon-font i-search-bold"></i>
                </a>
            </div>
            <div id="js-searchhot" class="header-index-hot">
                <div class="header-index-hot--history" style="display: none;">
                    <div class="hot-word-list"></div>
                </div>
                <!-- 搜索历史及搜索热词 -->
                <div class="header-index-hot--default">
                    <div class="hot-word-list">
                    </div>
                </div>
            </div>
            <div id="js-searchAssociation" class="header-index-hot"></div>
        </div>
        <!--------------- 搜索框 end  -------------------------------->

        <!--------------- 登录按钮 start ----------------------------->
        <div class="header-index-text">
            <!-- 登录相关组件 -->
            <div id="js-mod-header-login" class="mod-header__wrap-login mod-header__wrap-logined">
                <!-- 新版登录 个人 -->
                <!-- 用户未登录 -->
                <div class="mod-header_wrap-user dropdown-wrap" id="js_logout_outer" style="display: ${sessionScope.user == null ? "block" : "none"};">
                    <p class="mod-header__user-name dropdown-tt">
                        <a href="javascript:showDialog();" class="mod-header__user-operation" rel="nofollow"
                           report-hover="module=personalcenter&amp;position=nickname"
                           report-attr="module=personalcenter&amp;position=nickname">
                            <span class="mod-header__user-operation-title">登录</span>
                        </a>
                    </p>
                </div>

                <c:if test="${sessionScope.user != null}">
                    <!-- 用户已登录 -->
                    <div class="mod-header_wrap-user dropdown-wrap" id="js_logout_inter" style="display: block;">
                        <p class="mod-header__user-name dropdown-tt">
                            <a href="information" class="mod-header__user-operation" rel="nofollow"
                               report-hover="module=personalcenter&amp;position=nickname"
                               report-attr="module=personalcenter&amp;position=nickname">
                                <img alt="头像" class="mod-header__user-avatar js-avatar" src="${sessionScope.user.userIcon}">
                                <span class="mod-header__user-operation-title js-username" title="${sessionScope.user.userName}">${sessionScope.user.userName}</span>
                            </a>
                        </p>
                        <ul class="mod-header__user-operations dropdown-list">
                            <li>
                                <a href="courses" class="mod-header__user-operation" rel="nofollow"
                                   report-attr="module=personalcenter&amp;position=class_schedule&amp;ver1=topbar">课程表</a>
                            </li>
                            <li>
                                <a href="orders" class="mod-header__user-operation js-signup" rel="nofollow"
                                   report-attr="module=personalcenter&amp;position=orders&amp;ver1=topbar">全部订单</a>
                            </li>
                            <li>
                                <a href="collections" class="mod-header__user-operation js-fav" rel="nofollow"
                                   report-attr="module=personalcenter&amp;position=collection&amp;ver1=topbar">收藏</a>
                            </li>
                            <li>
                                <a href="information" class="mod-header__user-operation js-userinfo" rel="nofollow"
                                   report-attr="module=personalcenter&amp;position=userinfo&amp;ver1=topbar">个人信息</a>
                            </li>
                            <li>
                                <a href="JavaScript:loginOuter()" data-hook="logout"
                                   class="js_logout mod-header__link-logout js-login-op"
                                   report-attr="module=personalcenter&amp;position=exit&amp;ver1=topbar">退出登录</a>
                            </li>
                        </ul>
                    </div>
                </c:if>
                <c:if test="${sessionScope.user == null}">
                    <!----- 用户没有登录 ----->
                    <div class="mod-header_wrap-user dropdown-wrap" id="js_logout_inter" style="display: none;">
                        <p class="mod-header__user-name dropdown-tt">
                            <a href="information" class="mod-header__user-operation" rel="nofollow"
                               report-hover="module=personalcenter&amp;position=nickname"
                               report-attr="module=personalcenter&amp;position=nickname">
                                <img alt="头像" class="mod-header__user-avatar js-avatar" src="">
                                <span class="mod-header__user-operation-title js-username" title=""></span>
                            </a>
                        </p>
                        <ul class="mod-header__user-operations dropdown-list">
                            <li>
                                <a href="courses" class="mod-header__user-operation" rel="nofollow"
                                   report-attr="module=personalcenter&amp;position=class_schedule&amp;ver1=topbar">课程表</a>
                            </li>
                            <li>
                                <a href="orders" class="mod-header__user-operation js-signup" rel="nofollow"
                                   report-attr="module=personalcenter&amp;position=orders&amp;ver1=topbar">全部订单</a>
                            </li>
                            <li>
                                <a href="collections" class="mod-header__user-operation js-fav" rel="nofollow"
                                   report-attr="module=personalcenter&amp;position=collection&amp;ver1=topbar">收藏</a>
                            </li>
                            <li>
                                <a href="information" class="mod-header__user-operation js-userinfo" rel="nofollow"
                                   report-attr="module=personalcenter&amp;position=userinfo&amp;ver1=topbar">个人信息</a>
                            </li>
                            <li>
                                <a href="JavaScript:loginOuter()" data-hook="logout"
                                   class="js_logout mod-header__link-logout js-login-op"
                                   report-attr="module=personalcenter&amp;position=exit&amp;ver1=topbar">退出登录</a>
                            </li>
                        </ul>
                    </div>
                </c:if>
            </div>
        </div>
        <!--------------- 登录按钮 end ------------------------------->

        <!--------------- 帮助按钮 start ----------------------------->
        <div class="header-index-text header-index-text2 ">
            <!-- 登录相关组件 -->
            <div id="js-mod-header-login2" class="mod-header__wrap-login mod-header__wrap-logined">
                <!-- 新版登录 个人 -->
                <!-- 用户未登录 -->
                <div class="mod-header_wrap-user dropdown-wrap" id="js_logout_outer2" style="display: block;">
                    <p class="mod-header__user-name dropdown-tt">
                        <a href="help.jsp" class="mod-header__user-operation" rel="nofollow"
                           report-hover="module=personalcenter&amp;position=nickname"
                           report-attr="module=personalcenter&amp;position=nickname">
                            <span class="mod-header__user-operation-title">帮助</span>
                        </a>
                    </p>
                </div>
            </div>
        </div>
        <!--------------- 帮助按钮 start ----------------------------->
    </div>

    <!-------------------- 登录框 start ------------------------------>
    <div class="ui-mask" id="mask" onselectstart="return false"></div>
    <div class="ui-dialog" id="dialogMove" onselectstart='return false;'>
        <!-------------------- 登录框 start ------------------------------>
        <div class="ui-dialog-title" id="dialogDrag" onselectstart="return false;">
            登录通行证 <a class="ui-dialog-closebutton" href="javascript:hideDialog();">X</a>
        </div>
        <div id="logindiv" style="display: block;">
            <%--<form action="/user/login" id="loginform" method="post">--%>
            <div class="ui-dialog-content">
                <div class="ui-dialog-l40 ui-dialog-pt15">
                    <input class="ui-dialog-input ui-dialog-input-username" name="user-name" type="text" placeholder="手机/邮箱/用户名" value=""/>
                </div>
                <div class="ui-dialog-l40 ui-dialog-pt15">
                    <input class="ui-dialog-input ui-dialog-input-password" name="user-pwd" type="password" placeholder="密码" value=""/>
                </div>
                <div class="ui-dialog-l40">
                    <input type="checkbox" name="auto-login"><label>自动登录</label>
                </div>
                <div>
                    <a href="JavaScript:login()"><input class="ui-dialog-submit" type="submit" value="登录"></a>
                </div>
                <div class="ui-dialog-l40"><a href="javascript:updateHidden('registerdiv', 'logindiv')">立即注册</a>
                </div>
            </div>
            <%--</form>--%>
        </div>
        <!-------------------- 登录框 end ------------------------------>

        <!-------------------- 注册框 start ---------------------------->
        <%--<div id="registerdiv" style="display: none;">--%>
        <%--<form action="register" id="registerform" method="post">--%>
        <%--<div class="ui-dialog-content">--%>
        <%--<div class="ui-dialog-l40 ui-dialog-pt15">--%>
        <%--<input class="ui-dialog-input ui-dialog-input-username" name="UserName" type="text" placeholder="用户名" value=""/>--%>
        <%--</div>--%>
        <%--<div class="ui-dialog-l40 ui-dialog-pt15">--%>
        <%--<input class="ui-dialog-input ui-dialog-input-password" name="UserPwd" type="password" placeholder="密码" value=""/>--%>
        <%--</div>--%>
        <%--<div class="ui-dialog-l40 ui-dialog-pt15">--%>
        <%--<input class="ui-dialog-input ui-dialog-input-username" name="UserEmail" type="text" placeholder="邮箱" value=""/>--%>
        <%--</div>--%>
        <%--<div class="ui-dialog-l40 ui-dialog-pt15">--%>
        <%--<input class="ui-dialog-input ui-dialog-input-password" name="UserPhone" type="tel" placeholder="手机号" value=""/>--%>
        <%--</div>--%>
        <%--<div class="ui-dialog-l40 ui-dialog-pt15">--%>
        <%--<input class="ui-dialog-input ui-dialog-input-username" name="UserAddress" type="text" placeholder="地址" value=""/>--%>
        <%--</div>--%>
        <%--<div class="ui-dialog-l40 ui-dialog-pt15">--%>
        <%--<input class="ui-dialog-input ui-dialog-input-password" name="UserIcon" type="file" value=""--%>
        <%--style="width: 100%; height: 40px; margin: 0px; padding: 0px; border: 1px solid--%>
        <%--#d5d5d5; font-size: 16px; color: black; text-indent: 25px; outline: none;"/>--%>
        <%--</div>--%>
        <%--<div class="ui-dialog-l40 ui-dialog-pt15">--%>
        <%--<select name="UserType"--%>
        <%--style="width: 100%; height: 40px; margin: 0px; padding: 0px; border: 1px solid #d5d5d5; font-size: 16px; color: black; text-indent: 25px; outline: none;">--%>
        <%--<option value="0">学生</option>--%>
        <%--<option value="1">老师</option>--%>
        <%--<option value="2">管理员</option>--%>
        <%--</select>--%>
        <%--</div>--%>
        <%--<div> <!-- <a class="ui-dialog-submit" href="javascript:showDialog();" >注册</a>  -->--%>
        <%--<input class="ui-dialog-submit" type="submit" value="注册"></div>--%>
        <%--<div class="ui-dialog-l40">--%>
        <%--<a href="javascript:updateHidden('logindiv', 'registerdiv')">已经注册，立即登录</a>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--</form>--%>
        <%--</div>--%>

        <!-------------------- 注册框 end ------------------------------>
    </div>
    <!-------------------- 登录框 start ------------------------------>
</header>

</body>
</html>

