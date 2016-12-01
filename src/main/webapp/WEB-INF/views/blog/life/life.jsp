<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>慢生活</title>
<div class="content">
	<div class="bloglist">
		<c:forEach items="${page.result}" var="item">
			<ul>
				<h2>
					<a title="${item.title}" href="${path}/blog/article/view/${item.id}" target="_blank">${item.title}</a>
				</h2>
				<c:if test="${not empty item.produce1}">
					<p class="datap">${item.produce1}</p>
				</c:if>
				<c:if test="${not empty item.produce2}">
					<p class="datap">${item.produce2}</p>
				</c:if>
				<figure>
					<img src="${item.imgUrl}">
				</figure>
				<p class="dateview">
					<span>
						<fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd"/>
					</span>
					<span>作者：${item.userName}</span>
					<span>分类：<a href="${path}/blog/type/${item.typeId}" target="_blank">${item.typeName}</a></span>
					<span>阅读(${item.readCount})</span>
					<span>评论(${item.commentCount})</span>
				</p>
			</ul>
		</c:forEach>
	</div>
	<div class="pageInfo">
		<span class="down" id="pagedown">下一页</span>
		<span class="up" id="pageup">上一页</span>
	</div>
</div>
<style type="text/css">
	.pageInfo{margin-top: 15px;margin-right: 20px;height: 24px;}
	.pageInfo span{display:inline-block;float: right;cursor: pointer;line-height: 2.2;border: 1px solid #eee;height: 24px;background-color: rgb(213,213,213);}	
	.pageInfo .down{border-top-right-radius:3px; border-bottom-right-radius:3px; }
	.pageInfo .up{border-top-left-radius:3px; border-bottom-left-radius:3px }
</style>
<form action="" id="pageForm">
	<input name="pageNum" type="hidden" value="${page.pageNum}" id="pageNum"/>
	<input name="pages"  type="hidden" value="${page.pages}" id="pages"/>
</form>
<script type="text/javascript">
	$(".pageInfo span").click(function(){
		var pagenum=parseInt($("#pageNum").val());
		if(this.id=='pagedown'){
			var pages=parseInt($("#pages").val());
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
		$("#pageNum").val(pagenum);
		$("#pageForm").submit();
	});
</script>