<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!--_meta 作为公共模版分离出去-->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="favicon.ico" >
<link rel="Shortcut Icon" href="favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/html5.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script><![endif]-->
<!--/meta 作为公共模版分离出去-->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>添加公告 - H-ui.admin v3.0</title>
<meta name="keywords" content="H-ui.admin v3.0,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description" content="H-ui.admin v3.0，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
	<article class="cl pd-20">
		<form action="${pageContext.request.contextPath}/notice/insertNotice" method="post" class="form form-horizontal" id="form-gonggao-add">
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>标题：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="" placeholder="标题" id="title" name="title">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>内容：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<textarea name="content" cols="" rows="" class="textarea"  placeholder="请输入具体内容" onKeyUp="textarealength(this,100)"></textarea>
				</div>
			</div>
			<div class="row cl">
				<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
					<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
				</div>
			</div>
		</form>
	</article>
	
	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/jquery/1.9.1/jquery.min.js"></script> 
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/h-ui/js/H-ui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/h-ui.admin/js/H-ui.admin.page.js"></script>
	<!--/_footer /作为公共模版分离出去-->
	
	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/jquery.validation/1.14.0/messages_zh.js"></script> 
	<script type="text/javascript">
	$(function(){
		$('.skin-minimal input').iCheck({
			checkboxClass: 'icheckbox-blue',
			radioClass: 'iradio-blue',
			increaseArea: '20%'
		});
		
		$("#form-gonggao-add").validate({
			rules:{
				username:{
					required:true,
					minlength:2,
					maxlength:16
				},			
			},
			onkeyup:false,
			focusCleanup:true,
			success:"valid",
			submitHandler:function(form){
				$(form).ajaxSubmit({
					async:false,
					success:function(data){
						if(data.res!=0){
							layer.msg('添加成功!',{icon:1,time:1000});
							setTimeout(function(){
								var index = parent.layer.getFrameIndex(window.name);
								parent.location.reload(); //父页面刷新
								parent.layer.close(index);//关闭弹出的子页面窗口
							},"1000");
						}else{
							layer.msg('添加失败!',{icon:2,time:1000});
						}
					},
					error:function(XmlHttpRequest,textStatus,errorThrown){
						layer.msg('error',{icon:1,time:1000});
					}
				});
			}
		});
	});
	</script> 
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>