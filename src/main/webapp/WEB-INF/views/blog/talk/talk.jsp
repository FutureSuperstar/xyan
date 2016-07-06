<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<title>闲言碎语</title>
<div class="content container">
	<div class="mar15">
		<c:forEach items="${statementList}" var="item">
			<div class="box">
				<div class="box-header">
					<small>发表于：<fmt:formatDate value="${item.createTime}" pattern="yyyy年M月d日"/></small>
					${item.title}
				</div>
				<div class="box-body">${item.content}</div>
			</div>
		</c:forEach>
	</div>
</div>