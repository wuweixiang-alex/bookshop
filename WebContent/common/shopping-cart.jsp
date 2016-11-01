<%@ page language="java" import="java.util.*,com.step.entity.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<HEADER>
	<title>Shopping Cart</title>
	<script type="text/javascript" src="${ctx}/common/js/jquery-1.11.min.js"></script>
	<script type="text/javascript" src="${ctx}/common/js/etao.js"></script>
	<script type="text/javascript" src="${ctx}/common/js/cart.js"></script>
	<link href="${ctx}/common/css/cart.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="${ctx}/common/css/bootstrap.min.css" media="screen" rel="stylesheet" type="text/css" />
	
	<script type="text/javascript">
	
	$(document).ready(function(){
		
		
		var acc = ${empty acc ? '1' : '100'};
		//alert(acc);
    	if(acc == 100){
    		alert("对不起，请您先登陆");
    		
    		window.location="/bookShop/common/loginandregister.jsp";
    	}
		
		$("#btn_settlement").click(function(){
			
			var s=null;
			$("input[type=checkbox]").each(function(i){
				if(i!=0)
				{if($(this).is(':checked'))
					s=$(this).attr("name")+","+s;}
				
			});
			window.location="${ctx}/order.htm?bId="+s+"&uid="+$("input[type=hidden]").eq(0).attr("class");
			//$.post("${ctx}/order.htm",{bId:s,uid:$("input[type=hidden]").eq(0).attr("class")});
		});
		
		
		
	});
	
	</script> 
</HEADER>
<body class="container">


		
		
		

	<div class="row hidden-print">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<ol class="breadcrumb">
				<li><a href="${ctx}/query.htm"> 返回 Shop</a></li>
                <li class="active">查看购物车</li>
			</ol>
		</div>
	</div>
    <div class="cart-wrap">
		<table id="cartTable" class="cart table table-condensed">
			<thead>
				<tr>
					<th class="t-checkbox"><label><input class="check-all check" type="checkbox" />全选</label></th>
					<th class="t-goods text-center"><label>书的图片</label></th>
					<th class="text-center">书的相关描述</th>
					<th class="t-selling-price text-center"><label>&nbsp;&nbsp;&nbsp;书的单价</label></th>
					<th class="t-qty text-center"><label>采购数量</label></th>
					<th class="t-subtotal text-center"><label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;金额小计</label></th>
					<th class="t-action"><label>操作</label></th>
				</tr>
			</thead>
			<tbody>
		
<c:forEach var="cart" items="${gwc7}">

			
				<tr>
					<td colspan="2" class="goods"><label><input type="hidden" class="${cart.user.uid }"> <input name="${cart.book.bId}"  type="checkbox" class="check-one check" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img style="height: 100px; width: 100px"alt="50x50" src="${ctx}/upload/${cart.book.image}" class="img-thumbnail" /> </label></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${cart.book.described}</td>
					<td class="selling-price number small-bold-red text-right"
								style="padding-top: 1.1rem;"data-bind="${cart.book.price}" ></td>  
					<td>
						<div class="input-group input-group-sm">
							<span class="input-group-addon minus">-</span> <input
										type="text" class="number form-control input-sm" value="${cart.count}" />
							<span class="input-group-addon plus">+</span>
						</div>
					</td>
					<td class="subtotal number small-bold-red text-right" style="padding-top: 1.1rem;"></td>
			<td class="action" style="padding-top: 1.1rem;"><a href="${ctx}/delete.htm?bId=${cart.book.bId}"><span class="delete btn btn-xs btn-warning">删除</span></a></td>
				</tr>
</c:forEach>			
		
			</tbody>
		</table>

		<div class="row">
			<div class="col-md-12 col-lg-12 col-sm-12">
				<div class="cart-summary">
					<div style="margin-left: 2rem;" class="pull-right">
						<a  
							id="btn_settlement" type="button" class="btn btn-primary" >结 算</a>
					</div>
					<div style="margin-left: 1rem; margin-top: 0.4rem;" class="pull-right total">
						<label>金额合计:<span id="priceTotal" class="price-total large-bold-red">0.00</span></label>
					</div>
					<div style="margin-top: 4px;" class="pull-right">
						<label>您选择了<span id="itemCount" class="large-bold-red" style="margin: 0 4px;"></span>本书，共计<span id="qtyCount" class="large-bold-red" style="margin: 0 4px;"></span>件
						</label>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>



</html>