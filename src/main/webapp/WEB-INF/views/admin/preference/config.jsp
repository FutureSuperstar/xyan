<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="mar15">
	<img src="${url}" id="preview"/>
</div>
<div class="mar15">
	<form id="imgForm" action="${path}/index/wangEditor/upload"  target="_self"	enctype="multipart/form-data">
		<div class="row mar5">
			<input type="file" id="toSelect" style="display: none" /> 
			<label class="btn upload-btn" onclick="selectFile();" style="top:-18px">选择图片</label>
		</div>
		<div class="row mar5">
			<a class="btn btn-green" onclick="upload()" href="javascript:;">上传</a>
		</div>
	</form>
</div>
