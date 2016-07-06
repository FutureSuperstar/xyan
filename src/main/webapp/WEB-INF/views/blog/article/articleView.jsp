<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>${model.title}</title>
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
</div>