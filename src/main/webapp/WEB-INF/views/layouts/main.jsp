<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="sitemesh"%>

<!doctype html>
<html>
<head>
<title><sitemesh:title default="花气袭人是酒香"/></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1.0" />
<meta name="Keywords" content="">
<meta name="Description" content="">
 <%@ include file="/WEB-INF/views/layouts/static.jsp"%>
 <sitemesh:head></sitemesh:head>
</head>
<body>
<%@ include file="/WEB-INF/views/layouts/header.jsp"%>
<article>
	<div id="sitemeshBody" style="float: left;width:750px">
		<sitemesh:body></sitemesh:body>
	</div>
	<aside class="navsidebar">
		<h2>
			<p>个人档案</p>
		</h2>
		<div class="vcard">
			<p class="fn">姓名：王明</p>
			<p class="nickname">网名：xyan | 淡泊</p>
			<p class="url">
				主页：<a href="${xyan}">www.xyan.com</a>
			</p>
			<p>邮箱：w18855525068@163.com</p>
			<p>QQ：1255321142</p>
			<p class="address">现居：上海市—浦东新区</p>
			<p class="role">职业：网站设计、网站制作</p>
		</div>
		<h2>
			<p>博客分类</p>
		</h2>
		<ul class="news">
			<li><a href="${path}">慢生活(3)</a></li>
			<li><a href="${path}">程序人生(25)</a></li>
			<li><a href="${path}">经典美文(39)</a></li>
		</ul>
		<h2>
			<p>近期文章</p>
		</h2>
		<ul class="news">
			<li><a href="${path}">女孩都有浪漫的小情怀</a></li>
			<li><a href="${path}">也许下个路口就会遇见希望</a></li>
			<li><a href="${path}">6月毕业季，祝福送给你</a></li>
			<li><a href="${path}">生活常有缺席的-可搞笑从来不缺席</a></li>
			<li><a href="${path}">为了一个不存在的梦，执念了那么多年</a></li>
			<li><a href="${path}">妹妹，明天你就要嫁人啦</a></li>
		</ul>
		<h2>
			<p>文章归档</p>
		</h2>
		<ul class="news">
			<li><a href="${path}">2008 年三月</a></li>
			<li><a href="${path}">2008 年四月</a></li>
			<li><a href="${path}">2008 年六月</a></li>
		</ul>
		<h2>
			<p>友情链接</p>
		</h2>
		<ul class="news">
			<li><a href="${path}">淡泊个人博客</a></li>
		</ul>
	</aside>
</article>

<p id="back-to-top"><a href="#top"><span class="iconfont">&#xe62b;</span>返回顶部</a></p>  
<script type="text/javascript">
//当滚动条的位置处于距顶部100像素以下时，跳转链接出现，否则消失  
$(function () {  
    $(window).scroll(function(){  
        if ($(window).scrollTop()>100){  
            $("#back-to-top").fadeIn(1500);  
        }  
        else  
        {  
            $("#back-to-top").fadeOut(1500);  
        }  
    });  

    //当点击跳转链接后，回到页面顶部位置  
    $("#back-to-top").click(function(){  
        $('body,html').animate({scrollTop:0},1000);  
        return false;  
    });  
});  
</script>
</body>
</html>