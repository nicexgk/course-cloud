<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="mycourse">
	<input name="courseid" >
	<input type="submit">
	</form>

</body>
</html>
<script>
	layui.use(['element','upload','form'], function(){
	  	var element = layui.element;
	  	var upload = layui.upload;
	  	var form = layui.form;
	  
	 	 //一些事件监听
	  	element.on('tab(demo)', function(data){
	  		console.log(data);
	 	});
	  	element.on('nav(test)', function(elem){
		  	console.log(elem); //得到当前点击的DOM对象
		});	
		upload.render({
			elem:'#uploadimg',
			url:'/upload/',
			accept:'file',
			exts:'img|jpg|jpeg|png',
			done:function(res){
				
			}
		});
		form.render();
	});
	
</script>