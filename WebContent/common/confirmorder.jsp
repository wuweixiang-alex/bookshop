<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>确认订单-----STEP</title>

<script type="text/javascript" src="${ctx}/common/js/jquery-1.11.min.js"></script>
<script type="text/javascript" src="${ctx}/common/js/etao.js"></script>
<script type="text/javascript" src="${ctx}/common/js/cart.js"></script>
<link href="${ctx}/common/css/cart.css" media="screen" rel="stylesheet"
	type="text/css" />
<link href="${ctx}/common/css/bootstrap.min.css" media="screen"
	rel="stylesheet" type="text/css" />
</head>
<body class="container">
	  <script type="text/javascript">
    $(document).ready(function() {

        $("#new_address_button").click(function() {
            $.ajax({
                url: "<?php echo $this->baseUrl . '/system/address/save.ajax' ?>",
                type: 'POST',
                data: {"customer":$('#customer').val(),"address":$('#address').val(),"zip_code":$('#zip_code').val(),"telephone":$('#telephone').val(),"cell_phone":$('#cell_phone').val(),"contact_person":$('#contact_person').val(),"province_name":$('#province_name').val(),"city_name":$('#city_name').val(),"area_name":$('#area_name').val(),"is_default":0},
                error: function() { alert("添加收货地址出错!!"); },
                success: function(msg) {
                    //alert(msg);
                    $(".address-list li").removeClass("selected");
                    $(".address-list").append("<li class='selected'><input type='radio' id='addr_0' name='ship_to1' value='' checked /><label for='addr_0'>" + msg + "</label>");
                    $('#ship_to').val(msg);
                    $("#new_address_dialog").modal("hide");
                }
            });
        });

        $(".address-list li :radio").click(function() {
            $(this).parent().parent().addClass("selected").siblings().removeClass("selected");
        });



        
    function saveAddress() {
        $.ajax({
            type: "post",
            url: "<?php echo $this->baseUrl . '/system/address/save.ajax';?>",
            data: {"customer":$('#customer').val(),"address":$('#address').val(),"zip_code":$('#zip_code').val(),"telephone":$('#telephone').val(),"cell_phone":$('#cell_phone').val(),"contact_person":$('#contact_person').val(),"province_name":$('#province_name').val(),"city_name":$('#city_name').val(),"area_name":$('#area_name').val(),"is_default":0},
            error: function(msg) {alert("Error:" + msg);},
            success: function(msg) {
                $(".address-list li").removeClass("selected");
                $(".address-list").append("<li class='selected'><input type='radio' id='addr_0' name='ship_to1' value='' checked /><label for='addr_0'>" + msg + "</label>");
                $('#ship_to').val(msg);
                closeDiv('new_address_div');
            }
        });
    }

    //数据检查
        if ($("#terms").prop("checked") == false) {
            alert("提交订单前，请阅读《艾默生销售条款和条件》");
            return false;
        }
        return true;
    }
</script>  


	<div class="row">
		<div class="col-lg-2 col-md-2 col-sm-2 col-xs-3 hidden-print">
			热门推荐 or menu</div>

		<div class="col-lg-10 col-md-10 col-sm-10 col-xs-9" id="workspace"
			role="main">

			<div class="row hidden-print">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<ol class="breadcrumb">
						<li><a href="http://localhost:8080/bookShop/homePage.jsp">首页</a></li>
						<li class="active">确认购买</li>
					</ol>
				</div>
			</div>

			<form style="margin-bottom: 40px;" class="form-horizontal"
				id="order_confirm_form" name="order_confirm_form" method="POST"
				action="#">



				<!-- 收货地址 -->
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="well well-sm">
							<fieldset>
								<legend>
									收货地址
									<div class="btn-toolbar pull-right hidden-print" role="tolbar">
										<div class="btn-group btn-group-sm">
											<button type="button" class="btn btn-default"
												title="添加并使用新的收货地址" data-toggle="modal"
												data-target="#new_address_dialog">使用新地址(可选的添加功能，未完善)</button>
										</div>
									</div>
								</legend>
								
								<div class="form-group">
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="address">
											<ul class="address-list data-list">
												<li><label><input type="radio" name="ship_to1"
														/>${user.address}</label>
											</ul>
										</div>
									</div>
								</div>
							</fieldset>
						</div>
					</div>
				</div>

				<!-- 购买明细 -->
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
						<div class="well well-sm table-responsive">
							<fieldset>
								<legend>
									确认订单信息
								</legend>

					  <div class="cart-wrap">
		<table id="cartTable" class="cart table table-condensed">
			<thead>
				<tr>
					<th class="t-checkbox"><label><input class="check-all check" type="checkbox" style="display:none" checked="checked" /></label></th>
					<th class="t-goods text-center"><label>书的图片</label></th>
					<th class="text-center">书的相关描述</th>
					<th class="t-selling-price text-center"><label>&nbsp;&nbsp;&nbsp;书的单价</label></th>
					<th class="t-qty text-center"><label>采购数量</label></th>
					<th class="t-subtotal text-center"><label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;金额小计</label></th>
				</tr>
			</thead>
			<tbody>
		


<c:forEach var="cart" items="${gwc7}">			
				<tr>
					<td colspan="2" class="goods"><label> <input type="checkbox"  style="display:none" checked="checked" class="check-one check" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img style="height: 100px; width: 100px"alt="50x50" src="${ctx}/upload/${cart.book.image}" class="img-thumbnail" /> </label></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${cart.book.described}</td>
					<td class="selling-price number small-bold-red text-right"
								style="padding-top: 1.1rem;"data-bind="${cart.book.price}" ></td>  
					<td>
						<div class="input-group input-group-sm">
							  <input type="text" style="display:none" class="number form-control input-sm" value="${cart.count}" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${cart.count}
						</div>
					</td>
					<td class="subtotal number small-bold-red text-right" style="padding-top: 1.1rem;"></td>
						<td class="action" style="padding-top: 1.1rem;"></td>
				</tr>
</c:forEach>			
		
			</tbody>
		</table>


<div class="form-group">
								<label
									class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label">订单备注</label>
								<div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
									<textarea class="form-control input-sm" id="remark"
										name="remark" rows="1" maxLength="100"></textarea>
									<p class="help-block">100个汉字以内</p>
								</div>
							</div>


		<div class="row">
			<div class="col-md-12 col-lg-12 col-sm-12">
				<div class="cart-summary">
					
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
	
	
	
	

								<!-- 背对背订单、最终用途、销售条款 -->
								  <div class="row" style="margin-bottom: 20px;">
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
										<div class="checkbox pull-right">
											<label> <input type="checkbox" id="terms"
												name="terms" /> 我已阅读并同意《<a target="_blank"
												href="<?php echo $this->baseUrl . '/default/index/terms';?>">STEP-条款和条件</a>》
											</label>
										</div>

									</div>
								</div>  
								
								<div class="row">
									<div
										class="col-lg-offset-3 col-md-offset-3 col-sm-offset-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
										<button type="button" class="btn btn-lg btn-block btn-primary"
											id="btn_submit_order"
											onclick="sumbitOrder();">提交订单</button>
									</div>
								</div>
			</form>

		</div>


	</div>
</body>
	<script>
function sumbitOrder(){
    window.location.href='${ctx}/generateOrder.htm';
}
</script>
</html>