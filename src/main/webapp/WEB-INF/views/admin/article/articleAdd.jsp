<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--引入wangEditor.css-->
<link rel="stylesheet" type="text/css" href="${staticUrl}/static/plugin/wangEditor-2.1.12/css/wangEditor.min.css">
<title>完善文章信息</title>
<div class="breadcrumbs" id="breadcrumbs">
	<script type="text/javascript">
		try {
			ace.settings.check('breadcrumbs', 'fixed')
		} catch (e) {
		}
	</script>
	<ul class="breadcrumb">
		<li><i class="icon-home home-icon"></i> <a
			href="${path}/admin/index">首页</a></li>
		<li><a href="${path}/admin/article">文章管理</a></li>
		<li class="active">新增文章</li>
	</ul>
	<div class="nav-search" id="nav-search">
		<form class="form-search">
			<span class="input-icon"> 
				<input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" /> <i class="icon-search nav-search-icon"></i>
			</span>
		</form>
	</div>
	<!-- #nav-search -->
</div>
<div class="page-content">
	<div class="mar15">
		<!--表格-->
		<div class="widget-header relative bor-bottom">
			<h5>完善文章信息</h5>
		</div>
		<div class="table-responsive">
			<form id="dataForm" action="${path}/admin/article/save" method="POST">
				<input type="hidden" value="${model.id}" name="id">
				<table class="table table-bordered align-center font12 mar-bottom-0 dataTable">
					<tbody>
						<tr>
							<td style="width: 12%" class="text-right bold">文章标题：</td>
							<td style="width: 21%" class="text-left pad-right-0">
								<div class="sol-xs-12 form_date">
									<input type="text" value="${model.title}" id="title" name="title"  class="sol-xs-11">
								</div>
							</td>
							<td style="width: 12%" class="text-right bold">类别：</td>
							<td style="width: 21%" class="text-left pad-right-0">
								<div class="sol-xs-12 form_date">
									<input type="hidden" value="${model.typeId}" id="typeId" name="typeId">
									<input type="text" value="${typeName}" id="typeName" name="typeName" class="sol-xs-11">
								</div>
							</td>
							<td style="width: 12%" class="text-right bold">标签：</td>
							<td style="width: 21%" class="text-left pad-right-0">
								<div class="sol-xs-11">
									<input type="text" value="${model.keyWord}" id="keyWord" name="keyWord" placeholder="多个标签用,隔开" class="sol-xs-12">
								</div>
							</td>
						</tr>
						<tr>
							<td style="width: 12%" class="text-right bold">图片：</td>
							<td style="width: 21%" colspan="5" class="text-left pad-right-0">
								<div class="sol-xs-12 form_date">
									<input type="text" value="${model.imgUrl}" name="imgUrl"  id="imgUrl" class="sol-xs-3">
									<a class="btn btn-green mar-left-15" style="line-height: 0.7;" onclick="show()" href="javascript:;">预览</a> 
								</div>
							</td>
						</tr>
						<tr>
							<td style="width: 12%" class="text-right bold">介绍一：</td>
							<td style="width: 21%" colspan="5" class="text-left pad-right-0">
								<div class="sol-xs-12 form_date">
									<input type="text" value="${model.produce1}" name="produce1"  id="produce1" class="sol-xs-11">
								</div>
							</td>
						</tr>
						<tr>
							<td style="width: 12%" class="text-right bold">介绍二：</td>
							<td style="width: 21%" colspan="5" class="text-left pad-right-0">
								<div class="sol-xs-12 form_date">
									<input type="text" value="${model.produce2}" name="produce2"  id="produce2" class="sol-xs-11">
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="6" style="width: 21%" class="text-left pad-right-0">
								<div class="sol-xs-11" style="margin-left:45px;">
									 <textarea name="content" id="content" class="sol-xs-12 mar-left-5" style="height: 200px">${model.content}</textarea>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
			<div class="text-center">
				<a class="btn btn-green mar15" onclick="saveInfo()" href="javascript:;">提交</a> 
				<a class="btn btn-grey mar15" href="${path}/admin/article">返回</a>
			</div>
			<!--page-content-->
		</div>
	</div>
	<div class="clear"></div>
</div>


<!--引入jquery和wangEditor.js-->  
<!--注意：javascript必须放在body最后，否则可能会出现问题-->
<script type="text/javascript" src="${staticUrl}/static/plugin/wangEditor-2.1.12/js/wangEditor.js"></script>
<script type="text/javascript">
var editor =null;
$(function(){
	//初始化编辑器
	editor=new wangEditor('content');
	editor.config.uploadImgUrl = '${path}/attach/wangEditor/upload';
	editor.create();
	//种类
	$("#typeName").on("click",function(){
		$.dialogCenter({
			id:"articleType",
			bg:true,
			url:"${path}/admin/article/dialog/open",
			title:"文章类别"
		});
	});
});

function saveInfo(){
	$("#dataForm").submit();
}

function show(){
	$.dialogCenter({
		id:"showImg",
		bg:true,
		methodType:"POST",
		data:{"url":$("#imgUrl").val()},
		url:"${path}/admin/article/dialog/img",
		title:"文章图片预览"
	});		
}
</script>
<script type="text/javascript" src="${staticUrl}/static/js/dialog.js"></script>