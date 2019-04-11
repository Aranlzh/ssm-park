<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta content="webkit|ie-comp|ie-stand" name="renderer" />
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />
<meta content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport" />
<meta content="no-siteapp" http-equiv="Cache-Control" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/H-ui.login.css" />
<title>管理员登陆</title>
</head>
<body>
<input id="TenantId" name="TenantId" type="hidden" value="" />
<div class="header"></div>
<div class="loginWraper">
  <div class="loginBox" id="loginform">
    <form action="${pageContext.request.contextPath }/admin/dologin" class="form form-horizontal" method="post">
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
        <div class="formControls col-xs-8">
          <input class="input-text size-L" id="name" name="name" placeholder="账户" type="text" />
        </div>
      </div>
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
        <div class="formControls col-xs-8">
          <input class="input-text size-L" id="password" name="password" placeholder="密码" type="password" />
        </div>
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <label style="color: red;font-size: 18px">${msg }</label>
        </div>
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <input class="btn btn-success radius size-L" type="submit" id="login" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;" />
          <input class="btn btn-default radius size-L" type="reset" id="cancel" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;" />
        </div>
      </div>
    </form>
  </div>
</div>
<div class="footer">Copyright &copy;1956-2018 仲恺农业工程学院.</div>
<!-- 引入公共js -->
<span>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/jquery/1.9.1/jquery.min.js" ></script> 
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/layer/2.4/layer.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/laypage/1.2/laypage.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/h-ui/js/H-ui.min.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/h-ui.admin/js/H-ui.admin.page.js;" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/jquery.contextmenu/jquery.contextmenu.r2.js" ></script>
</span>
</body>
<script type="text/javascript">
	$(function(){
		$("#login").click(function(){
			var name = $("#name").val();
			var password = $("#password").val();
			$.ajax({
				url:" /login",
				data:'name='+name+'&&password='+password,
				dataType:"html",
				success:function(data){
					if(data=='ok'){
						location.href=" /_blank"
					}
					else{
						alert("用户名或密码错误")
					}
				}
			})
		})
		$("#cancel").click(function(){
			location.href=" /login"
		})
	})
</script>
</html>