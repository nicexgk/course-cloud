<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/17
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>个人信息</title>
    <jsp:include page="common/head.jsp"/>
    <!-- 重写导入的样式 -->
    <style>
        .detail-item-header{
            cursor: default;
        }
        .detail-item-ctn .icon .index {
            width: 80px;
            left: -20px;
        }
    </style>
    <script>
        function showinfo( infoid ) {
            if ( infoid == 1) {
                $("#base-info").show();
                $("#avatar-info").hide();
                $("#password-info").hide();
            } else if (infoid == 2){
                $("#base-info").hide();
                $("#avatar-info").show();
                $("#password-info").hide();
            } else {
                $("#base-info").hide();
                $("#avatar-info").hide();
                $("#password-info").show();
            }
        }
    </script>
    <!-- 上传头像 -->
    <script src="js/upload-avatar.js"></script>
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
                    <li class="l-nav-item"><a title="全部订单" href="orders">全部订单</a></li>
                    <li class="l-nav-item"><a title="收藏" href="collections">收藏</a></li>
                    <li class="l-nav-item"><a title="个人信息" href="information" class="active" aria-current="page">个人信息</a></li>
                </ul>
            </div>
        </aside>
        <main class="main">
            <div class="wrapper-plan"><h1 class="wrapper-tt">个人信息</h1>
            </div>

            <!-- 个人信息区 -->
            <div class="details-ctn">
                <!-- 用户基本信息 开始 -->
                <div id="base-info" style="display: block">
                    <h2 class="sections-title">修改基本信息</h2>
                    <form action="updateBaseInfo" method="post">
                        <input type="hidden" name="_method" value="PUT"/>
                        <div class="detail-item-ctn">
                            <div class="detail-item-header">
                                <div class="icon">
                                    <div class="index">用户</div>
                                </div>
                                <div class="section-title"><input name="username" value="${sessionScope.user.userName}"></div>
                            </div>
                        </div>
                        <div class="detail-item-ctn">
                            <div class="detail-item-header">
                                <div class="icon">
                                    <div class="index">邮箱</div>
                                </div>
                                <div class="section-title"><input name="email" value="${sessionScope.user.userEmail}"></div>
                            </div>
                        </div>
                        <div class="detail-item-ctn">
                            <div class="detail-item-header">
                                <div class="icon">
                                    <div class="index">电话</div>
                                </div>
                                <div class="section-title"><input type="tel" name="cellphone" value="${sessionScope.user.userPhone}"></div>
                            </div>
                        </div>
                        <div class="detail-item-ctn">
                            <div class="detail-item-header">
                                <div class="icon">
                                    <div class="index">地址</div>
                                </div>
                                <div class="section-title"><input name="address" value="${sessionScope.user.userAddress}"></div>
                            </div>
                        </div>
                        <div class="detail-item-ctn">
                            <div class="detail-item-header">
                                <div class="icon">
                                    <div class="index">描述</div>
                                </div>
                                <div class="section-title"><input name="description" value="${sessionScope.user.userIntroduce}"></div>
                            </div>
                        </div>
                        <div class="detail-item-ctn">
                            <div class="detail-item-header">
                                <div class="icon">
                                    <div class="index"></div>
                                </div>
                                <div class="section-title"><input type="submit" value="保存"></div>
                            </div>
                        </div>
                        <div class="detail-item-ctn">
                            <div class="detail-item-header">
                                <div class="icon">
                                    <div class="index"></div>
                                </div>
                                <div class="section-title"><a href="javascript:showinfo(2)">修改头像</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:showinfo(3)">修改密码</a></div>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- 用户基本信息 结束 -->

                <!-- 用户头像 开始 -->
                <div id="avatar-info" style="display: none">
                    <h2 class="sections-title">修改头像</h2>
                    <div><img id="avatar" src="${sessionScope.user.userIcon}"/></div>
                    <form id="upload-avatar">
                        <div class="detail-item-ctn">
                            <div class="detail-item-header">
                                <div class="icon">
                                    <div class="index">请选择</div>
                                </div>
                                <div class="section-title"><input type="file" name="file" accept="image/png, image/jpeg" onchange="uploadAvatar()"></div>
                            </div>
                        </div>
                    </form>
                    <form action="updateAvatar" method="post">
                        <input type="hidden" name="_method" value="PUT"/>
                        <input type="hidden" name="avatar" id ="avatar-url">
                        <div class="detail-item-ctn">
                            <div class="detail-item-header">
                                <div class="icon">
                                    <div class="index"></div>
                                </div>
                                <div class="section-title"><input type="submit" value="保存"></div>
                            </div>
                        </div>
                        <div class="detail-item-ctn">
                            <div class="detail-item-header">
                                <div class="icon">
                                    <div class="index"></div>
                                </div>
                                <div class="section-title"><a href="javascript:showinfo(1)">修改基本信息</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:showinfo(3)">修改密码</a></div>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- 用户头像 结束 -->

                <!-- 用户密码 开始 -->
                <div id="password-info" style="display: none">
                    <h2 class="sections-title">修改密码</h2>
                    <form action="updatePassword" method="post">
                        <input type="hidden" name="_method" value="PUT"/>
                        <div class="detail-item-ctn">
                            <div class="detail-item-header">
                                <div class="icon">
                                    <div class="index">原密码</div>
                                </div>
                                <div class="section-title"><input type="password" name="oldPassword"></div>
                            </div>
                        </div>
                        <div class="detail-item-ctn">
                            <div class="detail-item-header">
                                <div class="icon">
                                    <div class="index">新密码</div>
                                </div>
                                <div class="section-title"><input type="password" name="newPassword"></div>
                            </div>
                        </div>
                        <div class="detail-item-ctn">
                            <div class="detail-item-header">
                                <div class="icon">
                                    <div class="index">再密码</div>
                                </div>
                                <div class="section-title"><input type="password" name="rePassword"></div>
                            </div>
                        </div>
                        <div class="detail-item-ctn">
                            <div class="detail-item-header">
                                <div class="icon">
                                    <div class="index"></div>
                                </div>
                                <div class="section-title"><input type="submit" value="保存"></div>
                            </div>
                        </div>
                        <div class="detail-item-ctn">
                            <div class="detail-item-header">
                                <div class="icon">
                                    <div class="index"></div>
                                </div>
                                <div class="section-title"><a href="javascript:showinfo(1)">修改基本信息</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:showinfo(2)">修改头像</a></div>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- 用户密码 结束 -->

            </div>

        </main>
    </section>
    <!-- footer -->
    <jsp:include page="common/footer.jsp"/>
</div>
</body>
</html>
