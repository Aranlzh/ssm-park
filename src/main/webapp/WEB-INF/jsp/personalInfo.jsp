<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="ssm.entity.User"%>
<%
	User user = (User) request.getSession().getAttribute("loginUser");
	if (user!=null) {
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>个人信息</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css" />
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
</head>
<body>
	<div>
		<div class="top" id="item4">
			<div class="container clearfix">
				<ul class="clearfix fr">
					<li><a href="#" id="user">${sessionScope.loginUser.name}</a></li>
					<li><a href="${pageContext.request.contextPath}/user/logout" id="cancel">退出登录</a></li>
					<li><a href="${pageContext.request.contextPath}/user/toUserPersonalInfo" id="person">个人中心</a></li>
				</ul>
			</div>
		</div>
		<div class="header">
			<div class="container clearfix">
				<div class="logo fl">
					<a href="${pageContext.request.contextPath}"><img alt="" src="${pageContext.request.contextPath}/resources/images/ZhkuParkingLogo.png" /></a>
				</div>
				<div class="mm fr clearfix">
					<a href="${pageContext.request.contextPath}/park/toCheckPark" id="checkcar">查车位</a>
				</div>
			</div>
		</div>
	</div>
	<div class="help-wrap">
		<div class="container clearfix">
			<div class="bread">当前位置：
				<a href="#">首页</a> >
				<a href="${pageContext.request.contextPath}/user/toUserPersonalInfo">个人中心</a> >
				<a href="${pageContext.request.contextPath}/user/toUserPersonalInfo">个人信息</a>
			</div>
		<div>
			<div class="help-l fl">
				<div class="help-item">
					<div class="help-item-title">个人中心
						<a class="abs" href="javascript:void(0)"></a>
					</div>
					<div class="help-item-list">
						<ul>
							<li><a href="${pageContext.request.contextPath}/user/toUserPersonalInfo" id="pInfo">个人信息</a></li>
							<li><a href="${pageContext.request.contextPath}/user/toPassword" id="changepsw">修改密码</a></li>
						</ul>
					</div>
				</div>
				<div class="help-item">
					<div class="help-item-title">订单管理
						<a class="abs" href="javascript:void(0)"></a>
					</div>
					<div class="help-item-list">
						<ul>
							<li><a href="${pageContext.request.contextPath}/orders/toShowOrders" id="myOrder">我的订单</a></li>
						</ul>
					</div>
				</div>
				<div class="help-item">
					<div class="help-item-title">留言管理
						<a class="abs" href="javascript:void(0)"></a>
					</div>
					<div class="help-item-list">
						<ul>
							<li><a href="${pageContext.request.contextPath}/message/toMyMessage" id="mymsg">我的留言</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="help-r fr">
			<div class="help-item-title">个人信息</div>
			<div class="help-main">
			<form action="${pageContext.request.contextPath}/user/editPhone&PlateNum" method="post">
				<input name="uid" type="text" value="${sessionScope.loginUser.id}" hidden="hidden"/>
				<p>
					<span class="nice">用户名：</span>
					<span>${sessionScope.loginUser.name}</span>
				</p>
				<p>
					<span class="nice">用户积分：</span>
					<input readonly="readonly" type="text" value="${sessionScope.loginUser.point}"/>
					<span class="nice">享受折扣：</span>
					<input readonly="readonly" type="text" id="rebate" value=""/>
					<script type="text/javascript">
						if(${sessionScope.loginUser.point}<100){
							$("#rebate").val("无折扣");
						}else if(${sessionScope.loginUser.point}>=100 && ${sessionScope.loginUser.point}<300){
							$("#rebate").val("9折");
						}else if(${sessionScope.loginUser.point}>=300 && ${sessionScope.loginUser.point}<500){
							$("#rebate").val("8折");
						}else{
							$("#rebate").val("7折");
						}
					</script>
					<span style="color: red">注：100~300享9折,300~500享8折,500以上享7折</span>
				</p>
				<p id="phone_palteNum">
					<script type="text/javascript">
						var url = '${pageContext.request.contextPath}/user/findUserById?id=' + ${sessionScope.loginUser.id};
						$.getJSON(url, function(data){
							console.log(data.plateNum);
							var phone = '<span class="nice">&nbsp;&nbsp;联系电话：</span>&nbsp;<input name="phone" type="text" value="'+data.phone+'" />';
							var plateNum = '<span class="nice">&nbsp;&nbsp;车牌号码：</span>&nbsp;&nbsp;<input name="plate_num" typfe="text" value="'+data.plateNum+'" />';
							var information = phone + plateNum;
							console.log(information);
							$("#phone_palteNum").append(information);
						});
					</script>
				</p>
				<input class="save" type="submit" value="修改" />
			</form>
		</div>
		</div>
	</div>
	</div>
	<div class="foot" style="background-color: #ebebeb">
		<div class="container">
			<div class="zhinan">
				<ul class="clearfix">
					<li class="item-li">关于我们
						<ul>
							<li><a href="#">联系我们</a></li>
							<li><a href="#">网站公告</a></li>
						</ul>
					</li>
					<li class="item-li">新手指南
						<ul>
							<li><a href="#">如何买票</a></li>
							<li><a href="#">修改密码</a></li>
						</ul>
					</li>
					<li class="item-li">配送方式
						<ul>
							<li><a href="#">配送范围</a></li>
							<li><a href="#">配送时间</a></li>
						</ul>
					</li>
					<li class="item-li">售后服务
						<ul>
							<li><a href="#">退票申请</a></li>
							<li><a href="#">改签申请</a></li>
						</ul>
					</li>
				</ul>
			</div>
			<div class="line"></div>
	
			<div class="bottom">
				<p>友情链接：<a href="#"></a>&nbsp;&nbsp;<a href="https://www.baidu.com">百度</a></p>
				<p>本站所有信息均为用户自由发布，本站不对信息的真实性负任何责任，交易时请注意识别信息的真假如有网站内容侵害了您的权益请联系我们删除</p>
				<p>Copyright ©2018.7-2018.8 基于H5的仲园汽车订票系统</p>
			</div>
		</div>
	</div>
</body>
</html>
<%
	}else{
		response.sendRedirect("../user/toUserLogin"); 
	}
%>