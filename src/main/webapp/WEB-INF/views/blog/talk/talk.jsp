<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<title>闲言碎语</title>
<div class="content">
	<div class="bloglist">
		<c:forEach items="${page.result}" var="item">
			<ul>
				<h2>
					<a title="${item.title}" href="${path}/blog/article/view/${item.id}" target="_blank">${item.title}</a>
				</h2>
				<p>${item.produce1}</p>
				<p>${item.produce2}</p>
				<figure>
					<img src="${item.imgUrl}">
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