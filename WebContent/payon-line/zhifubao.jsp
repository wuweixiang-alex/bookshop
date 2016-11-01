<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>支付宝 - 网上支付 安全快速！</title>
<meta name="renderer" content="webkit" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta name="description" content="中国最大的第三方电子支付服务提供商" />
<link rel="shortcut icon" href="${ctx}/payon-line/ico/favicon.ico"
	type="image/x-icon" />

<link charset="utf-8" rel="stylesheet"
	href="https://a.alipayobjects.com/cashierx/cashier/1.1.5/main.css"
	media="all" />
<link rel="stylesheet"
	href="https://a.alipayobjects.com/cashiers/1.7.2/page.css" />

<style>
@font-face {
	font-family: 'cashier';
	src: url("//at.alicdn.com/t/font_1434596335_6737535.eot"); /* IE9*/
	src: url("//at.alicdn.com/t/font_1434596335_6737535.eot?#iefix")
		format('embedded-opentype'), /* IE6-IE8 */
  url("//at.alicdn.com/t/font_1434596335_6737535.woff") format('woff'),
		/* chrome、firefox */
  url("//at.alicdn.com/t/font_1434596335_6737535.ttf")
		format('truetype'),
		/* chrome、firefox、opera、Safari, Android, iOS 4.2+*/
  url("//at.alicdn.com/t/font_1434596335_6737535.svg#cashier")
		format('svg'); /* iOS 4.1- */
}

.iconfont {
	font-family: "cashier" !important;
	font-style: normal;
	font-weight: normal;
	cursor: default;
	-webkit-font-smoothing: antialiased;
}
</style>
<link href="https://a.alipayobjects.com" rel="dns-prefetch" />
<link href="https://app.alipay.com" rel="dns-prefetch" />
<link href="https://my.alipay.com" rel="dns-prefetch" />
<link href="https://lab.alipay.com" rel="dns-prefetch" />
<link href="https://cashier.alipay.com" rel="dns-prefetch" />
<link href="https://financeprod.alipay.com" rel="dns-prefetch" />
<link href="https://shenghuo.alipay.com" rel="dns-prefetch" />

<style>
.repair,.repair2,.repair3,.restricted {
	_display: block;
}
</style>


</head>
<body>
	<div class="g_nav">
		<div class="g_nav-fixwidth">
			<ul>
				<li>您好，欢迎使用支付宝付款！</li>
				<li><a href="#faq" id="J-faq-trigger">常见问题</a></li>
				<li class="g_nav-sep">|</li>
				<li>唯一热线：95188</li>
			</ul>
		</div>
	</div>

	<div id="header">
		<div class="header-container fn-clear">
			<div class="header-title">
				<span class="logo">支付宝<s></s></span> <span class="logo-title">我的收银台</span>
			</div>
		</div>
	</div>
	<div id="container">
		<input type="hidden" name="stat" value="fail" class="stat" />
		<div id="content">


			<link rel="stylesheet" type="text/css"
				href="https://a.alipayobjects.com/??alice/tipbox/1.1.0/tipbox.css,alice-button/1.4.2/button.css">
			<style>
div.ui-tipbox-content {
	margin: 0 30px 0 0;
	padding: 14px 0 14px 87px;
}

.ui-tipbox-content .ui-securitycore .ui-tip-icon {
	display: none;
}

.ui-tipbox-content .ui-securitycore .ui-tip-content {
	padding: 0;
}

div.ui-tipbox-guide {
	border: 1px solid #e1e1ca;
	border-top: 0;
	background: #fff;
}

.ui-tipbox-recommendation {
	border: 1px solid #e1e1ca;
	border-top: 0;
}

.ui-tipbox-recommend {
	color: #A6A6A6;
	padding: 40px 40px 40px 87px;
}

.ui-tipbox-recommend p {
	margin-bottom: 10px;
}

.ui-tipbox-recommend .ui-tipbox-desc {
	font-size: 14px;
	color: #666;
}

.ui-tipbox-recommend p .ui-button-guide {
	display: inline-block;
	*display: inline;
	*zoom: 1;
	padding: 6px 20px;
	color: #fff;
	background: #1FBCEC;
	font-size: 14px;
	text-align: center;
	border-radius: 3px;
}

.ui-tipbox-icon .iconfont {
	height: 26px;
	width: 26px;
	line-height: 26px;
	left: -3px;
	top: -4px;
	font-size: 26px;
}

.ui-tipbox .ui-tipbox-icon {
	top: 20px;
	width: 18px;
	height: 18px;
}

.ui-tipbox-explain {
	line-height: 1.5;
}

.ui-tipbox-guide .ui-tipbox-content {
	_zoom: 1;
	_overflow: hidden;
}

.ui-tipbox-guide .vertical-bar-wrapper {
	overflow: hidden;
	margin-left: -10px;
}

