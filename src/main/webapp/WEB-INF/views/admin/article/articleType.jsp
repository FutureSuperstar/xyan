<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="${path}/static/zTree/css/demo.css" rel="stylesheet">
<link href="${path}/static/zTree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet">
<script src="${path}/static/zTree/js/jquery.ztree.all.min.js"></script>
<style type="text/css">
.ztree li span.button.add {margin-left:2px; margin-right: -1px; background-position:-144px 0; vertical-align:top; *vertical-align:middle}
</style>
<div class="widget-box">
	<div class="widget-body">
		<ul id="treeDemo" class="ztree"></ul>
	</div>
</div>
<script type="text/javascript">
var setting = {
	async: {
		enable: true,
		url:"${path}/admin/article/getChildren",
		autoParam:["pId"],
		type:"get"
		//dataFilter: filter
	},
	view: {
		expandSpeed:"",
		addHoverDom: addHoverDom,
		removeHoverDom: removeHoverDom,
		selectedMulti: false
	},
	edit: {
		enable: true
	},
	data: {
		simpleData: {
			enable: true
		}
	},
	callback: {
		beforeRemove: beforeRemove,
		beforeRename: beforeRename,
		onRename:afterRename,
		onDblClick:selectType
	}
};

function filter(treeId, parentNode, childNodes) {
	if (!childNodes) return null;
	for (var i=0, l=childNodes.length; i<l; i++) {
		childNodes[i].name = childNodes[i].name.replace(/\.n/g, '.');
	}
	return childNodes;
}

function selectType(event, treeId, treeNode){
	$("#typeId").val(treeNode.id);
	$("#typeName").val(treeNode.name);
	$.closeDialog("articleType");
}
function beforeRemove(treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("treeDemo");
	zTree.selectNode(treeNode);
	return confirm("确认删除 节点 -- " + treeNode.name + " 吗？");
}		

function beforeRename(treeId, treeNode, newName) {
	if (newName.length == 0) {
		alert("节点名称不能为空.");
		return false;
	}
	return true;
}
function afterRename(event, treeId, treeNode, isCancel){
	if(!isCancel){
		$.ajax({
			url:"${path}/admin/article/saveType",
			type:"POST",
			data:{"dataId":treeNode.id,"dataName":treeNode.name,"datapId":treeNode.pId},
			success:function(data){
				if(!data.success){
						$.cxDialog({
							info:data.message,
							 background: '#000',
							 okText:"确定",
							 ok:function(){
							 	$.cxDialog.close();
							 }
						});
				}
			},
			error:function(){
				$.cxDialog({
					info:"非法数据",
					 background: '#000',
					 okText:"确定",
					 ok:function(){
					 	$.cxDialog.close();
					 }
				});
			}
		});
	}
}
var newCount = 1;
function addHoverDom(treeId, treeNode) {
	var sObj = $("#" + treeNode.tId + "_span");
	if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
	var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
		+ "' title='add node' onfocus='this.blur();'></span>";
	sObj.after(addStr);
	var btn = $("#addBtn_"+treeNode.tId);
	if (btn) btn.bind("click", function(){
		var zTree = $.fn.zTree.getZTreeObj("treeDemo");
		zTree.addNodes(treeNode, {id:(100 + newCount), pId:treeNode.id, name:"new node" + (newCount++)});
		return false;
	});
};

function removeHoverDom(treeId, treeNode) {
	$("#addBtn_"+treeNode.tId).unbind().remove();
};

		//$(document).ready(function(){
$.fn.zTree.init($("#treeDemo"), setting);
		//});
</script>