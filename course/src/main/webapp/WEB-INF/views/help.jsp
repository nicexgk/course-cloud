<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>常见问题帮助中心</title>
	<link rel="stylesheet" href="../../css/public.css">
	<link rel="stylesheet" href="../../css/comm.css">
	<link rel="stylesheet" href="../../css/help.css">
	<script src="../../js/jquery.js"></script>
</head>
<body>
	<div class="header">
		<div class="header-c">
			<div class="logo">
				<a href="list.jsp"><img src="../../img/logo-min2.png"></a>
			</div>
			<div class="nav">
				<a href="../../">首页</a>
				<a href="#" class="nav-bg">课程</a>
				<a href="#">精选合辑</a>
				<a href="#">学团</a>
			</div>
			<div class="search">
				<select id="">
					<option value="">课程</option>
					<option value="">机构</option>
				</select>
				<input type="text" class="search-tex">
				<input type="submit" class="search-btn">
			</div>
			<div class="link">
				<a href="#">登录</a>

				<a href="#" id="no-border">帮助</a>
			</div>
		</div>
	</div>
	<div class="content">
		<div class="content-c">
			<div class="left">
				<ul>
					<dl><h3>学生</h3></dl>
					<li id="li-bg"  data-sid="s1"><p>如何开始学习</p></li>
					<li data-sid="s2"><p>课前准备须知</p></li>
					<li data-sid="s3"><p>支付与退款</p></li>
					<li data-sid="s4"><p>课程分期支付</p></li>
					<li data-sid="s5"><p>优惠券</p></li>
					<li data-sid="s6"><p>承诺与保障</p></li>
					<li data-sid="s7"><p>常见问题</p></li>
				</ul>
				<ul id="teacher">
					<dl><h3>机构/个人老师</h3></dl>
					<li><p>使用指南</p></li>
					<li data-sid="s8"><p>名师计划</p></li>
				</ul>
			</div>
			<div class="right">
				<div class="select" id="s1">
					<h3 class="top-title">如何开始学习</h3>
					<p class="title">1.在开始学习之前，花点时间了解几个基本的概念，可以帮助您更快熟悉腾讯课堂。</p>
					<p class="cont">
						在腾讯课堂中，您可以报名任意的课程，每个课程中含有若干的章和节，每个章或节之下会有若干个学习任务，学习任务的类型包括：直播任务、录播任务、习题任务等，您可以通过各种类型的任务进行学习。当您完成所有的学习任务后，就完成了该门课程的学习。各种课程、章节、学习任务由授课老师安排，如果在课程内容上有任何建议，您可以联系老师沟通。
					</p>
					<p class="title">2.在腾讯课堂可以做什么？</p>
					<p class="cont">
						学习！学习！学习！好学的您可以通过在线直播来与老师实时互动，通过录播视频随时随地学习，通过习题任务进一步地巩固所学的知识，同时可以在任务详情页下载学习资料。当然，效率也很重要！课程表帮您更好地管理自己的学习。您可以在个人中心-课程表页面中查看报名课程以及即将开始的课程。与志同道合的同学们共同进步！您可以加入课程交流群与同学聊天讨论，也可以在学习论坛中发帖参与各种话题的讨论，提高姿势水平。
					</p>
					<p class="title">3.如何开始学习？</p>
					<p class="cont">
						在腾讯课堂中，您可以报名任意的课程，每个课程中含有若干的章和节，每个章或节之下会有若干个学习任务，学习任务的类型包括：直播任务、录播任务、习题任务等，您可以通过各种类型的任务进行学习。当您完成所有的学习任务后，就完成了该门课程的学习。各种课程、章节、学习任务由授课老师安排，如果在课程内容上有任何建议，您可以联系老师沟通。
					</p>
				</div>
				<div class="select" id="s2">
					<h3 class="top-title">课前准备须知</h3>
					<p class="title">1.请确认您已下载最新版本的QQ，点击下方按钮下载最新版QQ：</p>
					<p class="cont">
						在腾讯课堂中，您可以报名任意的课程，每个课程中含有若干的章和节，每个章或节之下会有若干个学习任务，学习任务的类型包括：直播任务、录播任务、习题任务等，您可以通过各种类型的任务进行学习。当您完成所有的学习任务后，就完成了该门课程的学习。各种课程、章节、学习任务由授课老师安排，如果在课程内容上有任何建议，您可以联系老师沟通。
					</p>
					<p class="title">2.在网页报名了课程，如何学习？</p>
					<p class="cont">
						报名课程后，即可在QQ面板上看到与自己相关的课程信息。双击课程即可进入课程的任务列表，或者直播课堂（当有报名课程有直播任务正在直播时）。
					</p>
					<p class="title">3.进入任务列表后，可以做什么？</p>
					<p class="cont">
						您可以在任务列表查看您目前的学习任务，并选择学习任务进行学习。
					</p>
				</div>
				<div class="select" id="s3">
					<h3 class="top-title">支付与退款</h3>
					<p class="title">1.腾讯课堂服务协议</p>
					<p class="cont">
						在腾讯课堂中，您可以报名任意的课程，每个课程中含有若干的章和节，每个章或节之下会有若干个学习任务，学习任务的类型包括：直播任务、录播任务、习题任务等，您可以通过各种类型的任务进行学习。当您完成所有的学习任务后，就完成了该门课程的学习。各种课程、章节、学习任务由授课老师安排，如果在课程内容上有任何建议，您可以联系老师沟通。
					</p>
					<p class="title">2.交易状态说明</p>
					<p class="cont">
						报名课程后，即可在QQ面板上看到与自己相关的课程信息。双击课程即可进入课程的任务列表，或者直播课堂（当有报名课程有直播任务正在直播时）。
					</p>
					<p class="title">3.为何选择某些支付渠道后交易金额比课程金额少？</p>
					<p class="cont">
						因为某些支付渠道会在课程单价的基础上给予一定的折扣。
					</p>
				</div>
				<div class="select" id="s4">
					<p class="title">1.如何通过分期支付购买课程</p>
					<p class="cont">
						在腾讯课堂中，您可以报名任意的课程，每个课程中含有若干的章和节，每个章或节之下会有若干个学习任务，学习任务的类型包括：直播任务、录播任务、习题任务等，您可以通过各种类型的任务进行学习。当您完成所有的学习任务后，就完成了该门课程的学习。各种课程、章节、学习任务由授课老师安排，如果在课程内容上有任何建议，您可以联系老师沟通。
					</p>
					<p class="title">2.分期支付的规则</p>
					<p class="cont">
						报名课程后，即可在QQ面板上看到与自己相关的课程信息。双击课程即可进入课程的任务列表，或者直播课堂（当有报名课程有直播任务正在直播时）。
					</p>
					<p class="title">3.为何选择某些支付渠道后交易金额比课程金额少？</p>
					<p class="cont">
						因为某些支付渠道会在课程单价的基础上给予一定的折扣。
					</p>
				</div>
				<div class="select" id="s5">
					<p class="title">1.如何通过分期支付购买课程</p>
					<p class="cont">
						在腾讯课堂中，您可以报名任意的课程，每个课程中含有若干的章和节，每个章或节之下会有若干个学习任务，学习任务的类型包括：直播任务、录播任务、习题任务等，您可以通过各种类型的任务进行学习。当您完成所有的学习任务后，就完成了该门课程的学习。各种课程、章节、学习任务由授课老师安排，如果在课程内容上有任何建议，您可以联系老师沟通。
					</p>
					<p class="title">2.分期支付的规则</p>
					<p class="cont">
						报名课程后，即可在QQ面板上看到与自己相关的课程信息。双击课程即可进入课程的任务列表，或者直播课堂（当有报名课程有直播任务正在直播时）。
					</p>
					<p class="title">3.为何选择某些支付渠道后交易金额比课程金额少？</p>
					<p class="cont">
						因为某些支付渠道会在课程单价的基础上给予一定的折扣。
					</p>
				</div>
				<div class="select" id="s6">
					<p class="title">1.如何通过分期支付购买课程</p>
					<p class="cont">
						在腾讯课堂中，您可以报名任意的课程，每个课程中含有若干的章和节，每个章或节之下会有若干个学习任务，学习任务的类型包括：直播任务、录播任务、习题任务等，您可以通过各种类型的任务进行学习。当您完成所有的学习任务后，就完成了该门课程的学习。各种课程、章节、学习任务由授课老师安排，如果在课程内容上有任何建议，您可以联系老师沟通。
					</p>
					<p class="title">2.分期支付的规则</p>
					<p class="cont">
						报名课程后，即可在QQ面板上看到与自己相关的课程信息。双击课程即可进入课程的任务列表，或者直播课堂（当有报名课程有直播任务正在直播时）。
					</p>
					<p class="title">3.为何选择某些支付渠道后交易金额比课程金额少？</p>
					<p class="cont">
						因为某些支付渠道会在课程单价的基础上给予一定的折扣。
					</p>
				</div>
				<div class="select" id="s7">
					<p class="title">1.如何通过分期支付购买课程</p>
					<p class="cont">
						在腾讯课堂中，您可以报名任意的课程，每个课程中含有若干的章和节，每个章或节之下会有若干个学习任务，学习任务的类型包括：直播任务、录播任务、习题任务等，您可以通过各种类型的任务进行学习。当您完成所有的学习任务后，就完成了该门课程的学习。各种课程、章节、学习任务由授课老师安排，如果在课程内容上有任何建议，您可以联系老师沟通。
					</p>
					<p class="title">2.分期支付的规则</p>
					<p class="cont">
						报名课程后，即可在QQ面板上看到与自己相关的课程信息。双击课程即可进入课程的任务列表，或者直播课堂（当有报名课程有直播任务正在直播时）。
					</p>
					<p class="title">3.为何选择某些支付渠道后交易金额比课程金额少？</p>
					<p class="cont">
						因为某些支付渠道会在课程单价的基础上给予一定的折扣。
					</p>
				</div>
				<div class="select" id="s8">
					<p class="title">1.如何通过分期支付购买课程</p>
					<p class="cont">
						在腾讯课堂中，您可以报名任意的课程，每个课程中含有若干的章和节，每个章或节之下会有若干个学习任务，学习任务的类型包括：直播任务、录播任务、习题任务等，您可以通过各种类型的任务进行学习。当您完成所有的学习任务后，就完成了该门课程的学习。各种课程、章节、学习任务由授课老师安排，如果在课程内容上有任何建议，您可以联系老师沟通。
					</p>
					<p class="title">2.分期支付的规则</p>
					<p class="cont">
						报名课程后，即可在QQ面板上看到与自己相关的课程信息。双击课程即可进入课程的任务列表，或者直播课堂（当有报名课程有直播任务正在直播时）。
					</p>
					<p class="title">3.为何选择某些支付渠道后交易金额比课程金额少？</p>
					<p class="cont">
						因为某些支付渠道会在课程单价的基础上给予一定的折扣。
					</p>
				</div>
			</div>
		</div>

	</div>
	
	<div class="footer">
		<div class="footer-content">
			<p><img src="../../img/logo-min.png"></p>
			<p>Copyright © 2017 Tencent. All Rights Reserved.</p>
			<p>深圳市腾讯计算机系统有限公司 版权所有 | 腾讯课堂服务协议 | 站点地图</p>
		</div>
	</div>
</body>
<script>
	$(function(){
		$(".left ul li").click(function(){
			var sid=$(this).attr("data-sid");
			if ($.trim(sid)!="") {
				$(".select").hide();
				$("#"+sid).show();
			}
		});
	});
</script>
</html>

