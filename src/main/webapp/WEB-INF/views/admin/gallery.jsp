<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<title>画廊</title>
<!-- page specific plugin styles -->

<link rel="stylesheet" href="${path}/static/assets/css/colorbox.css" />

<div class="page-header">
	<h1>
		Gallery <small> <i class="icon-double-angle-right"></i>
			responsive photo gallery using colorbox
		</small>
	</h1>
</div>
<!-- /.page-header -->

<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->

		<div class="row-fluid">
			<ul class="ace-thumbnails">
				<li><a href="${path}/static/assets/images/gallery/image-1.jpg"
					title="Photo Title" data-rel="colorbox"> <img alt="150x150"
						src="${path}/static/assets/images/gallery/thumb-1.jpg" />
						<div class="tags">
							<span class="label-holder"> <span class="label label-info">breakfast</span>
							</span> <span class="label-holder"> <span
								class="label label-danger">fruits</span>
							</span> <span class="label-holder"> <span
								class="label label-success">toast</span>
							</span> <span class="label-holder"> <span
								class="label label-warning arrowed-in">diet</span>
							</span>
						</div>
				</a>

					<div class="tools">
						<a href="#"> <i class="icon-link"></i>
						</a> <a href="#"> <i class="icon-paper-clip"></i>
						</a> <a href="#"> <i class="icon-pencil"></i>
						</a> <a href="#"> <i class="icon-remove red"></i>
						</a>
					</div></li>

				<li><a href="${path}/static/assets/images/gallery/image-2.jpg"
					data-rel="colorbox"> <img alt="150x150"
						src="${path}/static/assets/images/gallery/thumb-2.jpg" />
						<div class="text">
							<div class="inner">Sample Caption on Hover</div>
						</div>
				</a></li>

				<li><a href="${path}/static/assets/images/gallery/image-3.jpg"
					data-rel="colorbox"> <img alt="150x150"
						src="${path}/static/assets/images/gallery/thumb-3.jpg" />
						<div class="text">
							<div class="inner">Sample Caption on Hover</div>
						</div>
				</a>

					<div class="tools tools-bottom">
						<a href="#"> <i class="icon-link"></i>
						</a> <a href="#"> <i class="icon-paper-clip"></i>
						</a> <a href="#"> <i class="icon-pencil"></i>
						</a> <a href="#"> <i class="icon-remove red"></i>
						</a>
					</div></li>

				<li><a href="${path}/static/assets/images/gallery/image-4.jpg"
					data-rel="colorbox"> <img alt="150x150"
						src="${path}/static/assets/images/gallery/thumb-4.jpg" />
						<div class="tags">
							<span class="label-holder"> <span
								class="label label-info arrowed">fountain</span>
							</span> <span class="label-holder"> <span
								class="label label-danger">recreation</span>
							</span>
						</div>
				</a>

					<div class="tools tools-top">
						<a href="#"> <i class="icon-link"></i>
						</a> <a href="#"> <i class="icon-paper-clip"></i>
						</a> <a href="#"> <i class="icon-pencil"></i>
						</a> <a href="#"> <i class="icon-remove red"></i>
						</a>
					</div></li>

				<li>
					<div>
						<img alt="150x150" src="${path}/static/assets/images/gallery/thumb-5.jpg" />
						<div class="text">
							<div class="inner">
								<span>Some Title!</span> <br /> <a
									href="${path}/static/assets/images/gallery/image-5.jpg" data-rel="colorbox">
									<i class="icon-zoom-in"></i>
								</a> <a href="#"> <i class="icon-user"></i>
								</a> <a href="#"> <i class="icon-share-alt"></i>
								</a>
							</div>
						</div>
					</div>
				</li>

				<li><a href="${path}/static/assets/images/gallery/image-6.jpg"
					data-rel="colorbox"> <img alt="150x150"
						src="${path}/static/assets/images/gallery/thumb-6.jpg" />
				</a>

					<div class="tools tools-right">
						<a href="#"> <i class="icon-link"></i>
						</a> <a href="#"> <i class="icon-paper-clip"></i>
						</a> <a href="#"> <i class="icon-pencil"></i>
						</a> <a href="#"> <i class="icon-remove red"></i>
						</a>
					</div></li>

				<li><a href="${path}/static/assets/images/gallery/image-1.jpg"
					data-rel="colorbox"> <img alt="150x150"
						src="${path}/static/assets/images/gallery/thumb-1.jpg" />
				</a>

					<div class="tools">
						<a href="#"> <i class="icon-link"></i>
						</a> <a href="#"> <i class="icon-paper-clip"></i>
						</a> <a href="#"> <i class="icon-pencil"></i>
						</a> <a href="#"> <i class="icon-remove red"></i>
						</a>
					</div></li>

				<li><a href="${path}/static/assets/images/gallery/image-2.jpg"
					data-rel="colorbox"> <img alt="150x150"
						src="${path}/static/assets/images/gallery/thumb-2.jpg" />
				</a>

					<div class="tools tools-top">
						<a href="#"> <i class="icon-link"></i>
						</a> <a href="#"> <i class="icon-paper-clip"></i>
						</a> <a href="#"> <i class="icon-pencil"></i>
						</a> <a href="#"> <i class="icon-remove red"></i>
						</a>
					</div></li>
			</ul>
		</div>
		<!-- PAGE CONTENT ENDS -->
	</div>
	<!-- /.col -->
</div>
<!-- /.row -->


<!-- page specific plugin scripts -->

<script src="${path}/static/assets/js/jquery.colorbox-min.js"></script>

<!-- inline scripts related to this page -->

<script type="text/javascript">
	jQuery(function($) {
		var colorbox_params = {
			reposition : true,
			scalePhotos : true,
			scrolling : false,
			previous : '<i class="icon-arrow-left"></i>',
			next : '<i class="icon-arrow-right"></i>',
			close : '&times;',
			current : '{current} of {total}',
			maxWidth : '100%',
			maxHeight : '100%',
			onOpen : function() {
				document.body.style.overflow = 'hidden';
			},
			onClosed : function() {
				document.body.style.overflow = 'auto';
			},
			onComplete : function() {
				$.colorbox.resize();
			}
		};

		$('.ace-thumbnails [data-rel="colorbox"]').colorbox(colorbox_params);
		$("#cboxLoadingGraphic").append("<i class='icon-spinner orange'></i>");//let's add a custom loading icon

		/**$(window).on('resize.colorbox', function() {
			try {
				//this function has been changed in recent versions of colorbox, so it won't work
				$.fn.colorbox.load();//to redraw the current frame
			} catch(e){}
		});*/
	})
</script>
