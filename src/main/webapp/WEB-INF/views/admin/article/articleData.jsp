<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:forEach items="${page.result}" var="data">
	<tr class="odd">
		<td class="text-left" style="width: 7%;">${data.title}</td> 
		<td class="text-center" style="width: 7%;">${data.typeId}</td> 
		<td class="text-center getDictValue" style="width: 7%;" >${data.userId}</td> 
		<td class="text-center"> 
			<a href="${path}/admin/article/edit?id=${data.id}" class="table-panle" title="修改">编辑</a>
			<a href="${path}/blog/article/view/${data.id}" target="_blank" class="table-panle" title="拒绝 ">查看</a>
		</td> 
	</tr>
</c:forEach>
<tr id="pageInfo" data-pages="${page.pages}" data-pagenum="${page.pageNum}">
</tr>

