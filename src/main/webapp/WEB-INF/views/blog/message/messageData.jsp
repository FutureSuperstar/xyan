<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:forEach items="${page.result}" var="data">
	<tr class="odd">
	</tr>
</c:forEach>
<tr id="pageInfo" data-pages="${page.pages}" data-pagenum="${page.pageNum}">
</tr>

