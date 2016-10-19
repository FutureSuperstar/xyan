<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>${model.title}</title>
<link rel="stylesheet" type="text/css" href="${path}/static/plugin/wangEditor-2.1.12/css/wangEditor.min.css">
<div class="content">
	<div class="page-header">
		<h3 class="text-center">${model.title}</h3>
	</div>
	<div class="row">
		<p class="dateview">
			<span>
				<fmt:formatDate value="${model.updateTime}" pattern="yyyy-MM-dd"/>
			</span>
			<span>作者：xyan</span>
			<span>分类：<a target="_blank" href="${path}/blog/type">心灵记录</a></span>
			<span>阅读(${model.readCount})</span>
			<span>评论(${model.commentCount})</span>
		</p>
		<br>
	</div>
	<div>
		${model.produce1}
	</div>
	<c:if test="${not empty model.imgUrl}">
		<div>
			<img src="${model.imgUrl}">
		</div>
	</c:if>
	<div>
		${model.produce2}
	</div>
	<div>
		${model.content }
	</div>
	<div class="row">
		<div style="border: 2px dashed #ccc;margin-top: 20px;">评论区：</div>
	</div>
	<div class="row">
		<c:forEach items="${discussList}" var="data">
			<div class="mbox" style="width:768px;">
				<div class="mbox-left" style="float: left;width:14%" >
					<img src="${data.sourceHead}" class="user-head"/>
				</div>
				<div class="mbox-right" style="float: left;width:83%">
					<div class="mbox-head">时间：<fmt:formatDate value="${data.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
					<div class="mbox-text">${data.content}</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</c:forEach>
	</div>
	<div class="mar15">
		<div class="col-xs-12">
			<div class="col-xs-12">
				<form id="messageForm" method="POST">
					<button class="btn" type="button" onclick="sendMess()">发表</button>
					<input type="hidden" name="source" value="1"/>
					<input type="hidden" name="dest" value="${model.id}"/>
					<input type="hidden" name="title" value="【评论】${model.title}"/>
					<div class="col-xs-12">
						<textarea name="content" id="content" class="sol-xs-12 mar-left-5" style="height:400px; max-height:600px;">${model.content}</textarea>		
					</div>
				</form>
			</div>
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
});
function sendMess(){
	var html = editor.$txt.html();
	var div=$("<div class='exception_bottom' id='exception'>内容长度不符</div>");
	if(html.length>555){
		div.prependTo("body").fadeOut(2000);
		return ;
	}else if(html.length<5){
		div.prependTo("body").fadeOut(2000);
		return ;
	}
	$.ajax({
		url:path+"/blog/board/saveMess",
		type:"POST",
		data:$("#messageForm").serialize(),
		success:function(data){
			if(data.success){
				$(".wangEditor-container .wangEditor-txt").html("");
				location.reload();
			}else if(!!data.message){
				$("<div class='exception_bottom' id='exception'>"+data.message+"</div>").appendTo("body").fadeOut(2000);
			}else{
				$("<div class='exception_bottom' id='exception'>访问速度太快，请稍后！</div>").appendTo("body").fadeOut(2000);
			}
		}
	});
}
</script>