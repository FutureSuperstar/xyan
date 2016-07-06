<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<title>这个.. 服务器开小差了！！！_SJ5D.COM</title>

<style type="text/css">
body {
	margin: 0;
	padding: 0;
	background: #efefef;
	font-family: Georgia, Times, Verdana, Geneva, Arial, Helvetica,
		sans-serif;
}
div#mother {
	margin: 0 auto;
	width: 943px;
	height: 572px;
	position: relative;
	background:#f3f3f3;
	border: 1px solid #e8e8e8;
	border-radius: 40px;
    box-shadow: 1px 3px 10px 10px #e5e5e5;
}

div#errorBox {
	width: 943px;
	height: 572px;
	margin: auto;
}

div#errorText {
	color: #39351e;
	padding: 146px 0 0 446px
}

div#errorText p {
	width: 303px;
	font-size: 14px;
	line-height: 26px;
}
h1 {font-size: 40px;margin-bottom: 35px;}
</style>

<div id="mother">
	<div id="errorBox">
		<div id="errorText">
			<h1>Sorry..服务器开小差了！</h1>
			<p>似乎你所寻找的网页已故障了。
			<p>或者也许你只是键入错误了一些东西。</p>
			请不要担心，这没事。如果这对你很重要，请与管理员联系。
			</p>
			<p>火星不太安全，我可以免费送你回地球</p>
			<a href="${path}" title="返回首页">返回首页</a> 
			<a href="${path}/contactUs" title="联系管理员">联系管理员</a>
		</div>
	</div>
</div>