<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="ssm.entity.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css"  />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/table.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/koala.min.1.5.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/WdatePicker.js" ></script>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/WdatePicker.css">
<title>查询车位</title>
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
		<div class="top" >
			<div class="container clearfix">
				<ul class="clearfix fr">
					<li><a href="${pageContext.request.contextPath}/user/toUserLogin">登录</a></li>
	<%
		}
	%>
				</ul>
			</div>
		</div>
		<div class="header">
			<div class="container clearfix">
				<div class="logo fl">
					<a href="${pageContext.request.contextPath}"><img alt="" src="${pageContext.request.contextPath}/resources/images/ZhkuParkingLogo.png"></a>
				</div>
				<div class="mm fr clearfix">
					<a href="${pageContext.request.contextPath}/park/toCheckPark">查车位</a>
				</div>
			</div>
		</div>
	</div>
<div class="list-main">
	<div class="container">
		<div class="bread" style="margin-bottom: 0;">当前位置：
			<a href="#">首页</a> >
			<a href="${pageContext.request.contextPath}/park/toCheckPark">查车位</a>
		</div>
		<ul class="select">
			<li class="select-result">
				<dl>
					<dt>筛选条件：</dt>
					<dd class="select-no">
						<form action="" id="findP" method="post">
							<select class="form-control" name="status" id="status">
							<script type="text/javascript">
								if(${statusKey}==-1){
									var options = '<option value="-1">全部</option><option value="0">可预约</option><option value="1">已预约</option>';
									$("#status").append(options);
								}else if(${statusKey}==0){
									var options = '<option value="-1">全部</option><option value="0" selected="selected">可预约</option><option value="1">已预约</option>';
									$("#status").append(options);
								}else{
									var options = '<option value="-1">全部</option><option value="0">可预约</option><option value="1" selected="selected">已预约</option>';
									$("#status").append(options);
								}
							</script>
							</select>
						</form>
					</dd>
				</dl>
			</li>
		</ul>
		<script type="text/javascript">
			$("#status").change(function(){
				var status = $("#status option:selected").val();
				console.log(status);
				if(status == -1){
					//console.log("选择了全部");
					var newUrl = '${pageContext.request.contextPath}/park/toCheckPark';    //设置新提交地址
				    $("#findP").attr('action',newUrl);    //通过jquery为action属性赋值 
					$("#findP").submit();		//提交ID为findP的表单
				}else if(status == 0){
					//console.log("选择了可预约");
					var newUrl = '${pageContext.request.contextPath}/park/tofindStatusPark?status=0';    //设置新提交地址
				    $("#findP").attr('action',newUrl);    //通过jquery为action属性赋值 
					$("#findP").submit();
				}else{
					//console.log("选择了已预约");
					var newUrl = '${pageContext.request.contextPath}/park/tofindStatusPark?status=1';    //设置新提交地址
				    $("#findP").attr('action',newUrl);    //通过jquery为action属性赋值 
					$("#findP").submit();
				}
			});
		</script>
		<div class="tabs book clearfix" id="parkList">
			<script type="text/javascript">
				$.getJSON("${pageContext.request.contextPath}/park/findParkByStatus?status=${statusKey}", function(data){
					 $.each(data, function(i,data){
						 var head = '<dl><dt>';
						 if(data.status == 0){
							 // 车位状态是“0”，即未占用的话
							 var center = '<a href="${pageContext.request.contextPath}/park/findParkById?id='+data.id+'"><img alt="可预约" src="${pageContext.request.contextPath}/resources/images/cw.png" title="可预约"></a>';
						 }else{
							 // 车位状态是“1”，即已占用的话
							 var center = '<img alt="已占用" src="${pageContext.request.contextPath}/resources/images/cw2.png" title="已占用">';
						 }
						 var after = '</dt><dd><p><a href="">'+data.name+'</a></p><p></p><p>￥'+data.price+'</p></dd></dl>';
						 var park = head + center + after;
						 //console.log(park);
						 $("#parkList").append(park);
					});
				});
			</script>
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
	</div>
</body>
</html>