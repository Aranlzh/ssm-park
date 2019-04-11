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
<title>我的订单</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/table.css" />
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<style type="text/css">
	.help-main p{line-height:50px;}
</style>
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
			<a href="#">订单管理</a> >
			<a href="#">我的订单</a>
		</div>
	<div>
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
	</div>
		<div class="help-r fr">
			<div class="help-item-title">已买车票</div>
			<div class="help-main">
				<table class="table table-hover" id="orderList">
				<thead>
					<tr>
			        <th>订单编号</th>
			        <th>下单时间</th>
			        <th>车牌号</th>
			        <th>车位编号</th>
			        <th>车位价格</th>
			        <th>应付金额</th>
			        <th>状态</th>
			        <th>操作</th>
			      </tr>
			      <tr></tr>
			      <script>
			      	function formatDate(date) {
			      		var d = new Date(date),
			    	    month = '' + (d.getMonth() + 1),
			    	    day = '' + d.getDate(),
			    	    year = d.getFullYear();
			    		if (month.length < 2) month = '0' + month;
			    		if (day.length < 2) day = '0' + day;
			    		return [year, month, day].join('-');
			    	}
			    	
			      	function getIntervalDay(startDate, endDate) {
			            var ms = endDate - startDate;
			            if (ms < 0) return 0;
			            return Math.floor(ms/1000/60/60/24);
			        }
			      	
			    	var url = '${pageContext.request.contextPath}/orders/selectOrdersByUserId?id='+${sessionScope.loginUser.id};
					//console.log(url);
			    	$.getJSON(url, function(data){
						$.each(data, function(i,data){
							var startDate = new Date(data.createdate);
							console.log(startDate);
							//console.log(formatDate(date));
							//var array = date.split(" ");
							//console.log(array[0]);
							var first = '<tr><td>'+data.code+'</td><td>'+formatDate(startDate)+'</td><td>'+data.user.plateNum+'</td><td>'+data.park.name+'</td><td>'+data.park.price+'</td>';
							if(data.status==1){
								var second = '<td>'+data.total+'</td><td><span style="color: green;">订单完成</span></td><td><a href="${pageContext.request.contextPath}/orders/userDeleteOrderById?id='+data.id+'">删除</a></td></tr>';
							}else{
								var endDate = new Date();
								console.log(endDate);
								var days = getIntervalDay(startDate, endDate);
								var total = days*data.park.price;
								console.log(days);
								console.log(total);
								var second = '<td>'+total+'</td><td><span style="color: red">待付款</span></td><td><a href="${pageContext.request.contextPath}/orders/settlementOrderById?id='+data.id+'&userId='+data.userId+'&parkId='+data.parkId+'&total='+total+'">结算</a></td></tr>';
							}
							var order = first + second;
							console.log(order);
							$("#orderList").append(order);
						});
					});
				</script>
			</thead></table>
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
			<p>友情链接：&nbsp;&nbsp;<a href="https://www.baidu.com/">百度</a></p>
			<p>本站所有信息均为用户自由发布，本站不对信息的真实性负任何责任，交易时请注意识别信息的真假如有网站内容侵害了您的权益请联系我们删除</p>
			<p>Copyright ©2018.7-2018.8 基于H5的仲园汽车订票系统</p>
		</div>
	</div>
</body>
</html>
<%
	}else{
		response.sendRedirect("../user/toUserLogin"); 
	}
%>