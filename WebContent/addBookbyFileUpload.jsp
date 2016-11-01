<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>添加商品页面</title>
</head>
<body>
	
	<form action="oneUpload.htm" method="post"
		enctype="multipart/form-data">
		<table>



			<tr>
				<td>图片：<input type="file" name="imageFile" /></td>
			</tr>
			<tr>
		<td>类型：<select name="type_tId">
					<option value="1">心理学</option>
					<option value="2">励志学</option>
					<option value="3">其它</option>
			</select></td>
			</tr>
			<tr>
			<td>价格：<input type="text" name="price" style="width:64px"/> 元</td>
			</tr>
			<tr>
			<td>库存：<input type="text" name="stock" style="width:64px" /> 件</td>
			</tr>
			<tr>
			<td>描述：<input type="text" name="described" /></td>
			</tr>

			<tr>
			<td><input type="submit" name="upload" /></td>
			</tr>
			</table>
	</form>

</body>
</html>