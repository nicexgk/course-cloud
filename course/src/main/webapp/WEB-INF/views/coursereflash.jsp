<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" type="text/css" href="../../css/mycss/home-page-body.css" />
 <link rel="stylesheet" type="text/css" href="../../css/mycss/home-page.css" />
 <script type="text/javascript" src="../../js/jquery-1.10.2.min.js"></script>
<meta charset="utf-8">
<title></title>
</head>



<body>


<%String myid = request.getParameter("myid");%>
<div id="bBigQieHuan1" class="bBigRightBottom">
<input type="hidden" id="id" value="<%=myid%>">
<script type="text/javascript">
$(document).ready(function(){
	//alert("jin");
	var myid=document.getElementById("id").value;

	$.getJSON("coursereflash",{myid:myid},function(data){
		var str = "";
		for(var i=0;i<data.length;i++){
			str = str + "<div style='height: 200px;border: 1px solid #f9f9f9; float: left;margin-top: 30px;'><a class='aImgRongQi' href='mycourse.action?courseid="+data[i].courseId+"' target='_blank'> <img style='height: 125px;width:200px;' src='"+data[i].picURL+"' /></a><a class='aImgBottom' href='mycourse.action?courseid="+data[i].courseId+"' target='_blank'> "+data[i].courseName+" </a><div class='aBottomDivTwo'><span class='aBottomDivTwoSpan1' style='width: 100px;'>"+data[i].coursePersonNumber+"人报名</span>"
			+"<span class='aBottomDivTwoSpan2'>|</span> <a class='aBottomSchool' target='_blank' href='../跨考直播/跨考直播.html'> "+data[i].courseType.typeName+" </a></div></div>"
	}
		$("#course").html(str);
		
	})
});

