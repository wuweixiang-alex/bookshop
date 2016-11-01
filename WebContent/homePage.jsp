<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
 <!-- 添加背景图片 -->
 <style type="text/css">    
 body{    
      background-image: url(css/img/black.png);    
      background-repeat: repeat-x;    
 }    
 </style> 
<title>》》》THE STEP</title>
</head>
<body id="top"  onload="startTime()">

<!-- 引入 Bootstrap （样式表 的CSS） -->
<link href="css/bootstrap.min.css" rel="stylesheet">


<!--  实现返回顶部功能 -->
<style>  
    .backToTop {  
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
</style>   <p id="back-to-top"><a href="#top"><span></span></a></p>  




<div class="container">



	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="carousel slide" id="carousel-392528">
				<ol class="carousel-indicators">
					<li class="active" data-slide-to="0" data-target="#carousel-392528">
					</li>
					<li data-slide-to="1" data-target="#carousel-392528">
					</li>
					<li data-slide-to="2" data-target="#carousel-392528">
					</li>
				</ol>
				<div class="carousel-inner">
					<div class="item active">
						<img alt="" src="css/img/2.jpg" />
						<div class="carousel-caption">
							<h4>
								First Thumbnail label
							</h4>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="" src="css/img/background.jpg" />
						<div class="carousel-caption">
							<h4>
								Second Thumbnail label
							</h4>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="" src="css/img/1.jpg" />
						<div class="carousel-caption">
							<h4>
								Third Thumbnail label
							</h4>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
						</div>
					</div>
				</div> <a class="left carousel-control" href="#carousel-392528" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-392528" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
			</div>
		</div>
		
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
						<li  class="active"><a href="http://localhost:8080/bookShop/homePage.jsp"><span
								class="glyphicon glyphicon-home"> Home</span></a></li>
						<li><a href="${ctx}/query.htm"><span
								class="glyphicon glyphicon-shopping-cart"> Shop</span></a></li>
						<li><a href="http://localhost:8080/bookShop/index.jsp"><span
								class="glyphicon glyphicon-th-large"> About Us </span></a></li>
						<img style="width:250px; height:40px" src="${ctx}/common/style/css/img/logo.gif" />
					</ul>
					

					<ul class="nav navbar-nav navbar-right">
					
							<c:choose>
								<c:when test="${ empty username }">
									<li><a id="modal-825945" href="#modal-container-825945"
										role="button" data-toggle="modal"> 亲，请登陆/注册</a></li>
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
		
		
	</div>
	


<!-- 
<style type="text/css">
body{border:none; padding:0px; margin:0px; font-size:12px; font-family:'Arial';}

.lanrenzhijia{width:1002px; margin:auto; height:162px; overflow:hidden; position:relative; top:0px; left:0px;}
.case_li{float:left; padding-right:20px; position:relative; top:0px; left:0px; overflow:hiddenl;}
.case_li_txt{width:235px; height:62px; background:#ffffff;filter:alpha(opacity=80);-moz-opacity:0.8;opacity:0.8; top:118px; left:0px; position:absolute; overflow:hidden;}
.case_li_txt_hover{width:235px; height:62px; background:#000000;filter:alpha(opacity=80);-moz-opacity:0.8;opacity:0.8; top:100px; left:0px; position:absolute; overflow:hidden;}
.span_mr_txt{width:90%; text-align:left; margin:auto; padding:6px 0px; line-height:15px; color:#333333;}
.span_font{width:90%; text-align:left; margin:auto; padding:6px 0px; line-height:15px; color:#ffffff;}
.span_detail{width:90%; margin:auto; text-align:left; }
.span_detail a{color:#c0c46d; text-decoration:underline;}
.span_detail a:hover{color:#c0c46d; text-decoration:none;}
</style>
</head>
<body>
<style>
.baidu_ads{ width:960px; height:90px; position:absolute; left:50%; bottom:0; margin-left:-480px; overflow:hidden;}
</style>
<div class="baidu_ads">
<script type="text/javascript">
var sogou_ad_id=395091;
var sogou_ad_height=90;
var sogou_ad_width=960;
</script>
<script type='text/javascript' src='http://images.sohu.com/cs/jsfile/js/c.js'></script>
</div>
<span style="display:none;">
<script src="http://s94.cnzz.com/stat.php?id=4106941&web_id=4106941" language="JavaScript"></script>
</span>代码部分begin
<div class="lanrenzhijia">
	<div class="case_li">
		<img src="http://demo.lanrenzhijia.com/2015/pic0103/lanrenzhijia.jpg" />
		<div class="case_li_txt">
	    	 <div class="span_mr_txt">Fresh new Firebug 2 has been released and...</div>
			 <div class="span_detail"><a href="#" onfocus="blur"> > detail</a></div>
		</div>
	</div>
	<div class="case_li">
	    <img src="http://demo.lanrenzhijia.com/2015/pic0103/lanrenzhijia.jpg" />
	    <div class="case_li_txt">
		      <div class="span_mr_txt">Fresh new Firebug 2 has been released and...</div>
			  <div class="span_detail"><a href="#" onfocus="blur"> > detail</a></div>
		</div>
	</div>
	<div class="case_li">
	    <img src="http://demo.lanrenzhijia.com/2015/pic0103/lanrenzhijia.jpg" />
	    <div class="case_li_txt">
		      <div class="span_mr_txt">Fresh new Firebug 2 has been released and...</div>
			  <div class="span_detail"><a href="#" onfocus="blur"> > detail</a></div>
		</div>
	</div>
	<div class="case_li" style="padding:0px;">
	    <img src="http://demo.lanrenzhijia.com/2015/pic0103/lanrenzhijia.jpg" />
	    <div class="case_li_txt">
		      <div class="span_mr_txt">Fresh new Firebug 2 has been released and...</div>
			  <div class="span_detail"><a href="#" onfocus="blur"> > detail</a></div>
		</div>
	</div>
</div>
<script src="http://www.lanrenzhijia.com/ajaxjs/jquery.min.js"></script>
<script>
$(function(){
   $(".case_li").hover(function(){
      $(".case_li_txt",this).stop().animate({top:"100px"},{queue:false,duration:160});
	  $(".case_li_txt",this).css("background-color","#000000");
	  $(".case_li_txt .span_mr_txt",this).attr("class","span_font");
   },function(){
      $(".case_li_txt",this).stop().animate({top:"118px"},{queue:false,duration:160});
	  $(".case_li_txt",this).css("background-color","#ffffff");
	  $(".case_li_txt .span_font",this).attr("class","span_mr_txt");
   })
})
</script>





<style type="text/css">
    /* reset */
    *{margin:0;padding:0;list-style-type:none;}
    a{blr:expression(this.onFocus=this.blur())}/*去掉a标签的虚线框，避免出现奇怪的选中区域*/
    :focus{outline:0;}
    label{cursor:pointer;}
    img{vertical-align:middle;}
    table{empty-cells:show;border-collapse:collapse;border-spacing:0;}
    h1{font-size:16px;}h2,h3,h4{font-size:14px;}h5,h6{font-size:12px;}
    abbr,acronym{border:0;font-variant:normal}
    address,caption,cite,code,dfn,em,th,var,optgroup{font-style:normal;font-weight:normal}
    input,button,textarea,select,optgroup,option{font-family:inherit;font-size:inherit;font-style:inherit;font-weight:inherit}
    input,button,textarea,select{*font-size:100%}
    a,img{border:0;}
    a,a:visited{color:#5e5e5e; text-decoration:none;}
    a:hover{color:#4183C4;text-decoration:underline;}
    .clear{display:block;overflow:hidden;clear:both;height:0;line-height:0;font-size:0;}
    .clearfix:after{content:".";display:block;height:0;clear:both;visibility:hidden;}
    .clearfix{display:inline-table;}/* Hides from IE-mac \*/
    *html .clearfix{height:1%;}
    .clearfix{display:block;}/* End hide from IE-mac */
    *+html .clearfix{min-height:1%;}
    body{font:12px/180% Arial,Lucida,Verdana,"宋体",Helvetica,sans-serif;color:#333;background:#fff;}
    /* shortcut */
    .shortcut{height:32px;line-height:32px;font-size:12px;background:#eee;text-transform:uppercase;box-shadow:1px 0px 2px rgba(0,0,0,0.2);border-bottom:1px solid #DDDDDD;}
    .shortcut h1{font-size:14px;font-family:"微软雅黑","宋体";}
    .shortcut a,.shortcut h1{padding:0px 10px;letter-spacing:1px;color:#333;text-shadow:0px 1px 1px #fff;display:block;float:left;width:360px;height:32px;overflow:hidden;}
    .shortcut a:hover{background:#fff;}
    .shortcut span.right{float:right;display:inline-block;width:468px;height:15px;overflow:hidden;margin:8px 5px 0 0;}
    .shortcut .close{
        background:url(/Public/images/close-demo.gif) no-repeat 0 0;width:20px;height:20px;line-height:99em;overflow:hidden;display:inline-block;margin:6px 10px 0 10px;float:right;padding:0;
        -webkit-transition:all .3s ease-out 0s;
        -moz-transition:all .3s ease-out 0s;
        -ms-transition:all .3s ease-out 0s;
        -o-transition:all .3s ease-out 0s;
        transition:all .3s ease-out 0s;
    }
    .shortcut .close:hover{background:url(/Public/images/close-demo.gif) no-repeat 0 -20px}
    .shortcut .close:active{background:url(/Public/images/close-demo.gif) no-repeat 0 -40px}
</style>
<div class="shortcut">
   

	<span class="right">
		<script type="text/javascript">
			/*新468*15*/
			var cpro_id = "u1425128";
		</script>
		<script type="text/javascript" src="http://cpro.baidustatic.com/cpro/ui/c.js"></script>
	</span>

</div>shortcut end

<script type="text/javascript" src="http://www.17sucai.com/static/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){

        var iframeHeight = function () {
            var _height = $(window).height() - 34;
            $('#content').height(_height);
        }
        window.onresize = iframeHeight;
        $(function () {
            iframeHeight();
        });

    });

</script>

<div id="container" style="overflow:hidden;">
    <iframe border="0" id="content" src="http://www.17sucai.com/preview/354285/2016-06-13/大转盘模拟抽奖/index.html" frameborder="0" height="100%" width="100%"></iframe>
</div>

<script type="text/javascript">
    var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
    document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F382f81c966395258f239157654081890' type='text/javascript'%3E%3C/script%3E"));
</script>	
	
</div>


 -->











 <!-- jQuery文件。务必在bootstrap.min.js 之前引入-->
<script type="text/javascript" src="js/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件，合并了 Bootstrap JavaScript 插件 -->
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<!-- 显示一个钟表 -->
<script type="text/javascript">
function startTime()
{
var today=new Date()
var h=today.getHours()
var m=today.getMinutes()
var s=today.getSeconds()
// add a zero in front of numbers<10
m=checkTime(m)
s=checkTime(s)
document.getElementById('txt').innerHTML=h+":"+m+":"+s
t=setTimeout('startTime()',500)
}

function checkTime(i)
{
if (i<10) 
  {i="0" + i}
  return i
}
</script>

<!-- 实现返回顶部功能 -->
<script>  
(function() {  
    var $backToTopTxt = "返回顶部"  
    $backToTopEle = $('<div class="backToTop"></div>').appendTo($("body")).text($backToTopTxt)  
    .attr("title", $backToTopTxt).click(function() {  
        $("html, body").animate({  
            scrollTop: 0  
        },120);  
    })  
    $backToTopFun = function() {  
        var st = $(document).scrollTop(),  
        winh = $(window).height(); (st > 0) ? $backToTopEle.show() : $backToTopEle.hide();  
        //IE6下的定位  
        if (!window.XMLHttpRequest) {  
            $backToTopEle.css("top", st + winh - 166);  
        }  
    };  
    $(window).bind("scroll", $backToTopFun);  
    $(function() {  
        $backToTopFun();  
    });  
})();  
</script>  

</body>
</html>