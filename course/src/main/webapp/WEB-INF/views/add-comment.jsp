-<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="format-detection" content="telephone=no,email=no">
<link rel="shortcut icon"
	href="https://8.url.cn/edu/edu_modules/edu-ui/img/nohash/favicon.ico">
<link rel="dns-prefetch" href="https://7.url.cn/">
<link rel="dns-prefetch" href="https://8.url.cn/">
<link rel="dns-prefetch" href="https://9.url.cn/">
<meta name="robots" content="noindex,nofollow">
<meta itemprop="description"
	content="腾讯推出的专业在线教育平台。依托QQ群视频和腾讯视频直播能力，实现老师在线上课教学，学生即时互动学习的课堂。下设职业培训、公务员考试、托福雅思、考证考级、英语口语、中小学教育等众多分类课程。">
<meta itemprop="image"
	content="//9.url.cn/edu/edu_modules/edu-ui/img/nohash/logo_pc_rich.png">
<title>课程评价</title>

<script>window.TRecord=window.TRecord||function(){var e={core:{grandDetail:"1565-1-17",indexNew:"7832-96-24",index:"7832-96-1",courseList:"7832-96-2",courseDetail:"7832-96-3",coursePackage:"7832-96-4",agencyIndex:"7832-96-7",agencyIndexNew:"7832-96-8",agencyTeacher:"7832-96-9",agencyServiceHelp:"7832-96-10",agencyRenzheng:"7832-96-11",404:"7832-96-12",personIndex:"7832-96-13",cateCommonTpl:"7832-96-23",topo:"7832-96-14",topoCourseList:"7832-96-15",searchAgency:"7832-96-16",applySuccess:"7832-96-17",acceptCoupon:"7832-96-18",faq:"7832-96-19",downloadTeacher:"7832-96-20",downloadApp:"7832-96-21",sale:"7832-96-27",next:"1565-1-21"},agency:{applyAgency:"7832-98-1",applyPersonal:"7832-98-2",applyPersonalIntro:"7832-98-3",agencyAdmin:"7832-98-4",billing:"7832-98-5",cdkey:"7832-98-6",graph:"7832-98-7",installDetail:"7832-98-8",installment:"7832-98-9",level:"7832-98-10",mailbox:"7832-98-11",notice:"7832-98-12",orderdetails:"7832-98-13",profile:"7832-98-14",publish:"7832-98-15",publishpacks:"7832-98-16",research:"7832-98-17",schedule:"7832-98-18",serve:"7832-98-19",settlement:"7832-98-20",sign:"7832-98-21",serveReceive:"7832-98-22",scheduleTask:"7832-98-23"},user:{user:"7832-99-1",task:"7832-99-2",comment:"7832-99-3",schedule:"7832-99-4"}},n={url:""},a={};return{cfg:n,maps:e,push:function(e,n){a[e]=n||new Date-0},getCachedData:function(){return{cfg:n,speedPoints:a}}}}(),window.T=window.T||[+new Date],window.TAuto=!0;;;
// for 跳转
  function getQueryValue(n) {
    var m = window.location.search.match(new RegExp("(\\?|&)" + n + "=([^&]*)(&|$)"));
    return !m ? "" : decodeURIComponent(m[2]);
  }
  function getTuinStr() {
    var tuin = getQueryValue('tuin');
    if (tuin) {
      return 'tuin=' + tuin;
    }
    return '';
  }
</script>
<link rel="stylesheet"
	href="../../comments/common.css">
<link rel="stylesheet"
	href="../../comments/comment.css">
<script>TRecord.push('page_css_ready');</script>
<!--[if lt IE 9]><script>var a ='header footer section aside nav article hgroup main time'.split(' ');while(a.length){document.createElement(a.pop());}</script><![endif]-->
<script>window.__DEBUG_STR__ = function(){return ''};window.__DIST_MODE__ = 'dist';</script>

</head>

<script type="text/javascript" src="../../comments/comb.js" crossorigin="anonymous"></script><script type="text/javascript" src="../../comments/edu-base.js" crossorigin="anonymous"></script><script type="text/javascript" src="../../comments/mod.js" crossorigin="anonymous"></script><style type="text/css"></style><script type="text/javascript" src="../../comments/index.js" crossorigin="anonymous"></script></head>

