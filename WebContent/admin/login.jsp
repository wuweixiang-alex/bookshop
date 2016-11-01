<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>后台管理员登陆</title>
<link href="../Wopop_files/style_log.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="../Wopop_files/style.css">
<link rel="stylesheet" type="text/css" href="../Wopop_files/userpanel.css">
<link rel="stylesheet" type="text/css" href="../Wopop_files/jquery.ui.all.css">

</head>

<body class="login" mycollectionplug="bind">
<div class="login_m">
<div class="login_logo"><img src="../Wopop_files/logo.png" width="196" height="160"></div>
<div class="login_boder">

<div class="login_padding" id="login_model">

  <h2>USERNAME</h2>
  <form action="domanagerregister.htm" method="post" id="from">
  <label>
    <input type="text" id="managername" name="managername" class="txt_input txt_input2" onfocus="if (value ==&#39;Your name&#39;){value =&#39;&#39;}" onblur="if (value ==&#39;&#39;){value=&#39;Your name&#39;}" value="Your name">
  </label>
  <h2>PASSWORD</h2>
  <label>
    <input type="password" name="managerword" id="managerword" class="txt_input" onfocus="if (value ==&#39;******&#39;){value =&#39;&#39;}" onblur="if (value ==&#39;&#39;){value=&#39;******&#39;}" value="******">
  </label>
 
 

 
  <p style="color:red">${mes}</p>
  <div class="rem_sub">
  <div class="rem_sub_l">
   </div>
    <label>
      <input type="submit" class="sub_button" name="button" id="button" value="SIGN-IN" style="opacity: 0.7;">
    </label>
  </div>
</div>

<div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >ä¼ä¸ç½ç«æ¨¡æ¿</a></div>

<div id="forget_model" class="login_padding" style="display:none">
<br>

   <h1>Forgot password</h1>
   <br>
   <div class="forget_model_h2">(Please enter your registered email below and the system will automatically reset usersâ password and send it to userâs registered email address.)</div>
    <label>
    <input type="text" id="usrmail" class="txt_input txt_input2">
   </label>

 
  <div class="rem_sub">
  <div class="rem_sub_l">
   </div>
    <label>
     <input type="submit" class="sub_buttons" name="button" id="Retrievenow" value="Retrieve now" style="opacity: 0.7;">
     ããã
     <input type="submit" class="sub_button" name="button" id="denglou" value="Return" style="opacity: 0.7;">ãã
    
    </label>
  </div>
</div>






<!--login_padding  Sign up end-->
</div><!--login_boder end-->
</div><!--login_m end-->
 <br> <br>
</form>


</body></html>