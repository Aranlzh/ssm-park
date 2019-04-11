<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--_meta 作为公共模版分离出去-->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="favicon.ico">
<link rel="Shortcut Icon" href="favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/html5.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/static/h-ui.admin/skin/default/skin.css"
	id="skin" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script><![endif]-->
<!--/meta 作为公共模版分离出去-->

<script>
	window.onload = function() {
		//定时器每秒调用一次fnDate()
		setInterval(function() {
			fnDate();
		}, 1000);
	}
	//js 获取当前时间
	function fnDate() {
		var oDiv = document.getElementById("time");
		var date = new Date();
		var year = date.getFullYear();//当前年份
		var month = date.getMonth();//当前月份
		var data = date.getDate();//天
		var hours = date.getHours();//小时
		var minute = date.getMinutes();//分
		var second = date.getSeconds();//秒
		var time = year + "/" + fnW((month + 1)) + "/" + fnW(data) + " "
				+ fnW(hours) + ":" + fnW(minute) + ":" + fnW(second);
		oDiv.innerHTML = time;
	}
	//补位 当某个字段不是两位数时补0
	function fnW(str) {
		var num;
		str > 10 ? num = str : num = "0" + str;
		return num;
	}
</script>

<title>管理员列表</title>
<meta name="keywords"
	content="H-ui.admin v3.0,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description"
	content="H-ui.admin v3.0，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
	<!--_header 作为公共模版分离出去-->
	<header class="navbar-wrapper">
	<div class="navbar navbar-fixed-top">
		<div class="container-fluid cl">
			<a class="logo navbar-logo f-l mr-10 hidden-xs"
				href="/aboutHui.shtml">后台管理系统</a> <a
				class="logo navbar-logo-m f-l mr-10 visible-xs"
				href="/aboutHui.shtml">H-ui</a> <span
				class="logo navbar-slogan f-l mr-10 hidden-xs">v3.0</span> <a
				aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs"
				href="javascript:;">&#xe667;</a>
			<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
			<ul class="cl">
				<li id="time"></li>
				<li class="dropDown dropDown_hover"><a href="#"
					class="dropDown_A">${loginAdmin.name } <i class="Hui-iconfont">&#xe6d5;</i></a>
					<ul class="dropDown-menu menu radius box-shadow">
						<li><a href="javascript:;" onClick="myselfinfo()">个人信息</a></li>
						<li><a href="${pageContext.request.contextPath }/admin/login"
							id="switch">切换账户</a></li>
						<li><a
							href="${pageContext.request.contextPath }/admin/logout" id="quit">退出</a></li>
					</ul></li>
				<li id="Hui-skin" class="dropDown right dropDown_hover"><a
					href="javascript:;" class="dropDown_A" title="换肤"><i
						class="Hui-iconfont" style="font-size: 18px">&#xe62a;</i></a>
					<ul class="dropDown-menu menu radius box-shadow">
						<li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a>
						</li>
						<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a>
						</li>
						<li><a href="javascript:;" data-val="green" title="绿色">绿色</a>
						</li>
						<li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
						<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a>
						</li>
						<li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
					</ul></li>
			</ul>
			</nav>
		</div>
	</div>
	</header>
	<!--/_header 作为公共模版分离出去-->

	<!--_menu 作为公共模版分离出去-->
	<aside class="Hui-aside">

	<div class="menu_dropdown bk_2">
		<dl id="menu-article">
			<dt>
				<i class="Hui-iconfont">&#xe616;</i> 信息发布管理<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a
						href="${pageContext.request.contextPath }/admin/noticeList"
						title="公告管理" id="noticemng">公告管理</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-picture">
			<dt>
				<i class="Hui-iconfont">&#xe613;</i> 车位管理<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a
						href="${pageContext.request.contextPath }/admin/pasrkList"
						title="车位列表" id="carlist">车位列表</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-product">
			<dt>
				<i class="Hui-iconfont">&#xe620;</i> 订单管理<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a
						href="${pageContext.request.contextPath }/admin/ordersList"
						title="订单列表" id="orderlist">订单列表</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-comments">
			<dt>
				<i class="Hui-iconfont">&#xe622;</i> 积分管理<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a
						href="${pageContext.request.contextPath }/admin/scoreList"
						title="积分排行" id="cpointrank">积分排行</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-member">
			<dt>
				<i class="Hui-iconfont">&#xe60d;</i> 投诉建议管理<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a
						href="${pageContext.request.contextPath }/admin/messageList"
						title="留言列表" id="msglist">留言列表</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-admin">
			<dt>
				<i class="Hui-iconfont">&#xe62d;</i> 系统管理<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd style="display: block">
				<ul>
					<li><a
						href="${pageContext.request.contextPath }/admin/adminList"
						title="管理员列表" id="adminlist">管理员列表</a></li>
					<li><a
						href="${pageContext.request.contextPath }/admin/userList"
						title="用户列表" id="userlist">用户列表</a></li>
				</ul>
			</dd>
		</dl>
	</div>
	</aside>
	<div class="dislpayArrow hidden-xs">
		<a class="pngfix" href="javascript:void(0);"
			onClick="displaynavbar(this)"></a>
	</div>
	<!--/_menu 作为公共模版分离出去-->

	<section class="Hui-article-box"> <!--<div class="Hui-tabNav-wp">
			<ul class="acrossTab cl" id="min_title_list" style="width: 253px; left: 0px;">
				<li class="">
					<span data-href="/welcome" title="我的桌面">我的桌面</span>
					<em></em></li>
		<li class="active"><span data-href="/admin/admin-list">管理员管理</span><i></i><em></em></li></ul>
	</div>--> <nav class="breadcrumb">
	<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
	系统管理 <span class="c-gray en">&gt;</span> 管理员列表 <a id="btn-refresh"
		class="btn btn-success radius r"
		style="line-height: 1.6em; margin-top: 3px"
		href="javascript:location.replace(location.href);" title="刷新"><i
		class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="Hui-article">
		<article class="cl pd-20">
		<div class="text-c">
			<form class="Huiform" method="post" target="_self"
				action="${pageContext.request.contextPath }/admin/findAdmins">
				<input type="text" class="input-text" style="width: 250px"
					placeholder="输入管理员名称" name="searchAdmin" value="${searchAdmin}">
				<button type="submit" class="btn btn-success">
					<i class="Hui-iconfont">&#xe665;</i> 搜用户
				</button>
			</form>
		</div>
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l"><a href="javascript:;"
				onclick="admin_add('添加管理员','${pageContext.request.contextPath }/admin/admin-add','','310')"
				class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i>
					添加管理员</a></span> <span class="r">共有数据：<strong id="count">${count }</strong>
				条
			</span>
		</div>
		<table class="table table-border table-bordered table-bg">
			<thead>
				<tr>
					<th scope="col" colspan="5">管理员列表</th>
				</tr>
				<tr class="text-c">
					<th width="50">序号</th>
					<th width="120">管理员名称</th>
					<th width="120">密码</th>
					<th width="100">注册时间</th>
					<th width="100">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${adminList }" var="admin" varStatus="status">
					<tr class="tohidden" id=${admin.id }>
						<td>${status.index+1 }</td>
						<td>${admin.name }</td>
						<td>${admin.password }</td>
						<td>${admin.createdate }</td>
						<td class="td-manage"><a class="ml-5" href="javascript:;"
							onclick="admin_del(this)" style="text-decoration: none"
							title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</article>
	</div>
	</section>

	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/lib/layer/2.4/layer.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/static/h-ui/js/H-ui.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/static/h-ui.admin/js/H-ui.admin.page.js"></script>
	<!--/_footer /作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/lib/laypage/1.2/laypage.js"></script>
	<!--/请在上方写此页面业务相关的脚本-->
	<script type="text/javascript">
		function admin_add(title, url, w, h) {
			layer_show(title, url, w, h);
		}
	</script>
