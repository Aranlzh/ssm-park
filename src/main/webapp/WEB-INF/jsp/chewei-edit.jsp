<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
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
<title>车位编辑 - H-ui.admin v3.0</title>
<meta name="keywords" content="H-ui.admin v3.0,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description" content="H-ui.admin v3.0，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
	<article class="cl pd-20">
		<form action="${pageContext.request.contextPath}/park/editPark" method="post" class="form form-horizontal" id="form-chewei-edit">
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>车次编号：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="${number }" placeholder="车次编号" id="number" name="name">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>车位价格：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="${price }" placeholder="车位价格" id="price" name="price">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>车位位置：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<span class="select-box" id="select1">
						<select id="province" name="address" class="select" >
							<option value="0">请选择</option>
							<option value="广东省">广东省</option>
						</select>
					</span>
					<span class="select-box" id="select2" style="display: none;">
						<select id="city" name="address" class="select" >
							<option value="0">请选择</option>
							<option value="广州市">广州市</option>
						</select>
					</span>
					<span class="select-box" id="select3" style="display: none;">
						<select id="district" name="address" class="select">
							<option value="0">请选择</option>
							<option value="越秀区">越秀区</option>
							<option value="海珠区">海珠区</option>
							<option value="荔湾区">荔湾区</option>
							<option value="天河区">天河区</option>
							<option value="白云区">白云区</option>
							<option value="黄埔区">黄埔区</option>
							<option value="南沙区">南沙区</option>
							<option value="番禺区">番禺区</option>
							<option value="花都区">花都区</option>
							<option value="从化区">从化区</option>
							<option value="增城区">增城区</option>
						</select>
					</span>
					<span id="select4" style="display: none;">
						<input id="address" name="address" type="text" class="input-text" value="${p4 }" placeholder="详细地址" style="width:52%;">
					</span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>车位备注：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="${remarks }" placeholder="车位备注" id="remarks" name="remark">
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
		$("#select option[value='${p1}']").prop("selected",true);
		$("#select2 option[value='${p2}']").prop("selected",true);
		$("#select3 option[value='${p3}']").prop("selected",true);
	});
	
	$(function(){
		$('.skin-minimal input').iCheck({
			checkboxClass: 'icheckbox-blue',
			radioClass: 'iradio-blue',
			increaseArea: '20%'
		});
		
		$("#form-chewei-edit").validate({
			rules:{
				number:{
					required:true,
					minlength:2,
					maxlength:16
				},	
				price:{
					required:true
				},
			},
			onkeyup:false,
			focusCleanup:true,
			success:"valid",
			submitHandler:function(form){
				$(form).ajaxSubmit({
					async : false,
					success: function(data){
						if(data.res==1){
							layer.msg('修改成功!',{icon:1,time:1000});
							setTimeout(function() {
								var index = parent.layer.getFrameIndex(window.name);
								parent.location.reload(); //父页面刷新
								parent.layer.close(index);//关闭弹出的子页面窗口
							}, "1000");
						}else{
							layer.msg('操作失败!',{icon: 2,time:1000});
						}
					},
	                error: function(XmlHttpRequest, textStatus, errorThrown){
						layer.msg('error!',{icon:1,time:1000});
					}
				});
			}
		});
		
		$("#province").change(function(){
			if($(this).val() == 0){
				$("#select2").hide();
				$("#select3").hide();
				$("#select4").hide();
			}
			else{
				$("#select2").show();
			}
		});
		$("#city").change(function(){
			if($(this).val() == 0){
				$("#select3").hide();
				$("#select4").hide();
			}else{
				$("#select3").show();
			}
		});
		$("#district").change(function(){
			if($(this).val() == 0){
				$("#select4").hide();
			}else{
				$("#select4").show();
			}
		});
	});
	</script> 
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>