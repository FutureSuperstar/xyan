<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="content">
	<div class="bloglist">
		<c:if test="${empty page.result}">
			<ul class="text-center">暂无匹配资源</ul>
		</c:if>
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
					<img src="${item.imgUrl}" alt="资源正在加载">
				</figure>
				<p class="dateview">
					<span>
						<fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd"/>
					</span>
					<span>作者：${item.userName}</span>
					<span>分类：<a href="${path}" target="_blank">${item.typeName}</a></span>
					<span>阅读(${item.readCount})</span>
					<span>评论(${item.commentCount})</span>
				</p>
			</ul>
		</c:forEach>
	</div>
</div>
