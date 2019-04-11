<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<%-- <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> --%>
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script><![endif]-->
<!--/meta 作为公共模版分离出去-->

<title>车位列表</title>
<meta name="keywords" content="H-ui.admin v3.0,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description" content="H-ui.admin v3.0，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
<!--_header 作为公共模版分离出去-->
<header class="navbar-wrapper">
	<div class="navbar navbar-fixed-top">
		<div class="container-fluid cl">
			<a class="logo navbar-logo f-l mr-10 hidden-xs" href="/aboutHui.shtml">后台管理系统</a>
			<a class="logo navbar-logo-m f-l mr-10 visible-xs" href="/aboutHui.shtml">H-ui</a>
			<span class="logo navbar-slogan f-l mr-10 hidden-xs">v3.0</span>
			<a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
			<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
				<ul class="cl">
					<li id="time"></li>
					<li class="dropDown dropDown_hover">
						<a href="#" class="dropDown_A">${loginAdmin.name } <i class="Hui-iconfont">&#xe6d5;</i></a>
						<ul class="dropDown-menu menu radius box-shadow">
							<li><a href="javascript:;" onClick="myselfinfo()">个人信息</a></li>
							<li><a href="${pageContext.request.contextPath }/admin/login" id="switch">切换账户</a></li>
							<li><a href="${pageContext.request.contextPath }/admin/logout" id="quit">退出</a></li>
						</ul>
					</li>
					<li id="Hui-skin" class="dropDown right dropDown_hover">
						<a href="javascript:;" class="dropDown_A" title="换肤"><i class="Hui-iconfont" style="font-size:18px">&#xe62a;</i></a>
						<ul class="dropDown-menu menu radius box-shadow">
							<li>
								<a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a>
							</li>
							<li>
								<a href="javascript:;" data-val="blue" title="蓝色">蓝色</a>
							</li>
							<li>
								<a href="javascript:;" data-val="green" title="绿色">绿色</a>
							</li>
							<li>
								<a href="javascript:;" data-val="red" title="红色">红色</a>
							</li>
							<li>
								<a href="javascript:;" data-val="yellow" title="黄色">黄色</a>
							</li>
							<li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
						</ul>
					</li>
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
			<dt><i class="Hui-iconfont">&#xe616;</i> 信息发布管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a href="${pageContext.request.contextPath }/admin/noticeList" title="公告管理" id="noticemng">公告管理</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-picture">
			<dt><i class="Hui-iconfont">&#xe613;</i> 车位管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd style="display:block">
				<ul>
					<li><a href="${pageContext.request.contextPath }/admin/pasrkList" title="车位列表" id="carlist">车位列表</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-product">
			<dt><i class="Hui-iconfont">&#xe620;</i> 订单管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a href="${pageContext.request.contextPath }/admin/ordersList" title="订单列表" id="orderlist">订单列表</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-comments">
			<dt><i class="Hui-iconfont">&#xe622;</i> 积分管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a href="${pageContext.request.contextPath }/admin/scoreList" title="积分排行" id="cpointrank">积分排行</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-member">
			<dt><i class="Hui-iconfont">&#xe60d;</i> 投诉建议管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a href="${pageContext.request.contextPath }/admin/messageList" title="留言列表" id="msglist">留言列表</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-admin">
			<dt><i class="Hui-iconfont">&#xe62d;</i> 系统管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a href="${pageContext.request.contextPath }/admin/adminList" title="管理员列表" id="adminlist">管理员列表</a></li>
					<li><a href="${pageContext.request.contextPath }/admin/userList" title="用户列表" id="userlist">用户列表</a></li>
				</ul>
			</dd>
		</dl>
	</div>
</aside>
<div class="dislpayArrow hidden-xs">
	<a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a>
</div>
<!--/_menu 作为公共模版分离出去-->

