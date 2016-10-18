<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css" href="${path}/static/plugin/wangEditor-2.1.12/css/wangEditor.min.css">
<div class="content">
	<div class="mar15">
		<div class="col-xs-12">
			<div class="col-xs-12">
				<form id="messageForm" method="POST">
					<button class="btn" type="button" onclick="sendMess()">发表</button>
					<input type="checkbox" name="merge" value="true"/>
					<input type="hidden" name="source" value="1"/>
					<input type="hidden" name="dest" value="-1"/>
					<input type="hidden" name="title" value="测试留言"/>
					<small style="font-size: 10px;color:#555;">勾选表示紧急留言，博主就会收到紧急邮件啦</small>
					<div class="col-xs-12">
						<textarea name="content" id="content" class="sol-xs-12 mar-left-5" style="height:400px; max-height:600px;">${model.content}</textarea>		
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="mar15" id="messageData">
		<div class="mbox" style="width:768px;">
			<div class="mbox-left" style="float: left;width:14%" >
				<img src="${path}/static/img/head/girl-1.jpg" class="user-head"/>
			</div>
			<div class="mbox-right" style="float: left;width:83%">
				<div class="mbox-text">博主，您做这个网站花了多长时间？我也想做，你能教我吗？</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
</div>
<script type="text/javascript" src="${path}/static/plugin/wangEditor-2.1.12/js/wangEditor.js"></script>
<script type="text/javascript">
var editor =null;
$(function(){
	
	$("#messageForm textarea").text("");
	//初始化编辑器
	editor=new wangEditor('content');
	editor.config.uploadImgUrl = '${path}/index/wangEditor/upload';
	editor.create();
	$(".wangEditor-container .menu-group").removeClass("clearfix");
	$(".wangEditor-container .menu-group div").removeClass("clearfix");
	$(".wangEditor-container .wangEditor-txt").height(248);
	$.ajax({
		url:path+"/blog/board/pageData?pageNum=1&pageSize=10",
		success:function(data){
			$("#messageData").empty().append(data);
		}
	});
});

function sendMess(){
	var html = editor.$txt.html();
	var div=$("<div class='exception' id='exception'>内容长度不符</div>");
	if(html.length>555){
		div.prependTo("body").fadeOut(2000);
		return ;
	}else if(html.length<5){
		div.prependTo("body").fadeOut(2000);
		return ;
	}
	$.ajax({
		url:"",
		type:"POST",
		data:$("#messageForm").serialize(),
		success:function(data){
			if(data.success){
				$(".wangEditor-container .wangEditor-txt").html("");
				location.reload();
			}else{
				$("<div class='exception' id='exception'>"+data.message+"</div>").prependTo("body").fadeOut(2000);
			}
		}
	});
}
</script>