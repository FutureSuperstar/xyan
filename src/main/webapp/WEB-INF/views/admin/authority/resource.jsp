<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>资源管理</title>
<link href="${staticUrl}/static/zTree/css/demo.css" rel="stylesheet">
<link href="${staticUrl}/static/zTree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet">
<script src="${staticUrl}/static/zTree/js/jquery.ztree.all.min.js"></script>
<style>
.ztree li span.button.add {margin-left:2px; margin-right: -1px; background-position:-144px 0; vertical-align:top; *vertical-align:middle}
</style>
<div class="breadcrumbs" id="breadcrumbs">
	<script type="text/javascript">
		try {
			ace.settings.check('breadcrumbs', 'fixed')
		} catch (e) {
		}
	</script>

	<ul class="breadcrumb">
		<li><i class="icon-home home-icon"></i> <a href="${path}/admin/index">首页</a></li>
		<li class="active">权限管理</li>
		<li class="active">资源管理</li>
	</ul>
	<!-- .breadcrumb -->

	<div class="nav-search" id="nav-search">
		<form class="form-search">
			<span class="input-icon"> 
				<input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" /> <i class="icon-search nav-search-icon"></i>
			</span>
		</form>
	</div>
	<!-- #nav-search -->
</div>
<div class="page-content">
	<div class="row">
		<div class="col-xs-3">
			<div class="widget-header">
				<h5>资源树</h5>
				<a href="javascript:;" onclick="add()" class="table-add-btn3"  title="新增"><img src="${path}/static/images/icon/16/plus.png"></a>
				<a href="javascript:;" onclick="edit()" class="table-add-btn2"  title="修改"><img src="${path}/static/images/icon/16/pencil.png"></a>
				<a href="javascript:;" onclick="authorization()" class="table-add-btn"  title="授权"><img src="${path}/static/images/icon/16/wrench-screwdriver.png"></a>
			</div>
			<div id="resourceTree" class="ztree">
			</div>
		</div>
		<div class="col-xs-9">
			<div class="widget-header">
				<h5>资源信息</h5>
			</div>
			<div class="table-responsive">
				<div id="resourceInfo">
					<div class="col-xs-12 mar-top-10">
						<div class="col-xs-2 text-right">资源名称：</div>
						<div class="col-xs-10 text-left" id="resourceName"></div>
					</div>
					<div class="col-xs-12 mar-top-10">
						<div class="col-xs-2 text-right">资源图标：</div>
						<div class="col-xs-10 text-left" id="resourceIcon"></div>
					</div>
				</div>
				<div id="resourceEdit" style="display: none">
					<form id="resourceForm" action="#">
						<input type="hidden" name="id" id="id" value=""/>
						<input type="hidden" name="pId" id="pId" value=""/>
						<input type="hidden" name="resourceLevel" id="resourceLevel" value=""/>
						<div class="col-xs-12 mar-top-10">
							<div class="col-xs-2 text-right">资源名称：</div>
							<div class="col-xs-10 text-left"><input type="text" name="resourceName" id="resourceName" value=""/></div>
						</div>
						<div class="col-xs-12 mar-top-10">
							<div class="col-xs-2 text-right">是否可用：</div>
							<div class="col-xs-10 text-left">
								<label class="col-xs-1">
									<input type="radio" name="available" checked="checked" id="available1" value="1"/>是
								</label>
								<label class="col-xs-6">
									<input type="radio" name="available" id="available2" value="0"/>否
								</label>
							</div>
						</div>
						<div class="col-xs-12 mar-top-10">
							<div class="col-xs-2 text-right">资源类别：</div>
							<div class="col-xs-10 text-left">
								<label class="col-xs-1">
									<input type="radio" name="resourceType" checked="checked" id="resourceType1" value="RM"/>菜单
								</label>
								<label class="col-xs-6">
									<input type="radio" name="resourceType" id="resourceType2" value="RB"/>按钮
								</label>
							</div>
						</div>
						<div class="col-xs-12 mar-top-10">
							<div class="col-xs-2 text-right">资源图标：</div>
							<div class="col-xs-10 text-left"><input type="text" name="resourceIcon" id="resourceIcon" value=""/></div>
						</div>
						<div class="col-xs-12 mar-top-10">
							<div class="col-xs-2 text-right">后面图标：</div>
							<div class="col-xs-10 text-left"><input type="text" name="iconBack" id="iconBack" value=""/></div>
						</div>
						<div class="col-xs-12 mar-top-10">
							<div class="col-xs-2 text-right">资源权限：</div>
							<div class="col-xs-10 text-left"><input type="text" name="permission" id="permission" value=""/></div>
						</div>
						<div class="col-xs-12 mar-top-10">
							<div class="col-xs-2 text-right">资源地址：</div>
							<div class="col-xs-10 text-left"><input type="text" name="resourceUrl" id="resourceUrl" value=""/></div>
						</div>
					    <div class="col-xs-12 mar-top-10 col-sm-offset-2">
					      	<button type="button" onclick="saveResource()" class="btn btn-default">保存</button>
					    </div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