<body class="l-media page-comment">


	<section class="section-main">
		<div class="inner-center">
			<div class="section-comment-write js-section-comment-write">
				<div class="imgtext-course">
					<a class="img-left" target="_blank"
						href="mycourse/${requestScope.course.courseId }"><img
						src="${requestScope.course.picURL }"
						alt="${requestScope.course.courseName }" width="220" height="124"></a>
					<div class="text-right">
						<h1 class="page-tt">
							<a target="_blank" class="page-tt-link"
								href="#course/337848">${requestScope.course.courseName }</a>
						</h1>
						<p class="course-class">${requestScope.course.courseContent }</p>
					</div>
				</div>
	<!--  <script type="text/javascript">
                window.onload=function(){
                	var oSpan=document.getElementsByTagName("i");
                

               var oSpan=document.getElementsByTagName("i");
               for(i=0;i<oSpan.length;i++)
                oSpan[i].onmouseover=function(){
               this.className="icon-font i-star active";}
              for(i=0;i<oSpan.length;i++)
                  oSpan[i].onmouseout=function(){
                 this.className="icon-font i-star";
              }
    
                }
</script>  -->

                  

                  <script type="text/javascript">
                  var xx=5;
                  
                  function myx(op){
                	  
                	xx=$("#myx"+op).data("index");
                	   var oSpan=document.getElementsByTagName("i")
                	   for(i=0;i<xx;i++)
                		   oSpan[i].className="icon-font i-star "
                		   oSpan[xx-1].className="icon-font i-star active";
                  }
                 
              
              function addcomment(){
            	  $("#mygrade").val(xx);
              
              $("#myform").submit();
              }
              </script>
            
				<form id="myform" class="form form--h" method="post" action="addcomment">
					<input type="hidden" name="courseid" value="${requestScope.course.courseId }">
						<input type="hidden" name="userid" value="${sessionScope.user.userId}">
						<input type="hidden" name="mygrade" id="mygrade" >
					<div class="f-item">
						<label class="f-label">课程评分</label>
						<div class="f-field">
							<div class="star-list star-list--comment js-star-list">
								<i id="myx1" data-index="1" class="icon-font i-star" onmousedown="myx(1)"></i> <i  id="myx2"
									data-index="2" class="icon-font i-star" onmousedown="myx(2)"></i> <i id="myx3" data-index="3"
									class="icon-font i-star" onmousedown="myx(3)"></i> <i id="myx4" data-index="4"
									class="icon-font i-star" onmousedown="myx(4)"></i> <i id="myx5" data-index="5"
									class="icon-font i-star" onmousedown="myx(5)"></i>
							</div>
							
						</div>
					</div>
					
					<div class="f-item">
						<label class="f-label">学习感受</label>
						<div class="f-field">
							<div class="textarea-wrap">
								<textarea name="mycontent" class="f-textarea js-f-textarea"
									placeholder="课程怎么样？快来说说学习感受吧" ></textarea>
								<p class="text-remain js-text-remain">
									还可以输入<span class="remain-num js-remain-num">1000</span>字
								</p>
								<p class="comment-error-tips js-error-tips error-hidden"></p>
							</div>
						</div>
					</div>
					</form>
					<div class="f-item f-item--submit">
		
						<div class="f-field">
							<span class="btn-default btn-m js-submit-commment" onclick="addcomment()">发表评价</span>
						</div>
					</div>
				
			</div>
			<div class="section-comment-success js-section-comment-success">
				<!-- <section class="section-msg">
					<i class="icon-msg-large icon-font i-success"></i>
					<div class="msg-text--lines">
						<h3 class="msg-tt">评价成功</h3>
						<a href="#" class="btn-outline btn-m">返回课程</a>
					</div>
				</div>
			</section>
			<section class="section-comment-others">
				<h3 class="section-tt">我还可以评</h3>
				<div class="section-bd">
					<ul class="comment-course-list clearfix">
						<li>
							<a href="#" class="item-img-link"><img src="http://placehold.it/220" width="220" height="124" alt=""></a>
							<h4 class="item-tt"><i class="icon-font i-tupu"></i><a href="#" class="item-tt-link">2015年中级经济师《经济基础》精讲强化班学霸团</a></h4>
							<div class="item-line">
								<a href="#" class="btn-default btn-s">评价</a>
								<a href="#" class="item-source">IT部落窝网络学院</a>
							</div>
						</li>
						<li>
							<a href="#" class="item-img-link"><img src="http://placehold.it/220" width="220" height="124" alt=""></a>
							<h4 class="item-tt"><i class="icon-font i-tupu"></i><a href="#" class="item-tt-link">2015年中级经济师《经济基础》精讲强化班学霸团</a></h4>
							<div class="item-line">
								<a href="#" class="btn-default btn-s">评价</a>
								<a href="#" class="item-source">IT部落窝网络学院</a>
							</div>
						</li>
						<li>
							<a href="#" class="item-img-link"><img src="http://placehold.it/220" width="220" height="124" alt=""></a>
							<h4 class="item-tt"><i class="icon-font i-tupu"></i><a href="#" class="item-tt-link">2015年中级经济师《经济基础》精讲强化班学霸团</a></h4>
							<div class="item-line">
								<a href="#" class="btn-default btn-s">评价</a>
								<a href="#" class="item-source">IT部落窝网络学院</a>
							</div>
						</li>
						<li>
							<a href="#" class="item-img-link"><img src="http://placehold.it/220" width="220" height="124" alt=""></a>
							<h4 class="item-tt"><i class="icon-font i-tupu"></i><a href="#" class="item-tt-link">2015年中级经济师《经济基础》精讲强化班学霸团</a></h4>
							<div class="item-line">
								<a href="#" class="btn-default btn-s">评价</a>
								<a href="#" class="item-source">IT部落窝网络学院</a>
							</div>
						</li>
						<li>
							<a href="#" class="item-img-link"><img src="http://placehold.it/220" width="220" height="124" alt=""></a>
							<h4 class="item-tt"><i class="icon-font i-tupu"></i><a href="#" class="item-tt-link">2015年中级经济师《经济基础》精讲强化班学霸团</a></h4>
							<div class="item-line">
								<a href="#" class="btn-default btn-s">评价</a>
								<a href="#" class="item-source">IT部落窝网络学院</a>
							</div>
						</li>
					</ul>
				</div>
			</section> -->
			</div>
			<div class="section-comment-list">
				<!-- <div class="comment-filter">
				<div class="comment-statistics">
					<span class="statistics-num">94%</span>
					好评度
				</div>
				<div class="f-rc-list filter-comment-rank">
					<label class="f-radio checked"><i class="icon-radio"></i><span class="f-rc-text">全部评价(154)</span></label>
					<label class="f-radio"><i class="icon-radio"></i><span class="f-rc-text">好评(72)</span></label>
					<label class="f-radio"><i class="icon-radio"></i><span class="f-rc-text">中评(63)</span></label>
					<label class="f-radio"><i class="icon-radio"></i><span class="f-rc-text">差评(12)</span></label>
				</div>
			</div>
			<div class="comment-list">
				<div class="comment-item">
					<div class="item-left">
						<img class="user-avatar" src="http://placehold.it/40" width="40" height="40" alt="用户名">
						<p class="user-name">高****</p>
					</div>
					<div class="item-right">
						<div class="star-list">
							<i class="icon-font i-star"></i>
							<i class="icon-font i-star"></i>
							<i class="icon-font i-star"></i>
							<i class="icon-font i-star"></i>
							<i class="icon-font i-star"></i>
						</div>
						<div class="comment-bd">学会该课程，您将快速获得对室内设计基础知识的认识，并牢固地掌握该职业的基础技能快速获得对室内设计基础知识。</div>
						<div class="comment-ft">
							<span class="comment-where"> 评价来自 <a href="#" class="nor-link">《如何学好摄影》</a></span>
							<span class="comment-time">2015年11月23日</span>
						</div>
					</div>
				</div>
				<div class="comment-item">
					<div class="item-left">
						<img class="user-avatar" src="http://placehold.it/40" width="40" height="40" alt="用户名">
						<p class="user-name">高****</p>
					</div>
					<div class="item-right">
						<div class="star-list">
							<i class="icon-font i-star"></i>
							<i class="icon-font i-star"></i>
							<i class="icon-font i-star"></i>
							<i class="icon-font i-star"></i>
							<i class="icon-font i-star"></i>
						</div>
						<div class="comment-bd">学会该课程，您将快速获得对室内设计基础知识的认识，并牢固地掌握该职业的基础技能快速获得对室内设计基础知识。</div>
						<div class="comment-ft">
							<span class="comment-where">学习进度30%时评价</span>
							<span class="comment-time">2015年11月23日</span>
						</div>
						<div class="comment-reply">
							<div class="reply-item">
								<strong class="reply-tt">初次评论：</strong>
								<div class="reply-bd">学会该课程，您将快速获得对室内设计基础知识的认识，并牢固地掌握该职业的基础技能快速获得对室内设计基础知识。</div>
								<div class="comment-ft">
									<span class="comment-where">学习进度30%时评价</span>
									<span class="comment-time">2015年11月23日</span>
								</div>
							</div>
							<div class="reply-item item--agency">
								<strong class="reply-tt">机构回复：</strong>
								<div class="reply-bd">谢谢您的夸奖，我们会继续努力</div>
								<div class="comment-ft">
									<span class="comment-time">2015年11月23日</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="nav-paging nav-paging--mini">
				<a href="#" class="paging-prev disabled">
					<i class="icon-font i-v-left"></i>
				</a>
				<a href="#" class="paging-num active">1</a>
				<a href="#" class="paging-num">2</a>
				<a href="#" class="paging-num">3</a>
				<span class="paging-ellipsis"></span>
				<a href="#" class="paging-num">8</a>
				<a href="#" class="paging-num">9</a>
				<a href="#" class="paging-num">10</a>
				<a href="#" class="paging-next">
					<i class="icon-font i-v-right"></i>
				</a>
			</div> -->
			</div>
			<div class="tab tab--comment-admin">
				<!-- <ul class="tab-hd tab-hd--border">
				<li class="hd-tt active-tt">课程评价</li>
				<li class="hd-tt">老师评价</li>
			</ul>
			<div class="tad-bd">
				<div class="bd-con section-comment-list" style="display: block;">
					<div class="comment-filter">
						<div class="f-autocomplete-select f-select--statistics f-select--teacher selecting" data-name="" data-default="">
							<div class="f-value-wrap">
								<input type="text" class="f-text" placeholder="可输入老师名称或下拉选择">
								<span class="f-select-icon"><i class="icon-arrow-down"></i></span>
							</div>
							<div class="f-select-dropdown">
								<ul class="f-value-list">
									<li data-value="1"><p class="item-tt">龙文宇</p><span class="item-statistics">好评度100%</span></li>
									<li data-value="2"><p class="item-tt">龙文宇龙文宇</p><span class="item-statistics">好评度90%</span></li>
									<li data-value="3"><p class="item-tt">龙文宇龙文宇</p><span class="item-statistics">好评度90%</span></li>
								</ul>
							</div>
						</div>
						<div class="f-autocomplete-select f-select--statistics f-select--course selecting" data-name="" data-default="">
							<div class="f-value-wrap">
								<input type="text" class="f-text" placeholder="可输入课程名称或下拉选择">
								<span class="f-select-icon"><i class="icon-arrow-down"></i></span>
							</div>
							<div class="f-select-dropdown">
								<ul class="f-value-list">
									<li data-value="1"><p class="item-tt">十分钟学会一首吉他弹唱一指通</p><span class="item-statistics">好评度100%</span></li>
									<li data-value="2"><p class="item-tt">十分钟学会一首吉他弹唱一指通</p><span class="item-statistics">好评度90%</span></li>
									<li data-value="3"><p class="item-tt">十分钟学会一首吉他弹唱一指通</p><span class="item-statistics">好评度90%</span></li>
								</ul>
							</div>
						</div>
						<div class="f-rc-list filter-comment-rank">
							<label class="f-radio checked"><i class="icon-radio"></i><span class="f-rc-text">全部评价(154)</span></label>
							<label class="f-radio"><i class="icon-radio"></i><span class="f-rc-text">好评(72)</span></label>
							<label class="f-radio"><i class="icon-radio"></i><span class="f-rc-text">中评(63)</span></label>
							<label class="f-radio"><i class="icon-radio"></i><span class="f-rc-text">差评(12)</span></label>
						</div>
						<div class="f-select f-select--reply" data-name="" data-default="全部">
							<div class="f-value-wrap">
								<div class="f-value">全部</div>
								<span class="f-select-icon"><i class="icon-arrow-down"></i></span>
							</div>
							<div class="f-select-dropdown">
								<ul class="f-value-list">
									<li data-value="1">全部</li>
									<li data-value="2">回复</li>
									<li data-value="3">未回复</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="comment-list comment-list--admin">
						<div class="comment-item">
							<div class="item-left">
								<img class="user-avatar" src="http://placehold.it/60" width="60" height="60" alt="用户名">
								<p class="user-name">dandan</p>
							</div>
							<div class="item-right">
								<div class="star-list">
									<i class="icon-font i-star"></i>
									<i class="icon-font i-star"></i>
									<i class="icon-font i-star"></i>
									<i class="icon-font i-star"></i>
									<i class="icon-font i-star"></i>
								</div>
								<div class="comment-bd">学会该课程，您将快速获得对室内设计基础知识的认识，并牢固地掌握该职业的基础技能快速获得对室内设计基础知识。</div>
								<div class="comment-ft">
									<span class="comment-teacher"> 评价老师 龙文宇</span>
									<span class="comment-where"> 评价来自 <a href="#" class="nor-link">《如何学好摄影》</a></span>
									<span class="comment-time">2015年11月23日</span>
									<a href="#" class="report-link">举报</a>
								</div>
								<div class="item-admin-oper">
									<a href="#" class="reply-link">回复</a>
								</div>
							</div>
							<div class="reply-write-box">
								<i class="btn-close">&times;</i>
								<div class="textarea-wrap">
									<textarea class="f-textarea"></textarea>
								</div>
								<div class="tar"><a href="#" class="btn-default btn-s">发表评论</a></div>
							</div>
						</div>
						<div class="comment-item">
							<div class="item-left">
								<img class="user-avatar" src="http://placehold.it/60" width="60" height="60" alt="用户名">
								<p class="user-name">dandan</p>
							</div>
							<div class="item-right">
								<div class="star-list">
									<i class="icon-font i-star"></i>
									<i class="icon-font i-star"></i>
									<i class="icon-font i-star"></i>
									<i class="icon-font i-star"></i>
									<i class="icon-font i-star"></i>
								</div>
								<div class="comment-bd">学会该课程，您将快速获得对室内设计基础知识的认识，并牢固地掌握该职业的基础技能快速获得对室内设计基础知识。</div>
								<div class="comment-ft">
									<span class="comment-where">学习进度30%时评价</span>
									<span class="comment-time">2015年11月23日</span>
									<a href="#" class="report-link">举报</a>
								</div>
								<div class="item-admin-oper">
									<a href="#" class="reply-link done">已回复</a>
								</div>
								<div class="comment-reply">
									<div class="reply-item">
										<strong class="reply-tt">初次评论：</strong>
										<div class="reply-bd">学会该课程，您将快速获得对室内设计基础知识的认识，并牢固地掌握该职业的基础技能快速获得对室内设计基础知识。</div>
										<div class="comment-ft">
											<span class="comment-where">学习进度30%时评价</span>
											<span class="comment-time">2015年11月23日</span>
										</div>
									</div>
									<div class="reply-item item--agency">
										<strong class="reply-tt">机构回复：</strong>
										<div class="reply-bd">谢谢您的夸奖，我们会继续努力</div>
										<div class="comment-ft">
											<span class="comment-time">2015年11月23日</span>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
					<div class="nav-paging nav-paging--mini">
						<a href="#" class="paging-prev disabled">
							<i class="icon-font i-v-left"></i>
						</a>
						<a href="#" class="paging-num active">1</a>
						<a href="#" class="paging-num">2</a>
						<a href="#" class="paging-num">3</a>
						<span class="paging-ellipsis"></span>
						<a href="#" class="paging-num">8</a>
						<a href="#" class="paging-num">9</a>
						<a href="#" class="paging-num">10</a>
						<a href="#" class="paging-next">
							<i class="icon-font i-v-right"></i>
						</a>
					</div>
				</div>
			</div> -->
			</div>

		</div>
	</section>

	<!--包含尾部进来-->
	<footer class="footer">
		<i class="icon-font i-logo" title="腾讯课堂_专业的在线教育平台"></i>
		<p>Copyright © 2018 Tencent. All Rights Reserved.</p>
		<p>
			深圳市腾讯计算机系统有限公司 版权所有 | <a href="#proService.html"
				target="_blank" rel="nofollow">腾讯课堂服务协议</a> | <a
				href="#sitemap.html" target="_blank">站点地图</a>
		</p>
	</footer>

	<aside class="wrap-side-operation" id="js-side-operation">
		<div class="mod-side-operation">
			<div id="js-async-download" class="side-service-item"
				report-tdw="action=sweep" style="display: none;">
				<a class="side-service-right" href="javascript:void(0);"> <i
					class="icon-font i-file-download item-icon"></i> <span
					id="download-red-point" class="side-red-point"> <span
						id="download-num" data-num="0"></span>
				</span>
				</a>
			</div>
			<div
				class="side-service-item side-service-hover side-service-qq js-c-special">
				<a class="item-link-block"
					href="http://wpa.b.qq.com/cgi/wpa.php?ln=2&amp;uin=800082734"
					target="_blank" report-tdw="action=BQQ_clk&amp;module=agencymanage">
					<i class="icon-font i-qq-border item-icon"></i> <span
					class="item-hover-text">在线客服</span>
				</a>
			</div>
			<div
				class="side-service-item side-service-hover side-service-weixin js-c-special">
				<i class="icon-font i-weixin-border item-icon"></i> <span
					class="item-hover-text">扫码关注</span>
				<div class="item-hover-tips"></div>
			</div>
			<div id="js-private-msgs" class="side-service-item"
				report-tdw="action=sweep">
				<a class="side-service-right" href="javascript:void(0);"> <i
					class="icon-font i-message item-icon"></i> <span id="msg-red-point"
					class="side-red-point" style="display: none;"> <span
						id="red-num"></span>
				</span>
				</a>
			</div>
			<div id="js-qrcode-container"
				class="side-service-item side-service-phone"
				report-tdw="action=sweep">
				<a class="side-service-right"
					href="#" target="_blank"> <i
					class="icon-font i-phone item-icon" id="js-qrcode-icon"></i> <span
					class="item-hover-text" id="js-qrcode-wording">App下载</span> <span
					class="hidden-clip">腾讯课堂【APP Android iPhone 下载】</span>
				</a>
				<div class="item-hover-tips"></div>
			</div>
			<!-- 免费批改作业 mod.revise.scss -->
			<div
				class="side-service-item side-service-qr-code side-service-qr-design-course"
				style="display: none;">
				<a class="side-service-right"> <i
					class="icon-font i-weixin-border item-icon"></i> <span
					class="item-hover-text">官方微信</span>
				</a> <a class="item-hover-tips"> <i class="icon-font i-close"
					id="i_design_course_close"></i> <i class="item-hover-bg"></i>
					<p class="item-hover-title">扫码关注腾讯课堂设计学院，第一时间查看最新批改结果。</p>
				</a>
			</div>
			<div id="js-jump-container" class="js-jump-container">
				<a href="javascript:void(0)" class="mod-side-operation__jump-to-top"
					id="js-jump-to-top"><i class="icon-font i-to-top"></i></a>
				<div id="js-jump-plan-container" class="js-jump-plan-container">
					<a href="javascript:void(0)" class="js-jump-plane" id="js-plane"></a>
				</div>
			</div>
			<iframe id="private-msgs-iframe" class="msg-iframe msg-iframe-show"
				src="//ke.qq.com/letter/index.html" style=""></iframe>
			<iframe id="async-download-iframe"
				class="download-iframe msg-iframe-show"></iframe>
		</div>
	</aside>
</body>
</html>