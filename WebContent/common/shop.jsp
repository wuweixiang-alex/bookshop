<%@ page language="java" import="java.util.*,com.step.entity.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head runat="server">
											<!-- ！！格式化的时候注意不要对全部 ，会导致 js部分 语句失效 -->

<script src="${ctx}/common/js/jquery-1.11.min.js"></script> 
<!-- 添加背景图片 -->
<!-- <style type="text/css">
body {
	background-image: url(${ctx}/css/img/black.png);
	background-repeat: repeat-x;
}
</style> -->
<title>Shop</title>
</head>
<style>
.box{float:left; width:198px; height:320px; margin-left:5px; border:1px solid #e0e0e0; text-align:center} 
.box p{line-height:20px; padding:4px 4px 10px 4px; text-align:left} 
.box:hover{border:1px solid #f90} 
.box h4{line-height:32px; font-size:14px; color:#f30;font-weight:500} 
.box h4 span{font-size:20px} 
.u-flyer{display: block;width: 50px;height: 50px;border-radius: 50px;position: fixed;z-index: 9999;} 
 
.m-sidebar{position: fixed;top: 51px;right: 0;background:rgb(248,248,248);z-index: 2000;width: 35px;height: 100%;font-size: 12px;color: #fff;} 
.cart{color: #fff;text-align:center;line-height: 20px;padding: 200px 0 0 0px;} 
.cart span{display:block;width:20px;margin:0 auto;} 
.cart i{width:35px;height:35px;display:block; background:url(${ctx}/upload/car.png);} 
#msg{position:fixed; top:300px; right:35px; z-index:10000; width:1px; height:52px; line-height:52px; font-size:20px; text-align:center; color:#fff; background:#360; display:none} 
</style>
<body id="top2" onload="startTime()">



<div class="m-sidebar"> 
    <div class="cart"> 
        <i id="end"></i> 
      <a href="${ctx}/queryCart.htm">  <span>购物车</span></a> 
    </div> 
</div> 
<div id="msg">已成功加入购物车！</div> 

<!--  实现返回顶部功能 -->
	<style>
.backToTop {
   z-index:2001;
	display: none;
	width: 18px;
	line-height: 1.2;
	padding: 5px 0;
	background-color: #000;
	color: #fff;
	font-size: 12px;
	text-align: center;
	position: fixed;
	_position: absolute;
	right: 10px;
	bottom: 100px;
	_bottom: "auto";
	cursor: pointer;
	opacity: .6;
	filter: Alpha(opacity = 60);
}
</style>
	<p id="back-to-top">
		<a href="#top2"><span></span></a>
	</p>
 
	<!-- 引入 Bootstrap （样式表 的CSS） -->
	<link href="${ctx}/css/bootstrap.min.css" rel="stylesheet">
<%--http://www.cnblogs.com/xyyt/p/3978631.html 

	<link href="${ctx}/css/backbook.css" id="MainCss" type="text/css" rel="stylesheet">
<script type="text/javascript">
	try {
		if (screen.availWidth > 1200) {
			document.getElementById("MainCss").href = '${ctx}/css/backbook.css';
		}
	} catch (e) { }
</script> --%>



	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">

				<nav class="navbar navbar-default navbar-fixed-top"
					role="navigation">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span><span
							class="icon-bar"></span><span class="icon-bar"></span><span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand"
						href="http://localhost:8080/bookShop/index.jsp">STEP <span
						class="glyphicon glyphicon-send"></span></a>
				</div>
				
				
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="http://localhost:8080/bookShop/homePage.jsp"><span
								class="glyphicon glyphicon-home"> Home</span></a></li>
						<li class="active"><a href="${ctx}/query.htm"><span
								class="glyphicon glyphicon-shopping-cart"> Shop</span></a></li>
						<li><a href="http://localhost:8080/bookShop/index.jsp"><span
								class="glyphicon glyphicon-th-large"> About Us </span></a></li>
						<img style="width:250px; height:40px" src="${ctx}/common/style/css/img/logo.gif" />
					</ul>
					

					<ul class="nav navbar-nav navbar-right">
					
							<c:choose>
								<c:when test="${ empty username }">
									<li><a id="modal-825945" href="#modal-container-825945"
										role="button" data-toggle="modal" onclick="showTime111(); "> 亲，请登陆/注册</a></li>
								</c:when>
							<c:otherwise>
							
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown"><span
										class="glyphicon glyphicon-user">
										 您好，${not empty username?username:"访客13521313"}
									</span>
										<ul class="dropdown-menu">
											<li><a href="#">我的订单</a></li>
											<li><a href="#">退款/售后</a></li>
											<li><a href="#">我的圈子</a></li>
											<li class="divider"></li>
											<li><a href="#">个人中心(余额,密码修改等)</a></li>
											<li class="divider"></li>
											<li><a href="<c:url value='/logout.htm'/>">注销</a></li>
										</ul></li>
							</c:otherwise>
						</c:choose>
						
						<form action="${ctx}/query.htm" method="post"
						class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<input name="described" type="text" class="form-control"
								value="有关书籍的描述"
								onFocus="if(value==defaultValue){value='';this.style.color='#000'}"
								onBlur="if(!value){value=defaultValue;this.style.color='#999'}"
								style="color: #999999" />
						</div>
						<button type="submit" class="btn btn-default glyphicon glyphicon-search"  style="color: rgb(255, 0, 0);"></button>
					</form>	
							
							
						<li><a href="#"> <!-- 显示一个钟表 -->
								<div id="txt"></div>
						</a></li>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


						<!-- <li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"><span class="glyphicon glyphicon-cloud-upload"
								></span> 网站导航（可不要）<strong
								class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li><a href="#">用户管理</a></li>
								<li><a href="#">商品管理</a></li>
								<li><a href="#">订单管理 </a></li>
								<li class="divider"></li>
								<li><a href="#">管理员登陆（待完善）</a></li>
							</ul></li> -->
					</ul>
				</div>
				</nav>

				<br /> <br /> <br />



				<div class="page-header">
					<h1>
						Nothing happens unless first a dream. <small>Subtext for
							header</small>
 
					</h1>
				</div>

			</div>
		</div>
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="row clearfix">
					<div class="col-md-3 column">

						 
			 
						
					<div class="container-fluid"> 	
						
						<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#example-navbar-collapse">
			<span class="sr-only">切换导航</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		
		
		
		
		<div class="row clearfix">
		<div class="col-md-12 column">
			 <button type="button" class="btn active btn-block btn-xs btn-primary">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;书籍分类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
		</div>
	</div>
	</div>
	<div class="collapse navbar-collapse" id="example-navbar-collapse">
		<ul class="nav navbar-nav">
			<li class="active"><a href="${ctx}/query.htm?type_tId=1">心理</a></li>
			<li><a href="${ctx}/query.htm?type_tId=2">励志</a></li>
			<li class="active"><a href="#">未定</a></li>
			<li><a href="#">未定</a></li>
			<li class="active"><a href="#">未定</a></li>
			<li><a href="#">未定</a></li>
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">
					未定义 <b class="caret"></b>
				</a>
				<ul class="dropdown-menu">
					<li><a href="#">jmeter</a></li>
					<li><a href="#">EJB</a></li>
					<li><a href="#">Jasper Report</a></li>
					<li class="divider"></li>
					<li><a href="#">分离的链接</a></li>
					<li class="divider"></li>
					<li><a href="#">另一个分离的链接</a></li>
				</ul>
			</li>
		</ul>
	</div>

</div>
 
<%-- <jsp:include  page="${ctx}/calendar.jsp"/> --%>

						

						<h3 class="text-warning">
							我是书本的热门推荐
							<h6 class="text-warning">（当用户买下感兴趣的商品，以此为依据，进行类似产品动态展示，让用户有更多的购买倾向）</h6>
						</h3>
						<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
						<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
						<br /> <br />
					<%-- 	<center>
							<img width="260" height="100"
								src="${ctx}/css/img/shopping_cart.png" /> <br />
						</center> --%>
						
						
		<!-- 我是日历表 -->
	 	<link href="${ctx}/css/style.css" rel="stylesheet">	
				<table>
			<thead>
				<tr><td>一</td><td>二</td><td>三</td><td>四</td><td>五</td><td>六</td><td>日</td></tr>
			</thead>
			<tbody>
				<tr>
					<td date-month="12" date-day="1">1</td>
					<td date-month="12" date-day="2">2</td>
					<td date-month="12" date-day="3">3</td>
					<td date-month="12" date-day="4">4</td>
					<td date-month="12" date-day="5">5</td>
					<td date-month="12" date-day="6">6</td>
					<td date-month="12" date-day="7">7</td>
				</tr>
				<tr>
					<td date-month="12" date-day="8">8</td>
					<td date-month="12" date-day="9">9</td>
					<td date-month="12" date-day="10">10</td>
					<td date-month="12" date-day="11">11</td>
					<td date-month="12" date-day="12">12</td>
					<td date-month="12" date-day="13">13</td>
					<td date-month="12" date-day="14">14</td>
				</tr>
				<tr>
					<td date-month="12" date-day="15">15</td>
					<td date-month="12" date-day="16">16</td>
					<td date-month="12" date-day="17">17</td>
					<td date-month="12" date-day="18">18</td>
					<td date-month="12" date-day="19">19</td>
					<td date-month="12" date-day="20">20</td>
					<td date-month="12" date-day="21">21</td>
				</tr>
				<tr>
					<td date-month="12" date-day="22">22</td>
					<td date-month="12" date-day="23">23</td>
					<td date-month="12" date-day="24">24</td>
					<td date-month="12" date-day="25">25</td>
					<td date-month="12" date-day="26">26</td>
					<td date-month="12" date-day="27">27</td>
					<td date-month="12" date-day="28">28</td>
				</tr>
				<tr>
					<td date-month="12" date-day="29">29</td>
					<td date-month="12" date-day="30">30</td>
					<td date-month="12" date-day="31">31</td>
				</tr>
			</tbody>
		</table>
		<script type="text/javascript" src="${ctx}/js/simplecalendar.js"></script>


					</div>
					<div class="col-md-9 column">
						<%-- 	<jsp:include  page="${ctx}/../search.jsp"/> --%>

						<!-- 我是一个搜索栏 -->
						<form action="${ctx}/query.htm" method="post"
							class="navbar-form navbar-left" role="search">
							<div class="form-group">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<span class="label label-success">书的描述&nbsp;&nbsp;:</span>&nbsp;<input
									name="described" type="text" class="form-control" value="${described2}" />
							</div>
							&nbsp;&nbsp;&nbsp;
							<div class="form-group">
								<span class="label label-success">价格范围&nbsp;&nbsp;:</span>&nbsp;<input
									name="priceS" type="text" class="form-control"
									style="width: 60px" />
							</div>
							<div class="form-group">
								- <input name="priceE" type="text" class="form-control"
									style="width: 60px" />
							</div>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							
							<button type="submit" class="btn btn-default">搜索</button>
						</form>


						<br />
						<br /><br />



						<!-- 我是商品遍历块 -->
						<div class="row clearfix">
				
							<c:forEach var="book" items="${pager.dataList}">
								<div class="col-md-3 column"
									style="float: left; display: inline;">
									
									<div style="height: 65px; width: 180px">
										
										<img alt="200x200" src="${ctx}/upload/${book.image}"
										class="img-thumbnail" /> 
										&nbsp;
										<span class="label label-danger">
										¥<c:out value="${book.price}"></c:out></span>
										<button type="button" class="btn btn-xs btn-info" onclick="buytz();">购买</button>
										<button type="button"  class="btn btn-xs btn-info button orange addcar" onclick="funToCart(${book.bId},${book.price});">加入购物车</button>
										 <a href="#" class="pull-left"><div style="height: 50px"><c:out value="${book.described}"></c:out></div></a>

									</div>
								</div>
							</c:forEach>
						</div>
						

					

						<center>
							<form action="${ctx}/query.htm" method="post" id="qForm" >
								<div>
									共${empty pager.totalCount ? '0':pager.totalCount}条记录 <span ><a
										href="#" onclick="firstPage();">首页</a></span> &nbsp <a href="#"
										onclick="prevPage();">上一页 </a>&nbsp <a href="#"
										onclick="nextPage();">下一页 </a>&nbsp <a href="#"
										onclick="lastPage();">尾页 </a>&nbsp  共${pager.totalPage eq null?'0':pager.totalPage}页，到第 <input type="text" id="jump"
										style="width: 28px; height:16px" value="${pager.currentPage == null ? '1':pager.currentPage}"> 页  <button type="button" class="btn btn-xs"><a href="#"
										onclick="jump();">确定</a></button>
										
										
										
										<input type="hidden" id="pageNum" name="pageNum" value="1">
								</div>
							</form>
						</center>



					</div>
				</div>
			</div>
		</div>



		<!-- 实现分页功能 -->
		<script type="text/javascript">
			var currentPage = ${pager.currentPage};
			var totalPage = ${pager.totalPage};
			var formObj = document.getElementById("qForm");

			function firstPage() {
				if (currentPage == 1) {
					alert("当前已经是第一页");
				} else {
					document.getElementById("pageNum").value = 1;
					formObj.submit();
				}
			}
			function nextPage() {
				if (currentPage == totalPage) {//判断已经是最后页
					alert("已经是最后页");
				} else {
					document.getElementById("pageNum").value = currentPage + 1;
					formObj.submit(); //提交表单
				}
			}
			function prevPage() {
				if (currentPage == 1) {//判断是否首页
					alert("已经是首页");
				} else {
					document.getElementById("pageNum").value = currentPage - 1;
					formObj.submit();
				}
			}
			function lastPage() {
				if (currentPage == totalPage) {//判断是否尾页
					alert("已经是最后页");
				} else {
					document.getElementById("pageNum").value = totalPage;
					formObj.submit();
				}
			}
			function jump() {
				var jumpPage = document.getElementById("jump").value;
				var re = /([0-9])/;
				if (!re.test(jumpPage)) {
					alert("所填页数不符合规范");
					return;
				}

				if (jumpPage < 1) {//判断是否首页
					jumpPage = 1;
				}
				if (jumpPage > totalPage) {
					jumpPage = totalPage;
				}

				document.getElementById("pageNum").value = jumpPage;
				formObj.submit();

			}
		</script>



		<!-- jQuery文件。务必在bootstrap.min.js 之前引入-->
		<script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>

		<!-- 最新的 Bootstrap 核心 JavaScript 文件，合并了 Bootstrap JavaScript 插件 -->
		<script type="text/javascript" src="${ctx}/js/bootstrap.min.js"></script>


		<!-- 显示一个钟表 -->
		<script type="text/javascript">
			function startTime() {
				var today = new Date()
				var h = today.getHours()
				var m = today.getMinutes()
				var s = today.getSeconds()
				// add a zero in front of numbers<10
				m = checkTime(m)
				s = checkTime(s)
				document.getElementById('txt').innerHTML = h + ":" + m + ":"
						+ s
				t = setTimeout('startTime()', 500)
			}

			function checkTime(i) {
				if (i < 10) {
					i = "0" + i
				}
				return i
			}
		</script>

<script type="text/javascript">
function funToCart(bookid,price){
	//var bId = $("#bookId").val();//$ 获取 元素的表达式 #代表用id 来获取
	$.ajax({
		type:"post",
		data:"bId="+bookid+"&price="+price,
		url:"${ctx}/toCart.htm",
		dataType:"text",
		success:function(data){
			 // alert(data); 后台到前台有乱码？？？？
			alert("加入购物车成功");//PrintWriter out = response.getWriter();  out.println("uuuuu");  输出 alert（data）  "uuuuu"
		},
		error:function(e){
			alert("加入购物车失败"+e);
		}
	});
}
</script>


		<!-- 实现返回顶部功能 -->
		<script>
			(function() {
				var $backToTopTxt = "返回顶部"
				$backToTopEle = $('<div class="backToTop"></div>').appendTo(
						$("body")).text($backToTopTxt).attr("title",
						$backToTopTxt).click(function() {
					$("html, body").animate({
						scrollTop : 0
					}, 120);
				})
				$backToTopFun = function() {
					var st = $(document).scrollTop(), winh = $(window).height();
					(st > 0) ? $backToTopEle.show() : $backToTopEle.hide();
					//IE6下的定位  
					if (!window.XMLHttpRequest) {
						$backToTopEle.css("top2", st + winh - 166);
					}
				};
				$(window).bind("scroll", $backToTopFun);
				$(function() {
					$backToTopFun();
				});
			})();
		</script>

<div class="container">
	<div class="row">
		<div class="span2">
			<ul class="nav nav-pills nav-stacked">
				<li class="active">
					<a href="#">Home</a></li>   
				<li><a href="#">Tutorials</a></li>
				<li><a href="#">Practice Editor </a></li> 
				<li><a href="#">Gallery</a></li> 
				<li><a href="#">Contact</a></li> 
			</ul>
		</div>
	</div>
</div>




<div class="col-md-12 column">
			<div class="panel-group" id="panel-130546">
				<div class="panel panel-default">
					<div class="panel-heading">
						 <a class="panel-title collapsed" data-toggle="collapse" data-parent="#panel-130546" href="#panel-element-770176">Collapsible Group Item #1</a>
					</div>
					<div id="panel-element-770176" class="panel-collapse collapse">
						<div class="panel-body">
							Anim pariatur cliche...
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						 <a class="panel-title collapsed" data-toggle="collapse" data-parent="#panel-130546" href="#panel-element-239221">Collapsible Group Item #2</a>
					</div>
					<div id="panel-element-239221" class="panel-collapse collapse">
						<div class="panel-body">
							Anim pariatur cliche...
						</div>
					</div>
				</div>
			</div>
		</div>


		<h1>Hello, STEP!</h1>

		<div class="row">

			<div class="col-md-3"
				style="background-color: #dedef8; box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
				<h4>第一列</h4>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
			</div>

			<div class="col-md-9"
				style="background-color: #dedef8; box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
				<h4>第二列 - 分为四个盒子</h4>
				<div class="row">
					<div class="col-md-6"
						style="background-color: #B18904; box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
						<p>Consectetur art party Tonx culpa semiotics. Pinterest
							assumenda minim organic quis.</p>
					</div>
					<div class="col-md-6"
						style="background-color: #B18904; box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
						<p>sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua. Ut enim ad minim veniam, quis nostrud exercitation
							ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
					</div>
				</div>

				<div class="row">
					<div class="col-md-6"
						style="background-color: #B18904; box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
						<p>quis nostrud exercitation ullamco laboris nisi ut aliquip
							ex ea commodo consequat.</p>
					</div>
					<div class="col-md-6"
						style="background-color: #B18904; box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
							sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua. Ut enim ad minim.</p>
					</div>
				</div>

			</div>

		</div>

<h4 class="text-success"><span class="bg-danger">&nbsp;书籍分类：</span></h4>



			<!-- 触发遮罩窗体 -->
			<div class="modal fade" id="modal-container-825945" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<%-- <jsp:include page="logreg.jsp"/> --%>
			<!-- 	<frameset cols="100%">
  <frame src="logreg.jsp">
</frameset> -->
				
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
<%-- 							<center>
								<h4 class="modal-title" id="myModalLabel">普通用户登陆界面</h4>
							</center>
						</div>
						<div class="modal-body"> --%>

						<form id="form1" runat="server">
					<center><a href="http://localhost:8080/bookShop/common/loginandregister.jsp">进入登陆注册页面倒计时：<span id='div1'></span>秒，点击直接进入</a></center>
						</form>

						

						<%-- 							<form action="${ctx}/Login.htm?flag=1" method="post" id="form" onsubmit="return validate_login();">
								<br />
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-2 control-label" >Username</label>
									<div class="col-sm-10">
										<input type="text" name="username" class="form-control" id="inputEmail3"
											style="width: 350px"  />
									</div>
								</div>
								<div class="form-group">
									<label for="inputPassword3" class="col-sm-2 control-label">Password</label>
									<div class="col-sm-10">
										<input type="password" name="password" class="form-control"
											id="inputPassword3" style="width: 350px" />
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<div class="checkbox">
											<label><input type="checkbox" />Remember me</label>
										</div>
									</div>
								</div>
								
									
									 <button type="submit" class="btn btn-primary btn-lg btn-block">Sign in</button>
									 
										<script type="text/javascript" >
										function validate_login() { 
											if(document.getElementsByName("username")[0].value==''){
												alert("用户名不能为空！");
												return false;
											}else if(document.getElementsByName("password")[0].value==''){
												alert("密码不能为空！");
												return false;
											}
										}</script>
										
								
							</form>
						</div>
						<div class="modal-footer">
						
						
<!-- 线下面的内容 --><a href="#" ><button type="button" class="btn btn-default btn-xs">忘记密码</button></a>&nbsp;&nbsp;&nbsp;<a href="#" ><button type="button" class="btn btn-default btn-xs">立刻注册</button></a>  --%>
						</div>
					</div>
				</div> 
			</div>
		



		<button type="button" class="btn btn-default" data-toggle="tooltip"
			data-placement="top" title="顶部的 Tooltip">
			顶部的 Tooltip
			<script>
				$(function() {
					$("[data-toggle='tooltip']").tooltip();
				});
			</script>
			
</body>

<!-- 会飞的购物车 -->
<script src="${ctx }/common/js/jquery.fly.min.js"></script>
<script> 
$(function() { 
    var offset = $("#end").offset(); 
    $(".addcar").click(function(event){ 
        var addcar = $(this); 
        var img = addcar.parent().find('img').attr('src'); 
        var flyer = $('<img class="u-flyer" src="'+img+'">'); 
        flyer.fly({ 
            start: { 
                left: event.pageX, //开始位置（必填）#fly元素会被设置成position: fixed 
                top: event.pageY //开始位置（必填） 
            }, 
            end: { 
                left: offset.left+10, //结束位置（必填） 
                top: offset.top+10, //结束位置（必填） 
                width: 0, //结束时宽度 
                height: 0 //结束时高度 
            }, 
            onEnd: function(){ //结束回调 
                $("#msg").show().animate({width: '250px'}, 200).fadeOut(1000); //提示信息 
                addcar.css("cursor","default").removeClass('orange').unbind('click'); 
                this.destory(); //移除dom 
            } 
        }); 
    }); 
}); 
</script> 

<script>
function buytz(){
    window.location.href='${ctx}/order.htm';
}
</script>
 <!-- jQuery文件。务必在bootstrap.min.js 之前引入-->
<script type="text/javascript" src="js/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件，合并了 Bootstrap JavaScript 插件 -->
<script type="text/javascript" src="js/bootstrap.min.js"></script>

</html>
<script type="text/javascript">  
//设定倒数秒数  
var tt = 10;  
//显示倒数秒数  
function showTime111(){  
	
    tt -= 1;  
    document.getElementById('div1').innerHTML= tt;  
    if(tt==0){  
        location.href='http://localhost:8080/bookShop/common/loginandregister.jsp';  
    }  
    //每秒执行一次,showTime()  
    setTimeout("showTime111()",800);  
}  
  
  
//执行showTime()  

</script>  