var setting = {
	async: {
		enable: true,
		url:"${path}/admin/authority/resource/treeData",
		autoParam:["id"],
		dataFilter: filter
	},
	check: {
		enable: true,
		chkStyle: "checkbox",
		chkboxType: { "Y": "", "N": "" }
	},
	callback: {
		onClick: function(event, treeId, treeNode){
			$("#resourceEdit").hide();
			$("#resourceInfo").show();
			$("#resourceName").text(treeNode.name);
			$("#resourceIcon").html(treeNode.resourceIcon);
		}
	}
};
function filter(treeId, parentNode, responseData) {
	for (var i=0, len=responseData.length; i<len; i++) {
		responseData[i].name = responseData[i].resourceName;
		responseData[i].checked  = false;
		if(responseData[i].leaf=="0"){
			responseData[i].isParent=true;
		}
	}
	return responseData;
}

$(document).ready(function(){
	$.fn.zTree.init($("#resourceTree"), setting);
});

function add(){
	var treeObj = $.fn.zTree.getZTreeObj("resourceTree");
	var nodes = treeObj.getCheckedNodes(true);
	if(nodes.length>1){
		$.cxDialog({info: '最多指定一个父级资源！'});
		return ;
	}else if(nodes.length==1){
		clearForm("#resourceForm");
		$("#resourceInfo").hide();
		var resourceForm=$("#resourceEdit").show();
		var node=nodes[0];
		$("#resourceLevel",resourceForm).val(parseInt(node.resourceLevel)+1);
		console.log($("#resourceLevel",resourceForm).length);
		$("#pId",resourceForm).val(node.id);
	}else{
		clearForm("#resourceForm");
		var resourceForm=$("#resourceEdit").show();
		$("#resourceLevel",resourceForm).val(1);
		$("#pId",resourceForm).val(-1);
		$("#resourceInfo").hide();
		var resourceForm=$("#resourceEdit").show();
	}
}

function edit(){
	var treeObj = $.fn.zTree.getZTreeObj("resourceTree");
	var nodes = treeObj.getCheckedNodes(true);
	if(nodes.length!=1){
		$.cxDialog({info: '请选择一个需要修改的资源节点！'});
		return ;
	}
	var node=nodes[0];
	var resourceForm=$("#resourceEdit").show();
	$("#resourceLevel",resourceForm).val(node.resourceLevel);
	$("#pId",resourceForm).val(node.pId);
	$("#id",resourceForm).val(node.id);
	$("#resourceName",resourceForm).val(node.name);
	$("#resourceIcon",resourceForm).val(node.resourceIcon);
	$("#iconBack",resourceForm).val(node.iconBack);
	$("#permission",resourceForm).val(node.permission);
	$("#resourceUrl",resourceForm).val(node.resourceUrl);
	if(!!node.available){
		$("available1",resourceForm).prop("checked","checked");
		$("available2",resourceForm).removeProp("checked");
	}else{
		$("available1",resourceForm).removeProp("checked");
		$("available2",resourceForm).prop("checked","checked");
	}
	if(node.resourceType=='RM'){
		$("resourceType1",resourceForm).prop("checked","checked");
		$("resourceType2",resourceForm).removeProp("checked");
	}else{
		$("resourceType1",resourceForm).removeProp("checked");
		$("resourceType2",resourceForm).prop("checked","checked");
	}
	
	
	$("#resourceInfo").hide();
}

function saveResource(){
	$.ajax({
		url:"${path}/admin/authority/resource/save",
		data:$("#resourceForm").serialize(),
		type:"POST",
		success:function(data){
			if(data.success){
				$.cxDialog({info: '保存成功！'});
				reloadTree($("#pId","#resourceEdit").val());
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

function reloadTree(id){
	var treeObj = $.fn.zTree.getZTreeObj("resourceTree");
	var node = treeObj.getNodeByTId(id);
	treeObj.reAsyncChildNodes(node, "refresh",false);
}
</script>