<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style type="text/css">
	.pageInfo{margin-top: 15px;height: 24px;}
	.pageInfo span{display:inline-block;float: right;cursor: pointer;line-height: 2.2;border: 1px solid #eee;height: 24px;}	
	.pageInfo .down{border-top-right-radius:3px; border-bottom-right-radius:3px; }
	.pageInfo .up{border-top-left-radius:3px; border-bottom-left-radius:3px }
</style>
<c:forEach items="${page.result}" var="data">
	<div class="mbox" style="width:768px;">
		<div class="mbox-left" style="float: left;width:14%" >
			<img src="${data.sourceHead}" class="user-head"/>
		</div>
		<div class="mbox-right" style="float: left;width:83%">
			<div class="mbox-text">${data.content}</div>
		</div>
		<div class="clearfix"></div>
	</div>
</c:forEach>
<div id="pageInfo" data-pages="${page.pages}" data-pagenum="${page.pageNum}"></div>
<div class="pageInfo">
	<span class="down" id="pagedown">下一页</span>
	<span class="up" id="pageup">上一页</span>
</div>
<div class="clearfix"></div>
<script type="text/javascript">
	$(".pageInfo span").click(function(){
		var pagenum=parseInt($("#pageInfo").data("pagenum"));
		if(this.id=='pagedown'){
			var pages=parseInt($("#pageInfo").data("pages"));
			if(pagenum>=pages){
				return ;
			}else{
				pagenum+=1;
			}
		}else{
			if(pagenum<=1){
				return ;
			}
			pagenum-=1;
		}
		$.ajax({
			url:path+"/blog/board/pageData?pageNum="+pagenum+"&pageSize=10",
			success:function(data){
				$("#messageData").empty().append(data);
			}
		});
	});
</script>
