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
<title>管理员登陆界面</title>
</head>
<body>



<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="page-header">
				<center><h1>
					管理员登陆界面
				</h1></center>
			</div>
		</div>
	</div>
		
	<div class="col-md-3 column"></div>
	
	
		<div class="col-md-6 column">
			<form class="form-horizontal" role="form">
			<br/><br/><br/><br/>
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">Username</label>
					<div class="col-sm-10">
						<input type="email" class="form-control" id="inputEmail3" />
					</div>
				</div>
				<div class="form-group">
					 <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="inputPassword3" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<div class="checkbox">
							 <label><input type="checkbox" />Remember me</label>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						 <button type="submit" class="btn btn-default">Sign in</button>
					</div>
				</div>
			</form>
		</div>
		
		<div class="col-md-3 column"></div>
	</div>
</div>







 <!-- jQuery文件。务必在bootstrap.min.js 之前引入-->
<script type="text/javascript" src="../js/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件，合并了 Bootstrap JavaScript 插件 -->
<script type="text/javascript" src="../js/bootstrap.min.js"></script>



</body>
</html>