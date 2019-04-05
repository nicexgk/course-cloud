<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>课程列表</title>
	<link rel="stylesheet" href="../../css/public.css">
	<link rel="stylesheet" href="../../css/comm.css">
	<link rel="stylesheet" href="../../css/list.css">
	<script src="../../js/jquery.js"></script>
	<script src="js/public.js"></script>
</head>
<body>
	<div class="header">
		<div class="header-c">
			<div class="logo">
				<a href="../../"><img src="../../img/logo-min2.png"></a>
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
			<div class="cont-left">
				<div class="map">
					<a href="#">全部课程</a>
					&gt;
					<a href="#"> IT · 互联网 </a>
					&gt;
				</div>
				<div class="guide-wrap">
					
					<div class="guide">
						<div class="guide-left">
							<h3>学习方向</h3>
						</div>
						<div class="guide-right">
							<a href="#" class="nav-bg">全部</a>
							<a href="#">互联网产品</a>
							<a href="#">前端开发</a>
							<a href="#">云计算大数据</a>
							<a href="#">认证考试</a>
							<a href="#">硬件开发</a>
							<a href="#">互联网产品</a>
							<a href="#">前端开发</a>
							<a href="#">云计算大数据</a>
							<a href="#">认证考试</a>
							<a href="#">硬件开发</a>
							<a href="#">认证考试</a>
							<a href="#">硬件开发</a>
							<a href="#">认证考试</a>
						</div>
					</div>
					<div class="theme">
						<div class="theme-left">
							<h3>主题：</h3>
						</div>
						<div class="theme-right">
							<a href="#">IT互联网求职季</a>
						</div>
					</div>
				</div>
				<div class="order">
					<ul>
						<li  class="order-bg"><a href="#">综合排序</a></li>
						<li><a href="#">最新</a></li>
						<li><a href="#">评分</a></li>
						<li>
							<a href="#">价格</a>
							<img src="../../img/order.png" alt="">
							
						</li>
						<li>
							<a href="#" id="pri">价格区间</a>
							<img src="../../img/bb.png" alt="">
							<ol class="price">
								<dl><a href="#">不限</a></dl>
								<dl><a href="#">￥1-99</a></dl>
								<dl><a href="#">￥1-99</a></dl>
								<dl><a href="#">￥1-99</a></dl>
								<dl><a href="#">￥1-99</a></dl>
							</ol>
						</li>
						<li data-state="0">
							<input type="checkbox" class="c-box">只看免费公开课
						</li>
						<li data-state="0">
							<input type="checkbox" class="c-box">只看认证课程
						</li>
					</ul>
					<div class="state">
						<ul>
							<li   data-state="0">
								<input type="checkbox" class="c-box">
								正在直播
							</li>
							<li>
								包含任务：
							</li>
							<li  data-state="0">
								直播
								<input type="checkbox" class="c-box">
							</li>
							<li  data-state="0">
								录播
								<input type="checkbox" class="c-box">
							</li>
							<li  data-state="0">
								资料
								<input type="checkbox" class="c-box">
							</li>
							<li  data-state="0">
								习题
								<input type="checkbox" class="c-box">
							</li>
							<li class="li-border">
								增值服务：
							</li>
							<li  data-state="0">
								回放
								<input type="checkbox" class="c-box">
							</li>
							<li  data-state="0">
								试听
								<input type="checkbox" class="c-box">
							</li>
						</ul>
					</div>
				</div>
				<div class="card-group">
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
				<div class="btn-group">
					<input type="button" class="prev" value="&lt;">
					<input type="button" class="btn" value="1">
					<input type="button" class="btn" value="2">
					…
					<input type="button" class="btn" value="33">
					<input type="button" class="btn" value="34">
					<input type="button" class="next" value="&gt;">
				</div>
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
		<div class="like">
			<h3>猜你喜欢</h3>
			<div class="like-card-group">
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
	
	<div class="footer">
		<div class="footer-content">
			<p><img src="../../img/logo-min.png"></p>
			<p>Copyright © 2017 Tencent. All Rights Reserved.</p>
			<p>深圳市腾讯计算机系统有限公司 版权所有 | 腾讯课堂服务协议 | 站点地图</p>
		</div>
	</div>
</body>
</html>
<script>
	$(function(){
		$("li:eq(4)").hover(function(){
			$(this).find(".price").show();
			$(this).css("borderBottom","none").css("background","#f7f7f7");
		},function(){
			$(this).find(".price").hide();
		});
		$("li").click(function(){
				var state=$(this).attr("data-state");
			if (state==0) {
				$(this).attr("data-state","1")
				$(this).find("input").attr("checked","checked");
			}else{
				$(this).attr("data-state","0")
				$(this).find("input").attr("checked",false);
			}
		});
		$(".btn").click(function(){
			$(".btn").css("background","#fff").css("color","#333");
			$(this).css("background","#049ee4").css("color","#fff");
		});
	});
</script>