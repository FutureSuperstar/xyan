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
<script type="text/javascript">
$("#preview").onload=function(){
	var height=$(window).height();
	var width=$(window).width();
	var h=$("#showImg").height();
	var w=$("#showImg").width();
	$("#showImg").css({"left":(width-w)/2,top:(height-h)/2});
};
	function upload(){
		var formData = new FormData();
		formData.append('file', $('#toSelect')[0].files[0]);
		$.ajax({
		    url: '${path}/index/wangEditor/upload',
		    type: 'POST',
		    cache: false,
		    data: formData,
		    processData: false,
		    contentType: false,
		    success:function(data){
		    	$("#imgUrl").val(data);
		    	$.closeDialog("showImg");
		    },
		    error:function(){
		    	console.log("error");
		    }
		});
	}
	function selectFile(){
		$("#toSelect").trigger("click");
		$("#toSelect").change(function(e){
			change();
		});
	}
	
	function change() {
    var pic = document.getElementById("preview"),
        file = document.getElementById("toSelect");
 
    var ext=file.value.substring(file.value.lastIndexOf(".")+1).toLowerCase();
 
     // gif在IE浏览器暂时无法显示
     if(ext!='png'&&ext!='jpg'&&ext!='jpeg'){
         alert("图片的格式必须为png或者jpg或者jpeg格式！"); 
         return;
     }
     var isIE = navigator.userAgent.match(/MSIE/)!= null,
         isIE6 = navigator.userAgent.match(/MSIE 6.0/)!= null;
 
     if(isIE) {
        file.select();
        var reallocalpath = document.selection.createRange().text;
 
        // IE6浏览器设置img的src为本地路径可以直接显示图片
         if (isIE6) {
            pic.src = reallocalpath;
         }else {
            // 非IE6版本的IE由于安全问题直接设置img的src无法显示本地图片，但是可以通过滤镜来实现
             pic.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='image',src=\"" + reallocalpath + "\")";
             // 设置img的src为base64编码的透明图片 取消显示浏览器默认图片
             pic.src = 'data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==';
         }
     }else {
        html5Reader(file);
     }
}
 
 function html5Reader(file){
     var file = file.files[0];
     var reader = new FileReader();
     reader.readAsDataURL(file);
     reader.onload = function(e){
         var pic = document.getElementById("preview");
         pic.src=this.result;
        var height=$(window).height();
		var width=$(window).width();
		var h=$("#showImg").height();
		var w=$("#showImg").width();
		$("#showImg").css({"left":(width-w)/2,top:(height-h)/2});
     }
 }
</script>