<section class="Hui-article-box">
	<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 车位管理 <span class="c-gray en">&gt;</span> 车位列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="Hui-article">
		<article class="cl pd-20">
			<div class="text-c">
				<form class="Huiform" method="post" action="${pageContext.request.contextPath }/park/findParkLikeName" target="_self">
					<input type="text" class="input-text" style="width:250px" placeholder="输入车位编号" name="name" value="${name }">
					<button type="submit" class="btn btn-success"><i class="Hui-iconfont">&#xe665;</i> 搜车位</button>
				</form>
			</div>
			<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="chewei_add('添加车位','${pageContext.request.contextPath }/park/toAddPark','','310')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加车位</a></span> <span class="r">共有数据：<strong id="count">${count }</strong> 条</span> </div>
			<table class="table table-border table-bordered table-bg">
				<thead>
					<tr>
						<th scope="col" colspan="7">车位列表</th>
					</tr>
					<tr class="text-c">
						<th width="50">序号</th>
						<th width="120">车位编号</th>
						<th width="120">车位价格</th>
						<th width="100">车位状态</th>
						<th width="100">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${parkList }" var="park" varStatus="status">
						<tr class="tohidden" id="${park.id }">
							<td>${status.index+1 }</td>
							<td>${park.name}</td>
							<td>${park.price }</td>
							<td>
								<c:if test="${park.status==0}"><span class="label label-success radius">空置</span></c:if>
								<c:if test="${park.status==1}"><span class="label radius">已预约</span></c:if>
							</td>
							<td>
								<a style="text-decoration:none" class="ml-5" onClick="chewei_edit(this,'车次编辑','${pageContext.request.contextPath}/park/park-edit','800','300')" href="javascript:;" title="编辑">
								<i class="Hui-iconfont">&#xe6df;</i></a>
								<a class="ml-5" onclick="deleteById(this)" style="text-decoration:none" title="删除"><i class="Hui-iconfont"></i></a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<script>
			
				/* //模糊查询
				function search(){
					var val=$('#chewei').val();
					var num=0;
					$('.tohidden').css("display","none");
					$.getJSON("${pageContext.request.contextPath}/park/findParkLikeName?name="+val,function(data){
						$.each(data,function(i,item){
							num++;
							$("tbody").append('<tr class="tohidden"><td>'+(i+1)+'</td><td>'+item.name+'</td><td>'+item.price+'</td><td>'+item.status+'</td><td><a href="javascript:void(0)" onclick="editById('+item.id+')">编辑</a>'+'<a href="javascript:void(0)" onclick="deleteById('+item.id+')">删除</a></td></tr>');
						});
					$("#count").html(num);	
					});
				} */
				function chewei_add(title,url,w,h){
					layer_show(title,url,w,h);
				}
				function chewei_edit(obj,title,url,w,h){
					var carId = $(obj).parents("tr").attr("id");
					var urltmp = url+"?id="+carId;
					layer_show(title,urltmp,w,h);
				}
				
				function deleteById(obj){
					layer.confirm('确认要删除吗？',function(index){
						var parkId = $(obj).parents("tr").attr("id");
						$.ajax({
							type: 'POST',
							url: '${pageContext.request.contextPath }/park/deletePark',
							data:{"id":parkId},
							dataType: 'json',
							success: function(data){
								if(data.res==1){
									$(obj).parents("tr").remove();
									layer.msg('已删除!',{icon:1,time:1000});
									location.reload();
								}else{
									layer.msg('操作失败!',{icon: 2,time:1000});
								}
							}
						});		
					});
				}
				
			
			</script>
		</article>
	</div>
</section>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/h-ui.admin/js/H-ui.admin.page.js"></script>
<!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/laypage/1.2/laypage.js"></script>
<%-- <script type="text/javascript">
$('.table-sort').dataTable({
	"aaSorting": [[ 1, "desc" ]],//默认第几个排序
	"bStateSave": true,//状态保存
	"aoColumnDefs": [
		//{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		{"orderable":false,"aTargets":[0,8]}// 不参与排序的列
	]
});

/*资讯-添加*/
function article_add(title,url,w,h){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*资讯-编辑*/
function article_edit(title,url,id,w,h){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*资讯-删除*/
function article_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: '',
			dataType: 'json',
			success: function(data){
				$(obj).parents("tr").remove();
				layer.msg('已删除!',{icon:1,time:1000});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	});
}

/*资讯-审核*/
function article_shenhe(obj,id){
	layer.confirm('审核文章？', {
		btn: ['通过','不通过','取消'], 
		shade: false,
		closeBtn: 0
	},
	function(){
		$(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="article_start(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
		$(obj).remove();
		layer.msg('已发布', {icon:6,time:1000});
	},
	function(){
		$(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="article_shenqing(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-danger radius">未通过</span>');
		$(obj).remove();
    	layer.msg('未通过', {icon:5,time:1000});
	});	
}
/*资讯-下架*/
function article_stop(obj,id){
	layer.confirm('确认要下架吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="article_start(this,id)" href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe603;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已下架</span>');
		$(obj).remove();
		layer.msg('已下架!',{icon: 5,time:1000});
	});
}

/*资讯-发布*/
function article_start(obj,id){
	layer.confirm('确认要发布吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="article_stop(this,id)" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
		$(obj).remove();
		layer.msg('已发布!',{icon: 6,time:1000});
	});
}
/*资讯-申请上线*/
function article_shenqing(obj,id){
	$(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">待审核</span>');
	$(obj).parents("tr").find(".td-manage").html("");
	layer.msg('已提交申请，耐心等待审核!', {icon: 1,time:2000});
}
</script>--%>
<!--/请在上方写此页面业务相关的脚本-->
</body>
<script type="text/javascript">
	$(function(){
		$("#switch").click(function(){
			location.href="  /login"
		})
		$("#quit").click(function(){
			location.href="  /login"
		})
		$("#noticemng").click(function(){
			$.ajax({
				url:"  /chewei-list",
				dataType:"html",
				success:function(){
					location.href=" /gonggao-list"
				}
			})
		})
		$("#carlist").click(function(){
			$.ajax({
				url:"  /chewei-list",
				dataType:"html",
				success:function(){
					location.href=" /chewei-list"
				}
			})
		})
		$("#orderlist").click(function(){
			$.ajax({
				url:"  /chewei-list",
				dataType:"html",
				success:function(){
					location.href=" /dingdan-list"
				}
			})
		})
		$("#cpointrank").click(function(){
			$.ajax({
				url:"  /chewei-list",
				dataType:"html",
				success:function(){
					location.href=" /jifen-list"
				}
			})
		})
		$("#msglist").click(function(){
			$.ajax({
				url:"  /chewei-list",
				dataType:"html",
				success:function(){
					location.href=" /liuyan-list"
				}
			})
		})
		$("#adminlist").click(function(){
			$.ajax({
				url:"  /chewei-list",
				dataType:"html",
				success:function(){
					location.href=" /admin-list"
				}
			})
		})
		$("#userlist").click(function(){
			$.ajax({
				url:"  /chewei-list",
				dataType:"html",
				success:function(){
					location.href=" /user-list"
				}
			})
		})
	})
</script>
</html>