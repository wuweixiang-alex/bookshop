<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <!-- 添加背景图片 -->
 <style type="text/css">    
 body{    
      background-image: url(css/img/black.png);    
      background-repeat: repeat-x;    
 }    
 </style> 
 
 <!-- 引入 Bootstrap （样式表 的CSS） -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<title>后台管理界面</title>
</head>
<body>


<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="page-header">
				<center><h1>
					Example page header 
				</h1></center>
			</div>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-2 column">
			<div class="btn-group"><br/><br/><br/>
				 		<button type="button" class="btn btn-default">修改密码</button>
				 		
				 		<br/>
				 	 <button type="button" class="btn btn-default">留言管理</button>
			<br/>
				 <button class="btn btn-default">Action</button> <button data-toggle="dropdown" class="btn btn-default dropdown-toggle"><span class="caret"></span></button>
				<ul class="dropdown-menu">
					<li>
						 <a href="#">操作</a>
					</li>
					<li class="disabled">
						 <a href="#">另一操作</a>
					</li>
					<li class="divider">
					</li>
					<li>
						 <a href="#">其它</a>
					</li>
				</ul>
			</div><br/>
			<div class="btn-group">
				 <button class="btn btn-default">Action</button> <button data-toggle="dropdown" class="btn btn-default dropdown-toggle"><span class="caret"></span></button>
				<ul class="dropdown-menu">
					<li>
						 <a href="#">操作</a>
					</li>
					<li class="disabled">
						 <a href="#">另一操作</a>
					</li>
					<li class="divider">
					</li>
					<li>
						 <a href="#">其它</a>
					</li>
				</ul>
			</div><br/>
			<div class="btn-group">
				 <button class="btn btn-default">Action</button> <button data-toggle="dropdown" class="btn btn-default dropdown-toggle"><span class="caret"></span></button>
				<ul class="dropdown-menu">
					<li>
						 <a href="#">操作</a>
					</li>
					<li class="disabled">
						 <a href="#">另一操作</a>
					</li>
					<li class="divider">
					</li>
					<li>
						 <a href="#">其它</a>
					</li>
				</ul>
			</div><br/>
			<div class="btn-group dropup">
				 <button class="btn btn-default">Action</button> <button data-toggle="dropdown" class="btn btn-default dropdown-toggle"><span class="caret"></span></button>
				<ul class="dropdown-menu">
					<li>
						 <a href="#">操作</a>
					</li>
					<li class="disabled">
						 <a href="#">另一操作</a>
					</li>
					<li class="divider">
					</li>
					<li>
						 <a href="#">其它</a>
					</li>
				</ul>
			</div>
		</div><br/>
		<div class="col-md-10 column">
			<h3>
				详细信息展示
			</h3>
		</div>
	</div>
</div>






 <!-- jQuery文件。务必在bootstrap.min.js 之前引入-->
<script type="text/javascript" src="../js/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件，合并了 Bootstrap JavaScript 插件 -->
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
</body>
</html>