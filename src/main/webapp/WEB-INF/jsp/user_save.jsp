<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>注册成功</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/animate-custom.css" />
</head>

<body style="background: #fff url(${pageContext.request.contextPath}/resources/images/bg.jpg) repeat top left;">

	<div id="container_demo">
		<a class="hiddenanchor" id="toregister"></a>
		<a class="hiddenanchor" id="tologin"></a>
		<div id="wrapper">
			<div class="animate form" id="login">
					<h1>注册成功</h1> 
					<p class="change_link">  
						<a class="to_register" href="${pageContext.request.contextPath}/user/toUserLogin" id="toUserLogin">去登录 </a>
					</p>
			</div>
		</div>
	</div>
</body>
</html>