</body>
<script type="text/javascript">
	$(function() {
		$("#switch").click(function() {
			location.href = "  /login"
		})
		$("#quit").click(function() {
			location.href = "  /login"
		})
		$("#noticemng").click(function() {
			$.ajax({
				url : "  /user-list",
				dataType : "html",
				success : function() {
					location.href = " /gonggao-list"
				}
			})
		})
		$("#carlist").click(function() {
			$.ajax({
				url : "  /user-list",
				dataType : "html",
				success : function() {
					location.href = " /chewei-list"
				}
			})
		})
		$("#orderlist").click(function() {
			$.ajax({
				url : "  /user-list",
				dataType : "html",
				success : function() {
					location.href = " /dingdan-list"
				}
			})
		})
		$("#cpointrank").click(function() {
			$.ajax({
				url : "  /user-list",
				dataType : "html",
				success : function() {
					location.href = " /jifen-list"
				}
			})
		})
		$("#msglist").click(function() {
			$.ajax({
				url : "  /user-list",
				dataType : "html",
				success : function() {
					location.href = " /liuyan-list"
				}
			})
		})
		$("#adminlist").click(function() {
			$.ajax({
				url : "  /user-list",
				dataType : "html",
				success : function() {
					location.href = " /admin-list"
				}
			})
		})
		$("#userlist").click(function() {
			$.ajax({
				url : "  /user-list",
				dataType : "html",
				success : function() {
					location.href = " /user-list"
				}
			})
		})
	})
</script>
<script>
	function admin_del(obj) {
		layer.confirm('确认要删除吗？', function(index) {
			var adminId = $(obj).parents("tr").attr("id");
			$.ajax({
				type : 'POST',
				url : '${pageContext.request.contextPath }/admin/delAdminById',
				data : {
					"id" : adminId
				},
				dataType : 'json',
				success : function(data) {
					if (data.res == 0) {
						$(obj).parents("tr").remove();
						layer.msg('已删除!', {
							icon : 1,
							time : 1000
						});
						location.reload();
					} else {
						layer.msg('操作失败!', {
							icon : 2,
							time : 1000
						});
					}
				}
			});
		});
	}
</script>
</html>