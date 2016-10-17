<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:forEach items="${cache}" var="data">
	<tr class="odd">
		<td class="text-center" style="width: 7%;">${data.value.name}</td> 
		<td class="text-center" style="width: 7%;">${data.value.kind}</td> 
		<td class="text-center" style="width: 7%;" >${data.value.value}</td> 
		<td class="text-center" style="width: 7%;" >${data.value.remark}</td> 
		<td class="text-center"> 
			<button class="btn" style="line-height: 1" onclick="config('${data.value.name}','${data.value.kind}','${data.value.value}')"><i class="icon-edit"></i>config</button>
		</td> 
	</tr>
</c:forEach>
<tr id="pageInfo" data-pages="1" data-pagenum="1">
</tr>

