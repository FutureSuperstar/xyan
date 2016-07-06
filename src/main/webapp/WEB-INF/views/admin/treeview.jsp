<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<title>机构菜单树</title>
<div class="page-header">
	<h1>
		Treeview <small> <i class="icon-double-angle-right"></i> with
			selectable items(single &amp; multiple) and custom icons
		</small>
	</h1>
</div>
<!-- /.page-header -->

<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->

		<div class="row">
			<div class="col-sm-6">
				<div class="widget-box">
					<div class="widget-header header-color-blue2">
						<h4 class="lighter smaller">Choose Categories</h4>
					</div>

					<div class="widget-body">
						<div class="widget-main padding-8">
							<div id="tree1" class="tree"></div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-sm-6">
				<div class="widget-box">
					<div class="widget-header header-color-green2">
						<h4 class="lighter smaller">Browse Files</h4>
					</div>

					<div class="widget-body">
						<div class="widget-main padding-8">
							<div id="tree2" class="tree"></div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<script type="text/javascript">
			var $assets = "assets";//this will be used in fuelux.tree-sampledata.js
		</script>

		<!-- PAGE CONTENT ENDS -->
	</div>
	<!-- /.col -->
</div>
<!-- /.row -->


<!-- page specific plugin scripts -->

<script src="${path}/static/assets/js/fuelux/data/fuelux.tree-sampledata.js"></script>
<script src="${path}/static/assets/js/fuelux/fuelux.tree.min.js"></script>


<!-- inline scripts related to this page -->

<script type="text/javascript">
	jQuery(function($) {

		$('#tree1')
				.ace_tree(
						{
							dataSource : treeDataSource,
							multiSelect : true,
							loadingHTML : '<div class="tree-loading"><i class="icon-refresh icon-spin blue"></i></div>',
							'open-icon' : 'icon-minus',
							'close-icon' : 'icon-plus',
							'selectable' : true,
							'selected-icon' : 'icon-ok',
							'unselected-icon' : 'icon-remove'
						});

		$('#tree2')
				.ace_tree(
						{
							dataSource : treeDataSource2,
							loadingHTML : '<div class="tree-loading"><i class="icon-refresh icon-spin blue"></i></div>',
							'open-icon' : 'icon-folder-open',
							'close-icon' : 'icon-folder-close',
							'selectable' : false,
							'selected-icon' : null,
							'unselected-icon' : null
						});

		/**
		$('#tree1').on('loaded', function (evt, data) {
		});

		$('#tree1').on('opened', function (evt, data) {
		});

		$('#tree1').on('closed', function (evt, data) {
		});

		$('#tree1').on('selected', function (evt, data) {
		});
		 */
	});
</script>