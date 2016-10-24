<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><sitemesh:title default="自定义插件"/></title>
<style type="text/css">
html,body,div,ul,li,dl,dt,dd,ol,section{margin: 0px;padding: 0;}
ul{list-style: none;margin-left: 15px;}
.leftMenu{
	position: fixed;
	left:0;
	top:0;
	width: 160px;
	height:100%;
	background-color: #666;
	color: #fff;
	border-right: 2px solid #e5e5e5;
}
.leftMenu a{text-decoration: none;color: #fff;}
.rightContent{margin:0 0 0 160px;}
.hide{display: none;}
</style>
</head>
<body>
	<div class="leftMenu">
		<ul>
			<li>
				<a href="#" class="dropdown-toggle"><span class="menu-text">图片</span></a>
				<ul class="submenu hide">
					<li><a href="${path}/plug/img/lunbo">轮播</a></li>
					<li><a href="${path}/plug/img/lunbo">相册</a></li>
				</ul>
			</li>
		</ul>
	</div>
	<div class="rightContent">
		<sitemesh:body/>
	</div>
	<script type="text/javascript" src="${path}/static/js/jquery/jquery-1.10.1.js"></script>
	<script id="menu" type="text/javascript">
		$(".leftMenu .dropdown-toggle").click(function(){
			$(this).next("ul").slideToggle("slow");
		});
	</script>
</body>
</html>