</script>
					<!--右边的大div下面的切换大div左边框-->
					<div class="bBigRightBottomLeft" id="course">
						<!------------------------------------------------------------------------------------>
						<div class="aRongQiDiv" id="bRongQiDiv">
							<!--装图片的a-->
							<a class="aImgRongQi" href="#"> <img
								src="../../img/imgs/img1/b11.jpg" />
							</a>
							<!--图片下面装字体的元素-->
							<a class="aImgBottom" href="#"> lalalalalal </a>
							<!--装费用和学校的div-->
							<div class="aBottomDivTwo">
								<!--费用“免费”-->
								<span class="aBottomDivTwoSpan1">免费</span>
								<!--中间的竖线-->
								<span class="aBottomDivTwoSpan2">|</span> <a
									class="aBottomSchool" href="#"> 云中帆教育 </a>
							</div>
						</div>
						<!------------------------------------------------------------------------------------>
						<!------------------------------------------------------------------------------------>
						<div class="aRongQiDiv" id="bRongQiDiv">
							<!--装图片的a-->
							<a class="aImgRongQi" href="#"> <img
								src="../../img/imgs/img1/b12.jpg" />
							</a>
							<!--图片下面装字体的元素-->
							<a class="aImgBottom" href="#"> 设计师圆你设计梦（小白的设计师之路） </a>
							<!--装费用和学校的div-->
							<div class="aBottomDivTwo">
								<!--费用“免费”-->
								<span class="aBottomDivTwoSpan1">免费</span>
								<!--中间的竖线-->
								<span class="aBottomDivTwoSpan2">|</span> <a
									class="aBottomSchool" href="#"> 云中帆教育 </a>
							</div>
						</div>
						<!------------------------------------------------------------------------------------>
						<!------------------------------------------------------------------------------------>
						<div class="aRongQiDiv" id="bRongQiDiv">
							<!--装图片的a-->
							<a class="aImgRongQi" href="#"> <img
								src="../../img/imgs/img1/b13.jpg" />
							</a>
							<!--图片下面装字体的元素-->
							<a class="aImgBottom" href="#"> 2015最新Java零基础项目实战-高薪入职课【潭州学院】
							</a>
							<!--装费用和学校的div-->
							<div class="aBottomDivTwo">
								<!--费用“免费”-->
								<span class="aBottomDivTwoSpan1">免费</span>
								<!--中间的竖线-->
								<span class="aBottomDivTwoSpan2">|</span> <a
									class="aBottomSchool" href="#"> 潭州学院 </a>
							</div>
						</div>
						<!------------------------------------------------------------------------------------>
						<!------------------------------------------------------------------------------------>
						<div class="aRongQiDiv" id="bRongQiDiv">
							<!--装图片的a-->
							<a class="aImgRongQi" href="#"> <img
								src="../../img/imgs/img1/b14.jpg" />
							</a>
							<!--图片下面装字体的元素-->
							<a class="aImgBottom" href="#"> 大神驾到--揭秘微信游戏内幕（HTML5）【天地君道培训】
							</a>
							<!--装费用和学校的div-->
							<div class="aBottomDivTwo">
								<!--费用“免费”-->
								<span class="aBottomDivTwoSpan1">免费</span>
								<!--中间的竖线-->
								<span class="aBottomDivTwoSpan2">|</span> <a
									class="aBottomSchool" href="#"> 天地君道培训 </a>
							</div>
						</div>
						<!------------------------------------------------------------------------------------>
						<!------------------------------------------------------------------------------------>
						<div class="aRongQiDiv" id="bRongQiDiv">
							<!--装图片的a-->
							<a class="aImgRongQi" href="#"> <img
								src="../../img/imgs/img1/b15.jpg" />
							</a>
							<!--图片下面装字体的元素-->
							<a class="aImgBottom" href="#"> PS教程PS基础速成精品课，由浅入深，入门必看 </a>
							<!--装费用和学校的div-->
							<div class="aBottomDivTwo">
								<!--费用“免费”-->
								<span class="aBottomDivTwoSpan1">免费</span>
								<!--中间的竖线-->
								<span class="aBottomDivTwoSpan2">|</span> <a
									class="aBottomSchool" href="#"> 邢帅教育 </a>
							</div>
						</div>
						<!------------------------------------------------------------------------------------>
						<!------------------------------------------------------------------------------------>
						<div class="aRongQiDiv" id="bRongQiDiv">
							<!--装图片的a-->
							<a class="aImgRongQi" href="#"> <img
								src="../../img/imgs/img1/b16.jpg" />
							</a>
							<!--图片下面装字体的元素-->
							ax <a class="aImgBottom" href="#"> 【全套】PS教程 PS入门 【龙飞老师】主讲 </a>
							<!--装费用和学校的div-->
							<div class="aBottomDivTwo">
								<!--费用“免费”-->
								<span class="aBottomDivTwoSpan1">免费</span>
								<!--中间的竖线-->
								<span class="aBottomDivTwoSpan2">|</span> <a
									class="aBottomSchool" href="#"> 茶树网学院 </a>
							</div>
						</div>
						<!------------------------------------------------------------------------------------>
					</div>
					<!--右边的大div下面的切换大div右边框-----第二切换-->
					<div class="bBigRightBottomRight">
						<!--免费和付费大div-->
						<div class="MoneyDiv">
							<!--免费a-->
							<a id="bMianFei" href="#"
								style="color: #333333; border-bottom: 1px solid #188eee;">免费排行</a>
							<!--付费a-->
							<a id="bFuFei" href="#">付费排行</a>
						</div>
						<!---------------------------------------------------------------------------------------->
						<div id="bQieHuan1">
							<!--下面第1个选项-->
							<div class="bFirst">
								<!--1-->
								<div class="bFirst1">1</div>
								<!--1列表旁边的字-->
								<a class="bFirstZiA" href="#">CAD绘图设计班-腾讯</a> <a
									class="bFirstImg" href="#"><img
									src="../../img/imgs/img1/mf5.jpg" /></a>
								<ul class="bFirstUl">
									<li>735634人</li>
									<li id="bFirstUlTwo">云中帆教育</li>
								</ul>
							</div>
							<!--下面8个选项-->
							<ul class="bEightUl">
								<li>
									<div class="bEightSX" id="bEightSX2">2</div> <a href="#">3Dmax建模（快速搞定入门</a>
								</li>
								<li>
									<div class="bEightSX" id="bEightSX3">3</div> <a href="#">PS实战公开课（零基础学习</a>
								</li>
								<li>
									<div class="bEightSX">4</div> <a href="#">CAD高级绘图（家具室内机械</a>
								</li>
								<li>
									<div class="bEightSX">5</div> <a href="#">蓝铅笔公开课——小白学漫画</a>
								</li>
								<li>
									<div class="bEightSX">6</div> <a href="#">PS零基础到精通实战培训</a>
								</li>
								<li>
									<div class="bEightSX">7</div> <a href="#">网页制作0基础-项目实战</a>
								</li>
								<li>
									<div class="bEightSX">8</div> <a href="#">PS教程PS基础速成精品课</a>
								</li>
								<li>
									<div class="bEightSX">9</div> <a href="#">Java零基础到项目实战</a>
								</li>
							</ul>
						</div>
						<!---------------------------------------------------------------------------------------->
						<!---------------------------------------------------------------------------------------->
						<div id="bQieHuan2" style="display: none;">
							<!--下面第1个选项-->
							<div class="bFirst">
								<!--1-->
								<div class="bFirst1">1</div>
								<!--1列表旁边的字-->
								<a class="bFirstZiA" href="#">（AI）Illustrator零基础到</a> <a
									class="bFirstImg" href="#"><img
									src="../../img/imgs/img1/mf2.jpg" /></a>
								<ul class="bFirstUl">
									<li>473516人</li>
									<li id="bFirstUlTwo">云中帆教育</li>
								</ul>
							</div>
							<!--下面8个选项-->
							<ul class="bEightUl">
								<li>
									<div class="bEightSX" id="bEightSX2">2</div> <a href="#">网页制作0基础-项目实战</a>
								</li>
								<li>
									<div class="bEightSX" id="bEightSX3">3</div> <a href="#">ASP.NET
										MVC商务网站开发</a>
								</li>
								<li>
									<div class="bEightSX">4</div> <a href="#">.NET面向对象分析【喜科堂</a>
								</li>
								<li>
									<div class="bEightSX">5</div> <a href="#">网页制作0基础-项目实战系列</a>
								</li>
								<li>
									<div class="bEightSX">6</div> <a href="#">ASP.NET MVC商务网站开发</a>
								</li>
								<li>
									<div class="bEightSX">7</div> <a href="#">网页制作0基础-项目实战系列</a>
								</li>
								<li>
									<div class="bEightSX">8</div> <a href="#">IT部落窝网络学院photoshop</a>
								</li>
								<li>
									<div class="bEightSX">9</div> <a href="#">PS教程PS基础速成精品课</a>
								</li>
							</ul>
						</div>
						<!---------------------------------------------------------------------------------------->
					
					</div>
				</div>
