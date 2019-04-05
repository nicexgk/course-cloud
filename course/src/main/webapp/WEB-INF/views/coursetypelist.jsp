<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="../../css/public.css">
	<link rel="stylesheet" href="../../css/comm.css">
	<link rel="stylesheet" href="../../css/list.css">
	<link rel="stylesheet" type="text/css" href="../../layui/css/layui.css">
	<link rel="stylesheet" type="text/css" href="../../css/mycss/home-page-body.css" />
	<link rel="stylesheet" type="text/css" href="../../css/mycss/home-page.css" />
	<link type="text/css" rel="stylesheet" href="../../css/jsuggest.css">
	<link type="text/css" rel="stylesheet" href="../../css/ling.css" />
	<script src="../../layui/layui.js"></script>
	<script src="../../js/jquery.js"></script>
	<script>
		window.onload = function(){
			var contain_left = window.screen.height;	
			
			var left = document.getElementById("contain_left");
			left.style.height = (contain_left-190)+"px";
		};
	</script>
</head>

<body>
	<!--
    	作者：ling
    	时间：2018年11月22日 14:24:27
    	描述：1.课程类型列表
    -->
	<jsp:include page="/WEB-INF/views/coursemanagernav.jsp"></jsp:include>
	<!-- contain_right start -->
	<div id="contain_right">
		<div id="course_type" class="layui-form">
			<select id="select1" lay-filter="myselect" name="parenttype" onchange="setSecond()">
	        	<option value="0">课程父类</option>
				<option value="0">课程子类</option>
      		</select>
		</div>
		<table class="layui-table courselist-table">
			<colgroup>
		 		<col width="60">
		    	<col width="200">
		    	<col width="150">
		  	</colgroup>
		  	<thead>
		    	<tr>
		      		<th>序号</th>
			     	<th>父类名称</th>
			      	<th>操作</th>
		    	</tr> 
		  	</thead>
		  	<!-- 数据 -->
		  	<tbody id="table-tbody">
		  		
		  	</tbody>
		</table>
		<!-- 分页 -->
		<div id="coursetypepage">
		</div>	
	</div>
	<!-- contain_right end -->	

<script>
	
		layui.use(['laypage','layer','form'], function(){
		  	var laypage = layui.laypage,layer = layui.layer,form=layui.form;
		  	var count = '${requestScope.coursetypesum}';
		  	
		  	form.render();
		  	//执行一个laypage实例 -- 分页
		  	laypage.render({
		    	elem: 'coursetypepage',
		    	count: count,
		    	limit:5,
		    	limits:[5,10,20,30,40],
		    	first:'首页  ',
		    	last:'尾页 ',
		    	curr:location.hash.replace('#contain_right'),
		    	// 分页的回调函数，当分页被触发的时候
		    	//cuur:currPage,
		    	layout:['count','prev','page','next','limit','skip'],
		    	jump:function(obj,first){
		    		// 分页的回调函数，当分页被触发时
		    		//alert(obj.curr+","+obj.limit);
		    		
		    		if(!first){
		    			//	表示第一次不执行，如果没有，就会死循环
		    			$.post("queryAllCourseParentType.action",{page:obj.curr,size:obj.limit},function(res){
		    				data = $.parseJSON(res);	// 将字符串的json数组转成json类型的json数组
		    				//alert(data);
		    				//alert(data[0].courseName);
		    				var str = "";
		    				for(var i=0;i<data.length;i++){
		    					str += "<tr>"
	    							+"<th>"+(((obj.curr-1)*obj.limit)+i+1)+"</th>"
	    							+"<th>"+data[i].parentTypeName+"</th>"
	    							+"<th><div class='layui-btn-group'>"
	    							+"<a href='queryCourseDataById.action?courseid="+data[i].parentTypeId+"' class='layui-btn layui-btn-xs a_menu layui-btn-primary' id='' style='margin-right: 0;font-size:12px;'><i class='layui-icon'>&#xe642;</i>编辑</a>"
						          	+"<a href='javascript:void(0)' onclick='deletecoursetype("+data[i].parentTypeId+")' class='layui-btn layui-btn-xs layui-btn-primary' id='' style='margin-right: 0;font-size:12px;'><i class='layui-icon'>&#xe640;</i>删除</a>"
							        +"</div>"
	    							+"</th>";	    						
		    				}
		    				$("#table-tbody").html(str);
		    				
		    			});
						currPage = obj.curr; //当前页数
						limit = obj.limit;	// 当前显示的条数
						
		    		}else{
		    			// 分页第一次加载
		    			$.post("queryAllCourseParentType.action",{page:obj.curr,size:obj.limit},function(res){
		    				data = $.parseJSON(res);	// 将字符串的json数组转成json类型的json数组
		    				//alert(data);
		    				//alert(data[0].courseName);
		    				var str = "";
		    				for(var i=0;i<data.length;i++){
		    					str += "<tr>"
	    							+"<th>"+(((obj.curr-1)*obj.limit)+i+1)+"</th>"
	    							+"<th>"+data[i].parentTypeName+"</th>"
	    							
	    							+"<th><div class='layui-btn-group'>"
	    							+"<a href='queryCourseDataById.action?courseid="+data[i].parentTypeId+"' class='layui-btn layui-btn-xs a_menu layui-btn-primary' id='' style='margin-right: 0;font-size:12px;'><i class='layui-icon'>&#xe642;</i>编辑</a>"
						          	+"<a href='javascript:void(0)' onclick='deletecoursetype("+data[i].parentTypeId+")' class='layui-btn layui-btn-xs layui-btn-primary' id='' style='margin-right: 0;font-size:12px;'><i class='layui-icon'>&#xe640;</i>删除</a>"
							        +"</div></th>"
	    							+"</tr>";	    						
		    				}
		    				$("#table-tbody").html(str);
		    				
	    				});
		    		}
		    	}
		    	
		  	});
		  	// laypage 分页结束
		});
		
		function deletecoursetype(parenttypeId){
	  		layui.use('layer',function(){
				var layer = layui.layer;
				layer.confirm('确定要删除 ',function(index){
					$.post("deleteCourseParentType.action",{parenttypeId:parenttypeId},function(res){
						var data = $.parseJSON(res);
						if(data.status == "1"){
							layer.msg('删除成功 ');
							location.reload();
						}else if(data.status == "0"){
							layer.msg('删除失败 ');
						}
    				});
				});
			});
	  	}
		function firstvisit(){
			$.post("queryAllCourseType.action",{},function(res){
				data = $.parseJSON(res);	// 将字符串的json数组转成json类型的json数组
				//alert(data);
				//alert(data[0].courseName);
				var str = "";
				for(var i=0;i<data.length;i++){
					str += "<tr>"
						+"<th>"+(((obj.curr-1)*obj.limit)+i+1)+"</th>"
						+"<th>"+data[i].typeName+"</th>"
						+"<th></th>"
						+"<th><div class='layui-btn-group'>"
						+"<a href='queryCourseDataById.action?courseid="+data[i].typeId+"' class='layui-btn layui-btn-xs a_menu layui-btn-primary' id='' style='margin-right: 0;font-size:12px;'><i class='layui-icon'>&#xe642;</i>编辑</a>"
			          	+"<a href='javascript:void(0)' onclick='deletecourse("+data[i].typeId+")' class='layui-btn layui-btn-xs layui-btn-primary' id='' style='margin-right: 0;font-size:12px;'><i class='layui-icon'>&#xe640;</i>删除</a>"
				        +"</div></th>"
						+"</tr>";	    						
				}
				$("#table-tbody").html(str);
				
			});
		}
		
	
	
</script>
</body>
</html>