.ui-tipbox-guide .vertical-bar-wrapper .vertical-bar {
	border-left: 1px solid #d9d9d9;
	padding-right: 10px;
	padding-left: 10px;
	margin-left: -1px;
}
</style>
			<div class="ui-tipbox-recommendation">
				<!-- FD:73:cashier/common/newErrorCliveGuide.vm:START -->
				<!-- FD:73:cashier/common/newErrorCliveGuide.vm:396:newErrorCliveGuide.schema:newErrorCliveGuide-新客服引导:START -->




				<style>
.ui-tipbox-recommendation .ui-tipbox-content {
	margin-top: 0;
	margin-bottom: 0;
}
</style>
				<!-- CASHIER_ORDER_NOT_EXIST , $subErrorCodeForClive ,  , $channelTypeForClive ,  ,  -->
				<!-- CMS:全站公共 cms/全站公告/pc报错服务小贴士开始:notice/errorTips.vm -->
				<style type="text/css">
.ui-error-tips-container {
	display: none;
	position: relative;
	left: 57px;
	zoom: 1;
	padding-top: 30px;
}

.ui-error-tips-icon {
	float: left;
	margin-left: -57px;
	/* IE6 icon -margin bug fix*/
	position: relative;
	zoom: 1;
}

.ui-error-tips-icon i.icon {
	display: block;
	width: 34px;
	height: 37px;
	margin-left: 10px;
	background:
		url('https://t.alipayobjects.com/tfscom/T1FjdfXoRsXXXXXXXX.png')
		no-repeat;
}

.ui-error-tips-icon span {
	color: #976c42;
}

.ui-error-tips-content {
	margin-bottom: 40px;
}

.ui-error-tips-section {
	margin-top: 7px;
}

.ui-error-tips-title {
	font-size: 14px;
	font-weight: bold;
	line-height: 16px;
}

.height-limited {
	position: relative;
	margin-top: 7px;
	min-height: 100px;
	max-height: 290px;
	width: 100%;
	overflow-x: hidden;
	overflow-y: auto;
}

.ui-error-tips-select {
	position: relative;
	margin-top: 4px;
	width: 320px;
}

.ui-error-tips-select select {
	appearance: none;
	-ms-appearance: none;
	-moz-appearance: none; /* Firefox */
	-webkit-appearance: none; /* Safari and Chrome */
	width: 320px;
	height: 22px;
	padding: 0 12px;
	font-size: 12px;
	line-height: 1.5;
	color: #595959;
	vertical-align: middle;
	background-color: #FFF;
	border: 1px solid #adadad;
	border-radius: 0;
	box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.075) inset;
	transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s
		ease-in-out 0s;
	position: relative;
	background-image:
		url('https://t.alipayobjects.com/tfscom/T1Jy8fXcpuXXXXXXXX.png');
	background-position: 298px;
	background-repeat: no-repeat;
}

.ui-error-tips-select select:focus {
	outline-width: 1px;
}

.ui-error-tips-description-wrap {
	
}

.ui-error-tips-description {
	margin-top: 20px;
}

.ui-error-tips-description.directly {
	margin-top: 0;
}

.ui-error-tips-section.section-1 {
	margin-top: 0;
}

.ui-error-tips-description-knowledge {
	position: relative;
	line-height: 1.5;
	padding: 10px 14px;
	background-color: #f2f2f2;
	font-size: 12px;
	margin-right: 60px;
}

.ui-description-inner {
	position: relative;
	overflow: hidden;
	width: 100%;
	height: 100%;
}

.ui-description-inner table {
	table-layout: fixed;
}

.ui-error-tips-actions {
	margin: 0 -30px 0 -87px;
	padding: 14px 0 0 0;
	border-top: 1px solid #e1e1ca;
	/*IE6 fix*/
	position: relative;
	zoom: 1;
	line-height: 0;
}

.ui-error-tips-section .next-steps {
	display: none;
}

.ui-error-tips-section .ui-error-tips-title {
	color: #976d43;
}

.ui-error-tips-title span.dot {
	width: 11px;
	height: 14px;
	float: left;
	background:
		url('https://t.alipayobjects.com/tfscom/T1DzpfXeXpXXXXXXXX.png')
		no-repeat;
}
</style>
				<div class="ui-error-tips-container">
					<div class="ui-error-tips-icon">
						<i class="icon"> </i>
					</div>
					<div class="ui-error-tips-content" id="errorTipsContent">
						<div class="ui-error-tips-title">
							<h3 id="errorTipsFlowName"></h3>
						</div>
						<div class="height-limited">
							<div class="ui-error-tips-section-wrap" id="errorTipsSection"></div>
							<div class="ui-error-tips-description-wrap"
								id="errorTipsDescription"></div>
						</div>
					</div>
				</div>


				<div class="ui-tipbox ui-tipbox-guide ui-tipbox-message">
					<div class="ui-tipbox-content">

						<p class="ui-tipbox-explain vertical-bar-wrapper">

							<a class="vertical-bar" href="#">登录支付宝</a>
							需要买一个支付宝接口，如果用户支付成功   后台管理的订单表 显示 已付款
							商家准备发货

						</p>
					</div>
				</div>
			</div>
		</div>
</body>
</html>
