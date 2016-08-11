<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css" href="${path}/static/plugin/wangEditor-2.1.12/css/wangEditor.min.css">
<div class="content">
	<div class="mar15">
		<div class="col-xs-12">
			<div class="col-xs-12">
				<form id="messageForm">
					<button class="btn" onclick="sendMess()">发表</button>
					<input type="checkbox" name="merge"/>
					<small style="font-size: 10px;color:#555;">勾选表示紧急留言，博主就会收到紧急邮件啦</small>
					<div class="col-xs-12">
						<textarea name="content" id="content" class="sol-xs-12 mar-left-5" style="height:400px; max-height:600px;">${model.content}</textarea>		
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="mar15">
		<div class="mbox" style="width:768px;">
			<div class="mbox-left" style="float: left;width:14%" >
				<img src="${path}/static/img/head/girl-1.jpg" class="user-head"/>
			</div>
			<div class="mbox-right" style="float: left;width:83%">
				<div class="mbox-text">博主，您做这个网站花了多长时间？我也想做，你能教我吗？</div>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="mbox" style="width:768px;">
			<div class="mbox-left" style="float: left;width:14%" >
				<img src="${path}/static/img/head/girl-2.jpg" class="user-head"/>
			</div>
			<div class="mbox-right" style="float: left;width:83%">
				<div class="mbox-text">做的不错，赞一个。哈哈！</div>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="mbox" style="width:768px;">
			<div class="mbox-left" style="float: left;width:14%" >
				<img src="${path}/static/img/head/girl-3.jpg" class="user-head"/>
			</div>
			<div class="mbox-right" style="float: left;width:83%">
				<div class="mbox-text">您好，我有一个技术问题，可以私下请教一下么？</div>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="mbox" style="width:768px;">
			<div class="mbox-left" style="float: left;width:14%" >
				<img src="${path}/static/img/head/girl-4.jpg" class="user-head"/>
			</div>
			<div class="mbox-right" style="float: left;width:83%">
				<div class="mbox-text">博主，您的留言板用的什么编辑器啊？</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
</div>
<script type="text/javascript" src="${path}/static/plugin/wangEditor-2.1.12/js/wangEditor.js"></script>
<script type="text/javascript">
var editor =null;
$(function(){
	//初始化编辑器
	editor=new wangEditor('content');
	editor.config.uploadImgUrl = '${path}/index/wangEditor/upload';
	editor.create();
	$(".wangEditor-container .menu-group").removeClass("clearfix");
	$(".wangEditor-container .menu-group div").removeClass("clearfix");
	$(".wangEditor-container .wangEditor-txt").height(248);
});
</script>
<script type="text/javascript" src="${path}/static/js/page/message.js"></script>