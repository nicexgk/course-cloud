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
    	时间：2018-11-17
    	描述：1.课程概况页面
    -->
	<jsp:include page="/WEB-INF/views/coursemanagernav.jspmanagernav.jsp"></jsp:include>
	<!-- contain_right start -->
	<div id="contain_right">
		<form class="layui-form" action="">
			
			
			<div class="layui-form-item">
			 	<label class="layui-form-label">所属类目</label>
    				<div class="layui-input-block" id="selecttype" >
  						<select name="coursetype" id="coursetype" lay-filter="myselect" lay-verify="required" onchange="changetype()">
					        <option value="0">大类</option>
					        <option value="1">小类</option>
   						</select>
    				</div>
  			</div>  
			
			<div class="layui-form-item">
			    <label class="layui-form-label">课程类别</label>
			    <div class="layui-input-block" >
			    	<input type="text" name="courseparenttype" lay-verify="required" placeholder="请输入课程名称" class="layui-input" style="width:250px;">
			    </div>
			</div>
			
			
			
			<div class="layui-form-item">
				<div class="layui-input-block">
			      	<button class="layui-btn" lay-submit lay-filter="addcoursetypesubmit">添加类别</button>
			      	<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			    </div>
			</div>
		</form>	
	</div>
	<!-- contain_right end -->	
</body>
</html>
<script>
	function setSecond(){
		alert(document.getElementById("select1").value);
		var select1 = $("#select1").val();
		alert(select1);
		
	}
	layui.use(['element','upload','form','layer'], function(){
	  	var element = layui.element,upload = layui.upload
	  		,form = layui.form,layer=layui.layer;

	  
		form.render();
		
		// 表单局部更新
		form.on('select(myselect)',function(data){
			if(data.value==0){
				$("#select2").html("");
				form.render('select');
			}else{
				$.ajax({
			 		type:"get",
			 		url:"queryCourseTypeForPid.action ",
			 		async:true, 	//是否异步
			 		data:{selectvalue:data.value},
			 		success:function(data){
			 			res = $.parseJSON(data);	// 将字符串的json数组转成json类型的json数组
			 			var str = "";
			 			for(var i=0;i<res.length;i++){
			 				str+="<option value='"+res[i].typeId+"'>"+res[i].typeName+"</option>"
			 			}
			 			$("#select2").html(str);
			 			form.render('select');
			 		
			 		}
			 	});
			}
		 	
		});
		// 表单提交
		form.on('submit(addcoursetypesubmit)',function(data){
			var coursetypename = $("input[name='courseparenttype']").val();
			var coursetypevalue = $("select[name='coursetype']").val();
			//var coursetypevalue = $("#coursetype").val();
			// var parenttypeid = $("#select1").val();
			// var coursetypeid = $("#select2").val();
			if(coursetypevalue == "0"){
				// 添加大类
				$.post("addCourseType.action",{coursetypename:coursetypename,coursetypevalue:coursetypevalue},function(res){
					var data = $.parseJSON(res);
					alert(data);
					if(data==0){
						layer.msg('添加成功');
					}else{
						layer.msg('添加失败');
					}
				})
			}else if(coursetypevalue == "1"){
				// 添加小类
				$.post("addCourseType.action",{coursetypename:coursetypename,coursetypevalue:coursetypevalue},function(res){
					var data = $.parseJSON(res);
					alert(data);
					if(data==0){
						layer.msg('添加成功');
					}else{
						layer.msg('添加失败');
					}
				})
			}
			
		    //return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
		});
	});
	
</script>