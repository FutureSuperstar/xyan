<%-- 头部 --%>
<%@ page contentType="text/html;charset=UTF-8"%>
<header>
	<h1>
		<a href="${path}">花气袭人是酒香</a>
	</h1>
	<p>这夏天里流动的风情，是停不住的舞步和唱不完的情歌，当玫瑰花瓣飘飞的那一刻，风会带走所有的想念.......</p>
</header>
<div class="navswf">
	<object id="customMenu" width="528" height="70"
		type="application/x-shockwave-flash">
		<param name="allowScriptAccess" value="always">
		<param name="allownetworking" value="all">
		<param name="allowFullScreen" value="true">
		<param name="wmode" value="transparent">
		<param name="menu" value="false">
		<param name="scale" value="noScale">
		<param name="salign" value="1">
	</object>
	<div id="nav">
		<ul>
			<li><a href="${path}">网站首页</a></li>
			<li><a href="${path}/blog/life"  title="慢生活">慢生活</a></li>
			<li><a href="${path}/blog/article"  title="技术探讨">技术探讨</a></li>
			<li><a href="${path}/blog/talk" title="碎言碎语">碎言碎语</a></li>
			<li><a href="${path}/blog/board" title="留言版">留言版</a></li>
		</ul>
		<script src="${path}/static/js/silder.js"></script>
		<!--获取当前页导航 高亮显示标题-->
	</div>
</div>
<div class="blank"></div>