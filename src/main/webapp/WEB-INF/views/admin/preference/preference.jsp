<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>配置管理</title>
<div class="breadcrumbs" id="breadcrumbs">
	<script type="text/javascript">
		try {
			ace.settings.check('breadcrumbs', 'fixed')
		} catch (e) {
		}
	</script>

	<ul class="breadcrumb">
		<li><i class="icon-home home-icon"></i> <a
			href="${path}/admin/index">首页</a></li>
		<li class="active">配置管理</li>
	</ul>
	<!-- .breadcrumb -->

	<div class="nav-search" id="nav-search">
		<form class="form-search">
			<span class="input-icon"> <input type="text"
				placeholder="Search ..." class="nav-search-input"
				id="nav-search-input" autocomplete="off" /> <i
				class="icon-search nav-search-icon"></i>
			</span>
		</form>
	</div>
	<!-- #nav-search -->
</div>
<div class="page-content">
	<div class="mar-bottom-5 relative">
		<div class="row ui-tables-pro2" style="height: auto;">
			<form action="" id="queryForm">
				<div class="sol-sm-6 sol-xs-3">
					<div class="form-group form-horizontal mar-top-15">
						<label class="sol-xs-5 control-label pad-right-0  align-right">名称：</label>
						<div class="sol-xs-7">
							<input type="text" class="sol-xs-11 " name="name" id="name" />
						</div>
					</div>
				</div>
				<div class="sol-sm-6 sol-xs-3">
					<div class="form-group form-horizontal mar-top-15">
						<label class="sol-xs-5 control-label pad-right-0  align-right">类别：</label>
						<div class="sol-xs-7">
							<input type="text" class="sol-xs-11 " id="kind" name="kind" />
		
						</div>
					</div>
				</div>
				<div class="sol-sm-6 sol-xs-2">
					<div class="form-group form-horizontal mar-top-15 mar-left-20">
						<button type="button" id="submit" class="width-65 pull-right btn btn-sm btn-success" style="line-height: 1.05;">
							查询
						</button>
					</div>
					<div class="clearfix"></div>
				</div>
			</form>
		</div>
	</div>
	<div class="table-responsive">
		<div class="widget-header">
			<h5>配置列表</h5>
			<a href="${path}/admin/article/add" class="smallButton table-add-btn" title="新增"><img src="${path}/static/images/icon/16/plus.png"></a>
		</div>
		<table class="table table-bordered align-center font12 mar-bottom-0 dataTable" id="dataTable">
			<thead>
				<tr>
					<th width="15%" class="align-center">名称</th>
					<th width="9%" class="align-center">类别</th>
					<th width="10%" class="align-center">值</th>
					<th width="11%" class="align-center">备注</th>
				</tr>
			</thead>
			<tbody id="tbody">
			</tbody>
		</table>
		<!-- 分页 start  -->
		<div class="page-header-search">
			<table class="table table-bordered align-text-center font12 mar-bottom-0 dataTable">
				<tbody>
					<tr class="ui-toolbar">
						<td colspan="10">
							<div id="pagination" data-url="${path}/admin/preference/pageData" class="pagination right"></div>
							<div class="clear"></div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- 分页 end  -->
	</div>
</div>
<script type="text/javascript">
	$(function(){
		//HTML分页
		$.MyPage.initHTML();
		
		var message="${message}";
		if(!!message){
			$.cxDialog({
				  	info: message
			});
		}
	});
</script>