<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>课程列表</title>
	<link rel="stylesheet" href="../../css/public.css">
	<link rel="stylesheet" href="../../css/comm.css">
	<link rel="stylesheet" href="../../css/list.css">
	<script src="../../js/jquery.js"></script>
	
	
	<script type="text/javascript" src="../../js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="../../js/jSuggest.js"></script>
<link rel="stylesheet" type="text/css" href="../../css/jsuggest.css">
<script type="text/javascript">
function logout() {
	return confirm("确定要注销吗？");
	
}



$(document).ready(function(){
	//绑定输入框，产生自动补全效果
	$("#myselect").jSuggest({
		url:"queryByKey",
		type:"GET",
		data:"key",
		autoChange:true,
		loadingText: '正在查找,请稍后...'
	});
	
});
</script>
<script type="text/javascript">
function submitform() {
	var coursename = $("#myselect").val();
	location.href = "queryAllCourse.action?coursename="+coursename;
}

$(document).ready(function(){
	$.getJSON("/course/queryAllParent.action",{},function(data){
		var str = "<a href='#' onclick='return allclass()' class='nav-bg'>全部</a>";
		for(var i=0;i<data.length;i++){
			str = str + "<a href='#' onclick='myclass("+data[i].parentTypeId+")'>"+data[i].parentTypeName+"</a>";
			
		}
		str = str + "</table>";
		$("#parenttype").html(str);
		
		
	})
	

});
function allclass() {
	$.getJSON("/course/queryallclass2.action",{},function(data){
		var str = "";
		for(var i=0;i<data.length;i++){
			str = str + "<a onclick='mycourse("+data[i].typeId+")'>"+data[i].typeName+"</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
		}
		$("#myclass").html(str);
	})
}

function myclass(op) {
	$.getJSON("/course/queryallclass.action",{Pid:op},function(data){
		var str = "";
		for(var i=0;i<data.length;i++){
			str = str + "<a onclick='mycourse("+data[i].typeId+")'>"+data[i].typeName+"</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
		}
		$("#myclass").html(str);
	})
	
}
function mycourse(op) {
	$.getJSON("/course/queryallcourse",{typeId:op},function(data){
		var str = "";
		for(var i=0;i<data.length;i++){
			str = str + "<div class='course-card'><a href='mycourse.action?courseid="+data[i].courseId+"'><div class='course-img'><img src="+data[i].picURL+" alt='course.jsp'><div class='course-info'>报名人数（共"+data[i].coursePersonNumber+"人）</div>"
				+"<div class='course-name'><a href='mycourse.action?courseid="+data[i].courseId+"'>"+data[i].courseName+"</a></div><div class='author'><span>"+data[i].coursePrice+"</span>"
					+"<a href='mycourse.action?courseid="+data[i].courseId+"'>"+data[i].description+"</a></div></div></a></div>"
		}
		$("#mycourse").html(str);
		
		
	})
	
}


</script>
</head>
<body>
	<div class="header">
		<div class="header-c">
			<div class="logo">
				<a href="list.jsp"><img src="../../img/logo-min2.png"></a>
			</div>
			<div class="nav">
				<a href="../../index.jsp">首页</a>
				<a href="queryAllCourse.action" class="nav-bg">课程</a>
				<a href="#">精选合辑</a>
				<a href="#">学团</a>
				<a href="queryAllCourseForManagerList.action" >课程管理</a>
			</div>
			<div class="search">
				<select id="">
					<option value="">课程</option>
					<option value="">机构</option>
				</select>
				
				<input id="myselect" type="text" class="search-tex">
				<input type="submit" class="search-btn" onclick="submitform()">
				
			</div>
			<div class="link">
			<c:if test="${sessionScope.user==null}">
			<a href="#">登录</a>
			<a href="help.jsp" id="no-border">帮助</a>
			</c:if>
			<c:if test="${sessionScope.user!=null}">
			<a href="#">${sessionScope.user.userName}</a>
					<a id="dengLU1" class="mod-header_link-login"
					href="logout" onclick="return logout()">注销</a>
			</c:if>
				
				
			</div>
		</div>
	</div>
	<div class="content">
		<div class="content-c">
			<div class="cont-left">
				<div class="map">
					<a href="">全部课程</a>
					&gt;
					<a href="#"> IT · 互联网 </a>
					&gt;
				</div>
				<div class="guide-wrap">
					
					<div class="guide">
						<div class="guide-left">
							<h3>学习方向</h3>
						</div>
						<div class="guide-right" id="parenttype">
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
						<div class="theme-right" id="myclass">
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
				<!-- 全部课程 -->
				<div class="card-group" id="mycourse">
					<c:forEach items="${requestScope.list}" var="course" >
						<div class="course-card">
							<a href="course.jsp">
								<div class="course-img">
									<img src="${course.getPicURL()} " alt="course.jsp">
									<div class="course-info">随到随学（共59节）</div>
									<div class="course-name">
										<a href="mycourse.action?courseid=${course.getCourseId()}">${course.getCourseName() }</a>
									</div>
									<div class="author">
										<span>${course.getCoursePrice() }</span>
										<a href="mycourse.action?courseid=${course.getCourseId()}">${course.getCourseType().getTypeName()}</a>
									</div>
								</div>
							</a>							
						</div>
					</c:forEach>
					
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