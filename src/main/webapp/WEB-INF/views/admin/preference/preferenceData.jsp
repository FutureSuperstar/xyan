<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:forEach items="${page.result}" var="data">
	<tr class="odd">
		<td class="text-center" style="width: 7%;">${data.name}</td> 
		<td class="text-center" style="width: 7%;">${data.kind}</td> 
		<td class="text-center" style="width: 7%;" >${data.value}</td> 
		<td class="text-center" style="width: 7%;" >${data.remark}</td> 
		<td class="text-center"> 
			<button class="btn" style="line-height: 1" onclick="config('${data.name}','${data.kind}','${data.value}')"><i class="icon-edit"></i>config</button>
		</td> 
	</tr>
</c:forEach>
<tr id="pageInfo" data-pages="${page.pages}" data-pagenum="${page.pageNum}">
</tr>

