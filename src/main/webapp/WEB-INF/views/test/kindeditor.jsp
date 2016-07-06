<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>KindEditor测试</title>
<link rel="stylesheet" href="${path}/static/kindeditor/themes/default/default.css" />
<link rel="stylesheet" href="${path}/static/kindeditor/plugins/code/prettify.css" />
<script charset="utf-8" src="${path}/static/kindeditor/kindeditor-all-min.js"></script>
<script charset="utf-8" src="${path}/static/kindeditor/lang/zh-CN.js"></script>
<script charset="utf-8" src="${path}/static/kindeditor/plugins/code/prettify.js"></script>
<textarea name="content1" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;">测试内容！测试内容！测试内容！测试内容！</textarea>
<script>
	KindEditor.ready(function(K) {
		var editor1 = K.create('textarea[name="content1"]', {
			cssPath : '${path}/static/kindeditor/plugins/code/prettify.css',
			uploadJson : '${path}/editor/upload',
			fileManagerJson : '${path}/editor/fileManager',
			items : [  
	            'source', '|', 'fullscreen', 'undo', 'redo', 'print', 'cut', 'copy', 'paste',  
	            'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',  
	            'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',  
	            'superscript', '|', 'selectall', '-',  
	            'title', 'fontname', 'fontsize', '|', 'textcolor', 'bgcolor', 'bold',  
	            'italic', 'underline', 'strikethrough', 'removeformat', '|', 'image',  
	            'advtable', 'hr', 'emoticons', 'link', 'unlink', '|', 'about'  
	        ],  
			allowFileManager : true
		});
		prettyPrint();
	});
</script>