<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="ssm.entity.User"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>查看公告</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css" type="text/css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/koala.min.1.5.js"></script>
</head>
<body>
	<div>
	<%
		User user = (User) request.getSession().getAttribute("loginUser");
		if (user!=null) {
	%>
		<div class="top">
			<div class="container clearfix">
				<ul class="clearfix fr">
				
					<li><a href="#" id="user">${sessionScope.loginUser.name}</a></li>
					<li><a href="${pageContext.request.contextPath}/user/logout" id="cancel">退出登录</a></li>
					<li><a href="${pageContext.request.contextPath}/user/toUserPersonalInfo" id="person">个人中心</a></li>
	<%
		}else{
	%>
		<div class="top" id="item4">
			<div class="container clearfix">
				<ul class="clearfix fr">
					<li><a href="${pageContext.request.contextPath}/user/toUserLogin" >登录</a></li>
	<%
		}
	%>
				</ul>
			</div>
		</div>
		<div class="header">
			<div class="container clearfix">
				<div class="logo fl">
					<a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/resources/images/ZhkuParkingLogo.png"/></a>
				</div>
				<div class="mm fr clearfix">
					<a href="${pageContext.request.contextPath}/park/toCheckPark" id="checkcar">查车位</a>
				</div>
			</div>
		</div>
	</div>
	<div class="mainbody" style="background:#FFF url(${pageContext.request.contextPath}/resources/images/bodybg.png) repeat-x;">
		<div class="container clearfix" style="background-color: white">
			<div class="mainbody_topbg"></div>
			<div class="bread">当前位置：
				<a>首页</a> >
				<a>公告</a> >
				<a>公告详情</a>
			</div>
			<div class="maincontent" style="width: 100%">
				<div class="post">
					<h2><a>${notice.title}</a></h2>
					<div class="postdata">
						<div class="date"><fmt:formatDate value="${notice.createdate}" pattern="yyyy-MM-dd"/></div>
						<div class="cate">发表于 <a href="#">通知公告</a> </div>
					</div>
					<div class="content">
						<br>${notice.content}<br>
						<p style="text-align: right;"><fmt:formatDate value="${notice.createdate}" pattern="yyyy-MM-dd"/></p>
					</div>
				</div>
			</div>
			<div class="mainbody_bottombg"></div>
		</div>
	</div>
	<div class="foot" style="background-color: #ebebeb;">
		<div class="container">
			<div class="zhinan">
				<ul class="clearfix">
					<li class="item-li">
						关于我们
						<ul>
							<li><a href="#">联系我们</a></li>
							<li><a href="#">网站公告</a></li>
						</ul>
					</li>
					<li class="item-li">
						新手指南
						<ul>
							<li><a href="#">如何买票</a></li>
							<li><a href="#">修改密码</a></li>
						</ul>
					</li>
					<li class="item-li">
						配送方式
						<ul>
							<li><a href="#">配送范围</a></li>
							<li><a href="#">配送时间</a></li>
						</ul>
					</li>
					<li class="item-li">
						售后服务
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
	</div>
</body>
</body>
</html>