</body>
<script type="text/javascript">

var bMianFei = document.getElementById("bMianFei");
var bFuFei = document.getElementById("bFuFei");
var bQieHuan1 = document.getElementById("bQieHuan1");
var bQieHuan2 = document.getElementById("bQieHuan2");
bMianFei.onmouseover = function(){
	bQieHuan1.style.display = "block";
	bQieHuan2.style.display = "none";
	bMianFei.style.color = "#333333";
	bMianFei.style.borderBottom = "1px solid #188eee";
	bFuFei.style.color = "#999999";
	bFuFei.style.borderBottom = "1px solid #dddddd";
}
bFuFei.onmouseover = function(){
	bQieHuan1.style.display = "none";
	bQieHuan2.style.display = "block";
	bFuFei.style.color = "#333333";
	bFuFei.style.borderBottom = "1px solid #188eee";
	bMianFei.style.color = "#999999";
	bMianFei.style.borderBottom = "1px solid #dddddd";
}
//切换免费和付费排行
var bbMianFei = document.getElementById("bbMianFei");
var bbFuFei = document.getElementById("bbFuFei");
var bbQieHuan1 = document.getElementById("bbQieHuan1");
var bbQieHuan2 = document.getElementById("bbQieHuan2");
bbMianFei.onmouseover = function(){
	bbQieHuan1.style.display = "block";
	bbQieHuan2.style.display = "none";
	bbMianFei.style.color = "#333333";
	bbMianFei.style.borderBottom = "1px solid #188eee";
	bbFuFei.style.color = "#999999";
	bbFuFei.style.borderBottom = "1px solid #dddddd";
}
bbFuFei.onmouseover = function(){
	bbQieHuan1.style.display = "none";
	bbQieHuan2.style.display = "block";
	bbFuFei.style.color = "#333333";
	bbFuFei.style.borderBottom = "1px solid #188eee";
	bbMianFei.style.color = "#999999";
	bbMianFei.style.borderBottom = "1px solid #dddddd";
}

