<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<title>角色管理</title>
<link href="${path}/static/zTree/css/demo.css" rel="stylesheet">
<link href="${path}/static/zTree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet">
<script src="${path}/static/zTree/js/jquery.ztree.all.min.js"></script>
<style type="text/css">
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
		<li class="active">角色管理</li>
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
	<div class="page-header">
		<h1>角色管理</h1>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="widget-body">
				<div class="widget-main">
					<div class="row">
						<!-- 左侧角色树 -->
						<div class="col-sm-12">
							<div class="widget-box">
								<div class="widget-header widget-header-flat">
									<h4>角色树</h4>
								</div>
								<div class="widget-body">
									<div id="roleTree" class="ztree"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
var setting = {
	view: {
		addHoverDom: addHoverDom,
		removeHoverDom: removeHoverDom,
		selectedMulti: false
	},
	edit: {
		enable: true,
		editNameSelectAll: true,
		showRemoveBtn: showRemoveBtn,
		showRenameBtn: showRenameBtn
	},
	data: {
		simpleData: {
			enable: true
		}
	},
	callback: {
		beforeDrag: beforeDrag,
		beforeEditName: beforeEditName,
		beforeRemove: beforeRemove,
		beforeRename: beforeRename,
		onRemove: onRemove,
		onRename: onRename
	}
};

var zNodes =[
	{ id:1, pId:0, name:"父节点 1", open:true},
	{ id:11, pId:1, name:"叶子节点 1-1"},
	{ id:12, pId:1, name:"叶子节点 1-2"},
	{ id:13, pId:1, name:"叶子节点 1-3"},
	{ id:2, pId:0, name:"父节点 2", open:true},
	{ id:21, pId:2, name:"叶子节点 2-1"},
	{ id:22, pId:2, name:"叶子节点 2-2"},
	{ id:23, pId:2, name:"叶子节点 2-3"},
	{ id:3, pId:0, name:"父节点 3", open:true},
	{ id:31, pId:3, name:"叶子节点 3-1"},
	{ id:32, pId:3, name:"叶子节点 3-2"},
	{ id:33, pId:3, name:"叶子节点 3-3"}
];

var log, className = "dark";

function beforeDrag(treeId, treeNodes) {
	return false;
}

function beforeEditName(treeId, treeNode) {
	className = (className === "dark" ? "":"dark");
	showLog("[ "+getTime()+" beforeEditName ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
	var zTree = $.fn.zTree.getZTreeObj("roleTree");
	zTree.selectNode(treeNode);
	return confirm("进入节点 -- " + treeNode.name + " 的编辑状态吗？");
}

function beforeRemove(treeId, treeNode) {
	className = (className === "dark" ? "":"dark");
	showLog("[ "+getTime()+" beforeRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
	var zTree = $.fn.zTree.getZTreeObj("roleTree");
	zTree.selectNode(treeNode);
	return confirm("确认删除 节点 -- " + treeNode.name + " 吗？");
}

function onRemove(e, treeId, treeNode) {
	showLog("[ "+getTime()+" onRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
}

function beforeRename(treeId, treeNode, newName, isCancel) {
	className = (className === "dark" ? "":"dark");
	showLog((isCancel ? "<span style='color:red'>":"") + "[ "+getTime()+" beforeRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name + (isCancel ? "</span>":""));
	if (newName.length == 0) {
		alert("节点名称不能为空.");
		var zTree = $.fn.zTree.getZTreeObj("roleTree");
		setTimeout(function(){zTree.editName(treeNode)}, 10);
		return false;
	}
	return true;
}

function onRename(e, treeId, treeNode, isCancel) {
	showLog((isCancel ? "<span style='color:red'>":"") + "[ "+getTime()+" onRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name + (isCancel ? "</span>":""));
}

function showRemoveBtn(treeId, treeNode) {
	return !treeNode.isFirstNode;
}

function showRenameBtn(treeId, treeNode) {
	return !treeNode.isLastNode;
}
		
function showLog(str) {
	if (!log) log = $("#log");
	log.append("<li class='"+className+"'>"+str+"</li>");
	if(log.children("li").length > 8) {
		log.get(0).removeChild(log.children("li")[0]);
	}
}

function getTime() {
	var now= new Date(),
	h=now.getHours(),
	m=now.getMinutes(),
	s=now.getSeconds(),
	ms=now.getMilliseconds();
	return (h+":"+m+":"+s+ " " +ms);
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
		var zTree = $.fn.zTree.getZTreeObj("roleTree");
		zTree.addNodes(treeNode, {id:(100 + newCount), pId:treeNode.id, name:"new node" + (newCount++)});
		return false;
	});
};

function removeHoverDom(treeId, treeNode) {
	$("#addBtn_"+treeNode.tId).unbind().remove();
};

function selectAll() {
	var zTree = $.fn.zTree.getZTreeObj("roleTree");
	zTree.setting.edit.editNameSelectAll =  $("#selectAll").attr("checked");
}
		
$(document).ready(function(){
	$.fn.zTree.init($("#roleTree"), setting, zNodes);
	$("#selectAll").bind("click", selectAll);
});
</script>