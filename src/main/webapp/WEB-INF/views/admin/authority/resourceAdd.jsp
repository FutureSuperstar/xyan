<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<form class="form-horizontal" id="resourceForm" action="#">
	<input type="hidden" name="pId" value="${model.pId}"/>
	<input type="hidden" name="level" value="${model.level}"/>
	<table id="dataTable" class="table table-bordered">
		<tr>
			<td class="text-right">父级资源：</td>
			<td><input type="text" value="" readonly="readonly" value="parentName"/></td>
			<td class="text-right">资源:</td>
			<td><input type="text" name="resourceName" value="${model.resourceName}"/></td>
		</tr> 
		<tr>
			<td class="text-right">是否可用：</td>
			<td><input type="text" value=""/></td>
			<td class="text-right">资源类别：</td>
			<td><input type="text" name="resourceType" value="${model.resourceType}" /></td>
		</tr> 
		<tr>
			<td class="text-right">图标：</td>
			<td><input type="text" name="icon" value="${model.icon}"/></td>
			<td class="text-right">后面图标：</td>
			<td><input type="text" name="iconBack" value="${model.iconBack}"/></td>
		</tr> 
		<tr>
			<td class="text-right">权限：</td>
			<td colspan="3"><input type="text" name="permission" value="${model.permission}"/></td>
		</tr> 
		<tr>
			<td class="text-right">地址：</td>
			<td colspan="3"><input type="text" name="url" class="col-lg-10" value="${model.url}"/></td>
		</tr> 
	</table>
	<div class="form-group">
	    <div class="col-sm-offset-6 col-sm-10">
	      	<button type="button" onclick="saveResource()" class="btn btn-default">保存</button>
	    </div>
  	</div>
</form>
<script type="text/javascript">
function saveResource(){
	$.ajax({
		url:"${path}/admin/authority/resource/save",
		data:$("#resourceForm").serialize(),
		type:"POST",
		success:function(data){
			if(data.success){
				//$.closeDialog("resourceAdd");
				location.reload();
			}else{
				$.cxDialog({
				  	info: '保存失败！'
				});
			}
		},
		error:function(){
		
		}
	});
}
</script>