//切换免费和付费排行
var bbbMianFei = document.getElementById("bbbMianFei");
var bbbFuFei = document.getElementById("bbbFuFei");
var bbbQieHuan1 = document.getElementById("bbbQieHuan1");
var bbbQieHuan2 = document.getElementById("bbbQieHuan2");
bbbMianFei.onmouseover = function(){
	bbbQieHuan1.style.display = "block";
	bbbQieHuan2.style.display = "none";
	bbbMianFei.style.color = "#333333";
	bbbMianFei.style.borderBottom = "1px solid #188eee";
	bbbFuFei.style.color = "#999999";
	bbbFuFei.style.borderBottom = "1px solid #dddddd";
}
bbbFuFei.onmouseover = function(){
	bbbQieHuan1.style.display = "none";
	bbbQieHuan2.style.display = "block";
	bbbFuFei.style.color = "#333333";
	bbbFuFei.style.borderBottom = "1px solid #188eee";
	bbbMianFei.style.color = "#999999";
	bbbMianFei.style.borderBottom = "1px solid #dddddd";
}
//---------IT培训--------------------------------------------------


//IT培训切换下面的大div
//---------IT培训--------------------------------------------------
var bBigQieHuan1 = document.getElementById("bBigQieHuan1");
var bBigQieHuan2 = document.getElementById("bBigQieHuan2");
var bBigQieHuan3 = document.getElementById("bBigQieHuan3");
var bQieHuanButton = document.getElementById("bQieHuanButton");
var Bbuttons = bQieHuanButton.getElementsByTagName("a");
Bbuttons[0].onmouseover = function(){
	bBigQieHuan1.style.display = "block";
	bBigQieHuan2.style.display = "none";
	bBigQieHuan3.style.display = "none";
	Bbuttons[0].style.color="#188eee";
	Bbuttons[0].style.borderBottom="3px solid #188eee";
	Bbuttons[1].style.color="#333333";
	Bbuttons[1].style.borderBottom="3px solid #f9f9f9";
	Bbuttons[2].style.color="#333333";
	Bbuttons[2].style.borderBottom="3px solid #f9f9f9";
}
Bbuttons[1].onmouseover = function(){
	bBigQieHuan1.style.display = "none";
	bBigQieHuan2.style.display = "block";
	bBigQieHuan3.style.display = "none";
	Bbuttons[1].style.color="#188eee";
	Bbuttons[1].style.borderBottom="3px solid #188eee";
	Bbuttons[0].style.color="#333333";
	Bbuttons[0].style.borderBottom="3px solid #f9f9f9";
	Bbuttons[2].style.color="#333333";
	Bbuttons[2].style.borderBottom="3px solid #f9f9f9";
}
Bbuttons[2].onmouseover = function(){
	bBigQieHuan1.style.display = "none";
	bBigQieHuan2.style.display = "none";
	bBigQieHuan3.style.display = "block";
	Bbuttons[2].style.color="#188eee";
	Bbuttons[2].style.borderBottom="3px solid #188eee";
	Bbuttons[1].style.color="#333333";
	Bbuttons[1].style.borderBottom="3px solid #f9f9f9";
	Bbuttons[0].style.color="#333333";
	Bbuttons[0].style.borderBottom="3px solid #f9f9f9";
}
//---------IT培训--------------------------------------------------
</script>
</html>