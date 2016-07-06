<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css" href="${path}/static/plugin/wangEditor-2.1.12/css/wangEditor.min.css">
<div class="content">
	<div class="mar15">
		<div class="col-xs-12">
			<textarea name="content" id="content" class="sol-xs-12 mar-left-5" style="height: 200px">${model.content}</textarea>		
		</div>
	</div>
	<div class="mar15">
		<div class="box">
			<div class="box-header">
				博主你好：
			</div>
			<div class="box-body">
				<div class="">我有一个问题请教wqeeeeeeee十多个是代理公司的怪兽电力公司的个好老师的更合适的两个函数的两个还是领导尽快赶回是德国华盛顿国会山来的后果 时都会感受到了规划落实贷款eeee,qweqw qwe qwhhsgdjghsdkgh slhdglk shd g hsdklgsdag你</div>
			</div>
		</div>
		<div class="box">
			<div class="box-header">
				博主你好：
			</div>
			<div class="box-body">
				<div class="">我有一个问题请教你</div>
			</div>
		</div>
		<div class="box">
			<div class="box-header">
				博主你好：
			</div>
			<div class="box-body">
				<div class="">我有11111111111111111111111111111111111111111111111111111111111111111</div>
			</div>
		</div>
		<div class="box">
			<div class="box-header">
				博主你好：
			</div>
			<div class="box-body">
				<div class="">xxxxxxxxxxxxxxxxxx</div>
			</div>
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
});
</script>