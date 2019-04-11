<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>订票网</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/animate-custom.css" />
	<script type="text/javascript">
		var isShow = true;
	
		function change() {
			var v = document.getElementById("passwordsignup");
			var v2 = document.getElementById("passwordsignup2");
			if(isShow) {
				v.type = "text";
				v2.type = "text";
				isShow = false;
			} else {
				v.type = "password";
				v2.type = "password";
				isShow = true;
			}
		};
	
		function checkphone(){
			var tel = document.getElementById("tel").value;
			if(!(/^1[3579]\d{9}$/.test(tel))){
				alert('请填写正确的11位手机号码');
				return false;			
			}
		};
	
		function checkcarNum(){
			var carNum = document.getElementById("carNum").value;
			if(!(/^[京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}[A-Z0-9]{4}[A-Z0-9挂学警港澳]{1}$/.test(academy))){
				alert('请输入正确的车牌号码，如：粤A12345');
				return false;
			}
		};
		function checkpwd() {
			var p1 = document.getElementById("passwordsignup").value; //获取密码框的值
			var p2 = document.getElementById("passwordsignup2").value; //获取重新输入的密码值
			if(p1 != p2) { //判断两次输入的值是否一致，不一致则显示错误信息
				document.getElementById("msg").innerHTML = "两次输入密码不一致，请重新输入"; //在div显示错误信息
				return true;
			} else {
				document.getElementById("msg").innerHTML = ""; //在div显示错误信息
				return false;
			}
		};
	</script>
</head>
<body style="background: #fff url(${pageContext.request.contextPath}/resources/images/bg.jpg) repeat top left;">
	<div id="container_demo">
		<a class="hiddenanchor" id="toregister"></a>
		<a class="hiddenanchor" id="tologin"></a>
		<div id="wrapper">
			<div class="animate form" id="login">
				<form action="${pageContext.request.contextPath}/user/login" autocomplete="on" method="post">
					<h1>登录</h1> 
					<p> 
						<label class="uname" data-icon="u" for="username">您的用户名</label>
						<input id="username" name="username" placeholder="请输入用户名" required="required" type="text" />
					</p>
					<p> 
						<label class="youpasswd" data-icon="p" for="password">你的密码</label>
						<input id="password" name="password" placeholder="请输入密码" required="required" type="password" />
					</p>
					<p> 
						<span style="color: red;font-size: 18px">${msg}</span>
					</p>
					<p class="login button"> 
						<input type="submit" value="登录" id="enter"/> 
					</p>
					<p class="change_link">
						不是成员?<a class="to_register" href="#toregister">加入我们</a>
					</p>
				</form>
			</div>
			<div class="animate form" id="register">
				<form action="${pageContext.request.contextPath}/user/register" autocomplete="on" method="post">
					<h1>注册</h1> 
					<p> 
						<label class="uname" data-icon="u" for="usernamesignup">用户名</label>
						<input id="usernamesignup" name="name" placeholder="用户名" required="required" type="text" />
					</p>
					<p> 
						<label class="youmail" for="tel">联系电话</label>
						<input  id="tel" name="phone" placeholder="联系电话" required="required" type="tel" 
						maxLength="11" onchange="checkphone()" />
					</p>
					<p> 
					<label class="youmail" for="carNum">车牌号码</label>
					<input id="carNum" name="plate_num" placeholder="如：粤A12345" required="required" type="text"
						maxLength="7" onchange="checkcarNum()" />
					</p>
					<p> 
						<label class="youpasswd" data-icon="p" for="passwordsignup">密码</label>
						<input id="passwordsignup" name="password" placeholder="密码" required="required" type="password" />
					</p>
					<p> 
						<label class="youpasswd" data-icon="p" for="passwordsignup2" >再次输入</label>
						<input id="passwordsignup2" name="passwordB" placeholder="密码" required="required" type="password" onmouseout="checkpwd()"/>
					</p>
					<p><input type="checkbox" onclick="change()" id ="changepsw"/>显示密码</p>
					<div id="msg" style="color:red;"></div>
					<p class="signin button"> 
						<input type="submit" value="注册" id="sign"/> 
					</p>
					<p class="change_link">  
						已经是成员?<a class="to_register" href="${pageContext.request.contextPath}/user/toUserLogin"> 去登录 </a>
					</p>
				</form>
			</div>	
		</div>		
	</div>
	
</body>

</html>