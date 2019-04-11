<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="ssm.entity.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<link href="${pageContext.request.contextPath}/resources/css/index.css" type="text/css" rel="stylesheet"/>
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
	<div class="banner container">
		<div class="clearfix">
			<div class="about fl">
				<img src="${pageContext.request.contextPath}/resources/images/timg.jpg" width="288px" alt=""/>
			</div>
			<div id="fsD1" class="focus fl">
				<div id="D1pic1" class="fPic">
					<div class="fcon" style="display:block;">
						<a ><img src="${pageContext.request.contextPath}/resources/images/lun1.jpg" style="opacity:1;"/></a>
						<span class="shadow"><a >九寨沟7日游</a></span>
					</div>
					<div class="fcon" style="display:none;">
						<a ><img src="${pageContext.request.contextPath}/resources/images/lun2.jpg" style="opacity:1;"/></a>
						<span class="shadow"><a >狂欢泼水节</a></span>
					</div>
					<div class="fcon" style="display:none;">
						<a ><img src="${pageContext.request.contextPath}/resources/images/lun3.jpg" style="opacity:1;"/></a>
						<span class="shadow"><a >当地玩乐</a></span>
					</div>
					<div class="fcon" style="display:none;">
						<a ><img src="${pageContext.request.contextPath}/resources/images/lun4.jpg" style="opacity:1;"/></a>
						<span class="shadow"><a >精选错峰游</a></span>
					</div>
					<div class="fcon" style="display:none;">
						<a><img src="${pageContext.request.contextPath}/resources/images/lun5.jpg" style="opacity:1;"/></a>
						<span class="shadow"><a >环球大赏世界海岛</a></span>
					</div>
				</div>
				<div class="fbg">
					<div class="D1fBt" id="D1fBt">
						<a href="javascript:void(0)" class="current" target="_self"><i>1</i></a>
						<a href="javascript:void(0)" target="_self"><i>2</i></a>
						<a href="javascript:void(0)" target="_self"><i>3</i></a>
						<a href="javascript:void(0)" target="_self"><i>4</i></a>
						<a href="javascript:void(0)" target="_self"><i>5</i></a>
					</div>
				</div>
			</div>
			<div class="help fr">
				<h2>最新公告</h2>
				<ul id="noticeList">
				<script>
					$.getJSON("${pageContext.request.contextPath}/notice/findAllNotices", function(data){
						 $.each(data, function(i,data){
							//console.log(data.createdate);
							//var i = data.createdate.length-1;
							var j = data.createdate.length-18;
							//console.log(i);
							//console.log(j);
							//console.log(data.createdate.substr(0, j));
							var notice = '<li><a href="${pageContext.request.contextPath}/notice/toFindNoticeById?id='+data.id+'" id="notice"><span id="titile">'+data.title+'</span><span style="float: right;margin-right: 3%" id="time">'+data.createdate.substr(0, j)+'</span></a></li>';
							//console.log(i);
							$("#noticeList").append(notice);
						});
					});
				</script> 
				</ul>
			</div>
		</div>
		<br>
	<img src="${pageContext.request.contextPath}/resources/images/img00.png" style="width: 1200px;height: auto;padding-top: 15px;"/><br>
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
	<script type="text/javascript">
		Qfast.add('widgets', { path: "${pageContext.request.contextPath}/resources/js/terminator2.2.min.js", type: "js", requires: ['fx'] });
		Qfast(false, 'widgets', function () {
			K.tabs({
				id: 'fsD1',   //焦点图包裹id
				conId: "D1pic1",  //** 大图域包裹id
				tabId:"D1fBt",
				tabTn:"a",
				conCn: '.fcon', //** 大图域配置class
				auto: 1,   //自动播放 1或0
				effect: 'fade',   //效果配置
				eType: 'click', //** 鼠标事件
				pageBt:true,//是否有按钮切换页码
				bns: ['.prev', '.next'],//** 前后按钮配置class
				interval: 3000  //** 停顿时间
			})
		})
	</script>
</body>
</html>