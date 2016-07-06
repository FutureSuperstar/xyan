<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<div class="page-content">
	<div class="page-header">
		<h1>
			Dropzone.js <small> <i class="icon-double-angle-right"></i>
				Drag &amp; drop file upload with image preview
			</small>
		</h1>
	</div>
	<!-- /.page-header -->

	<div class="row">
		<div class="col-xs-12">
			<!-- PAGE CONTENT BEGINS -->

			<div class="alert alert-info">
				<i class="icon-hand-right"></i> Please note that demo server is not
				configured to save uploaded files, therefore you may get an error
				message.
				<button class="close" data-dismiss="alert">
					<i class="icon-remove"></i>
				</button>
			</div>

			<div id="dropzone">
				<form action="//dummy.html" class="dropzone">
					<div class="fallback">
						<input name="file" type="file" multiple="" />
					</div>
				</form>
			</div>
			<!-- PAGE CONTENT ENDS -->
		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->

	<!-- page specific plugin scripts -->
	<script src="${path}/static/assets/js/dropzone.min.js"></script>
	<!-- inline scripts related to this page -->

	<script type="text/javascript">
		jQuery(function($) {

			try {
				$(".dropzone")
						.dropzone(
								{
									paramName : "file", // The name that will be used to transfer the file
									maxFilesize : 0.5, // MB

									addRemoveLinks : true,
									dictDefaultMessage : '<span class="bigger-150 bolder"><i class="icon-caret-right red"></i> Drop files</span> to upload \
				<span class="smaller-80 grey">(or click)</span> <br /> \
				<i class="upload-icon icon-cloud-upload blue icon-3x"></i>',
									dictResponseError : 'Error while uploading file!',

									//change the previewTemplate to use Bootstrap progress bars
									previewTemplate : "<div class=\"dz-preview dz-file-preview\">\n  <div class=\"dz-details\">\n    <div class=\"dz-filename\"><span data-dz-name></span></div>\n    <div class=\"dz-size\" data-dz-size></div>\n    <img data-dz-thumbnail />\n  </div>\n  <div class=\"progress progress-small progress-striped active\"><div class=\"progress-bar progress-bar-success\" data-dz-uploadprogress></div></div>\n  <div class=\"dz-success-mark\"><span></span></div>\n  <div class=\"dz-error-mark\"><span></span></div>\n  <div class=\"dz-error-message\"><span data-dz-errormessage></span></div>\n</div>"
								});
			} catch (e) {
				alert('Dropzone.js does not support older browsers!');
			}

		});
	</script>
	<div style="display:none">
		<script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540'
			language='JavaScript' charset='gb2312'></script>
	</div>
</div>