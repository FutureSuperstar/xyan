<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<title>时间轴</title>
<div class="page-header">
	<h1>
		Timeline <small> <i class="icon-double-angle-right"></i> based
			on widget boxes with 2 different styles
		</small>
	</h1>
</div>
<!-- /.page-header -->

<div class="page-content">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->

		<div class="align-right">
			<span class="green middle bolder">Choose timeline: &nbsp;</span>

			<div class="btn-toolbar inline middle no-margin">
				<div data-toggle="buttons" class="btn-group no-margin">
					<label class="btn btn-sm btn-yellow active"> <span
						class="bigger-110">1</span> <input type="radio" value="1" />
					</label> <label class="btn btn-sm btn-yellow"> <span
						class="bigger-110">2</span> <input type="radio" value="2" />
					</label>
				</div>
			</div>
		</div>

		<div id="timeline-1">
			<div class="row">
				<div class="col-xs-12 col-sm-10 col-sm-offset-1">
					<div class="timeline-container">
						<div class="timeline-label">
							<span class="label label-primary arrowed-in-right label-lg">
								<b>Today</b>
							</span>
						</div>

						<div class="timeline-items">
							<div class="timeline-item clearfix">
								<div class="timeline-info">
									<img alt="Susan't Avatar" src="${staticUrl}/static/assets/avatars/avatar1.png" />
									<span class="label label-info label-sm">16:22</span>
								</div>

								<div class="widget-box transparent">
									<div class="widget-header widget-header-small">
										<h5 class="smaller">
											<a href="#" class="blue">Susan</a> <span class="grey">reviewed
												a product</span>
										</h5>

										<span class="widget-toolbar no-border"> <i
											class="icon-time bigger-110"></i> 16:22
										</span> <span class="widget-toolbar"> <a href="#"
											data-action="reload"> <i class="icon-refresh"></i>
										</a> <a href="#" data-action="collapse"> <i
												class="icon-chevron-up"></i>
										</a>
										</span>
									</div>

									<div class="widget-body">
										<div class="widget-main">
											Anim pariatur cliche reprehenderit, enim eiusmod <span
												class="red">high life</span> accusamus terry richardson ad
											squid &hellip;
											<div class="space-6"></div>

											<div class="widget-toolbox clearfix">
												<div class="pull-left">
													<i class="icon-hand-right grey bigger-125"></i> <a href="#"
														class="bigger-110">Click to read &hellip;</a>
												</div>

												<div class="pull-right action-buttons">
													<a href="#"> <i class="icon-ok green bigger-130"></i>
													</a> <a href="#"> <i class="icon-pencil blue bigger-125"></i>
													</a> <a href="#"> <i class="icon-remove red bigger-125"></i>
													</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="timeline-item clearfix">
								<div class="timeline-info">
									<i
										class="timeline-indicator icon-food btn btn-success no-hover"></i>
								</div>

								<div class="widget-box transparent">
									<div class="widget-header widget-header-small hidden"></div>

									<div class="widget-body">
										<div class="widget-main">
											Going to cafe for lunch
											<div class="pull-right">
												<i class="icon-time bigger-110"></i> 12:30
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="timeline-item clearfix">
								<div class="timeline-info">
									<i
										class="timeline-indicator icon-star btn btn-warning no-hover green"></i>
								</div>

								<div class="widget-box transparent">
									<div class="widget-header widget-header-small">
										<h5 class="smaller">New logo</h5>

										<span class="widget-toolbar no-border"> <i
											class="icon-time bigger-110"></i> 9:15
										</span> <span class="widget-toolbar"> <a href="#"
											data-action="reload"> <i class="icon-refresh"></i>
										</a> <a href="#" data-action="collapse"> <i
												class="icon-chevron-up"></i>
										</a>
										</span>
									</div>

									<div class="widget-body">
										<div class="widget-main">
											Designed a new logo for our website. Would appreciate
											feedback.
											<div class="space-6"></div>

											<div class="widget-toolbox clearfix">
												<div class="pull-right action-buttons">
													<div class="space-4"></div>

													<div>
														<a href="#"> <i class="icon-heart red bigger-125"></i>
														</a> <a href="#"> <i class="icon-facebook blue bigger-125"></i>
														</a> <a href="#"> <i
															class="icon-reply light-green bigger-130"></i>
														</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="timeline-item clearfix">
								<div class="timeline-info">
									<i
										class="timeline-indicator icon-beaker btn btn-default no-hover"></i>
								</div>

								<div class="widget-box transparent">
									<div class="widget-header hidden"></div>

									<div class="widget-body">
										<div class="widget-main">Took the final exam. Phew!</div>
									</div>
								</div>
							</div>
						</div>
						<!-- /.timeline-items -->
					</div>
					<!-- /.timeline-container -->

					<div class="timeline-container">
						<div class="timeline-label">
							<span class="label label-success arrowed-in-right label-lg">
								<b>Yesterday</b>
							</span>
						</div>

						<div class="timeline-items">
							<div class="timeline-item clearfix">
								<div class="timeline-info">
									<i
										class="timeline-indicator icon-beer btn btn-inverse no-hover"></i>
								</div>

								<div class="widget-box transparent">
									<div class="widget-header widget-header-small">
										<h5 class="smaller">Haloween party</h5>

										<span class="widget-toolbar"> <i
											class="icon-time bigger-110"></i> 1 hour ago
										</span>
									</div>

									<div class="widget-body">
										<div class="widget-main">
											<div class="clearfix">
												<div class="pull-left">
													Lots of fun at Haloween party. <br /> Take a look at some
													pics:
												</div>

												<div class="pull-right">
													<i class="icon-chevron-left blue bigger-110"></i> &nbsp; 
													<img alt="Image 4" width="36" src="${staticUrl}/static/assets/images/gallery/thumb-4.jpg" /> 
													<img alt="Image 3" width="36" src="${staticUrl}/static/assets/images/gallery/thumb-3.jpg" /> 
													<img alt="Image 2" width="36" src="${staticUrl}/static/assets/images/gallery/thumb-2.jpg" /> 
													<img alt="Image 1" width="36" src="${staticUrl}/static/assets/images/gallery/thumb-1.jpg" /> &nbsp; 
													<i class="icon-chevron-right blue bigger-110"></i>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="timeline-item clearfix">
								<div class="timeline-info">
									<i class="timeline-indicator icon-trophy btn btn-pink no-hover green"></i>
								</div>

								<div class="widget-box transparent">
									<div class="widget-header widget-header-small">
										<h5 class="smaller">Lorum Ipsum</h5>
									</div>

									<div class="widget-body">
										<div class="widget-main">
											Anim pariatur cliche reprehenderit, enim eiusmod <span
												class="green bolder">high life</span> accusamus terry
											richardson ad squid &hellip;
										</div>
									</div>
								</div>
							</div>

							<div class="timeline-item clearfix">
								<div class="timeline-info">
									<i
										class="timeline-indicator icon-food btn btn-success no-hover"></i>
								</div>

								<div class="widget-box transparent">
									<div class="widget-header widget-header-small hidden"></div>

									<div class="widget-body">
										<div class="widget-main">Going to cafe for lunch</div>
									</div>
								</div>
							</div>

							<div class="timeline-item clearfix">
								<div class="timeline-info">
									<i class="timeline-indicator icon-bug btn btn-danger no-hover"></i>
								</div>

								<div class="widget-box">
									<div
										class="widget-header header-color-red2 widget-header-small">
										<h5 class="smaller">Critical security patch released</h5>

										<span class="widget-toolbar no-border"> <i
											class="icon-time bigger-110"></i> 9:15
										</span> <span class="widget-toolbar"> <a href="#"
											data-action="reload"> <i class="icon-refresh"></i>
										</a> <a href="#" data-action="collapse"> <i
												class="icon-chevron-up"></i>
										</a>
										</span>
									</div>

									<div class="widget-body">
										<div class="widget-main">Please download the new patch
											for maximum security.</div>
									</div>
								</div>
							</div>
						</div>
						<!-- /.timeline-items -->
					</div>
					<!-- /.timeline-container -->

					<div class="timeline-container">
						<div class="timeline-label">
							<span class="label label-grey arrowed-in-right label-lg">
								<b>May 17</b>
							</span>
						</div>

						<div class="timeline-items">
							<div class="timeline-item clearfix">
								<div class="timeline-info">
									<i
										class="timeline-indicator icon-leaf btn btn-primary no-hover green"></i>
								</div>

								<div class="widget-box transparent">
									<div class="widget-header widget-header-small">
										<h5 class="smaller">Lorum Ipsum</h5>

										<span class="widget-toolbar no-border"> <i
											class="icon-time bigger-110"></i> 10:22
										</span> <span class="widget-toolbar"> <a href="#"
											data-action="reload"> <i class="icon-refresh"></i>
										</a> <a href="#" data-action="collapse"> <i
												class="icon-chevron-up"></i>
										</a>
										</span>
									</div>

									<div class="widget-body">
										<div class="widget-main">
											Anim pariatur cliche reprehenderit, enim eiusmod <span
												class="blue bolder">high life</span> accusamus terry
											richardson ad squid &hellip;
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- /.timeline-items -->
					</div>
					<!-- /.timeline-container -->
				</div>
			</div>
		</div>

		<div id="timeline-2" class="hide">
			<div class="row">
				<div class="col-xs-12 col-sm-10 col-sm-offset-1">
					<div class="timeline-container timeline-style2">
						<span class="timeline-label"> <b>Today</b>
						</span>

						<div class="timeline-items">
							<div class="timeline-item clearfix">
								<div class="timeline-info">
									<span class="timeline-date">11:15 pm</span> <i
										class="timeline-indicator btn btn-info no-hover"></i>
								</div>

								<div class="widget-box transparent">
									<div class="widget-body">
										<div class="widget-main no-padding">
											<span class="bigger-110"> <a href="#"
												class="purple bolder">Susan</a> reviewed a product
											</span> <br /> <i class="icon-hand-right grey bigger-125"></i> <a
												href="#">Click to read &hellip;</a>
										</div>
									</div>
								</div>
							</div>

							<div class="timeline-item clearfix">
								<div class="timeline-info">
									<span class="timeline-date">12:30 pm</span> <i
										class="timeline-indicator btn btn-info no-hover"></i>
								</div>

								<div class="widget-box transparent">
									<div class="widget-body">
										<div class="widget-main no-padding">
											Going to <span class="green bolder">veg cafe</span> for lunch
										</div>
									</div>
								</div>
							</div>

							<div class="timeline-item clearfix">
								<div class="timeline-info">
									<span class="timeline-date">11:15 pm</span> <i
										class="timeline-indicator btn btn-info no-hover"></i>
								</div>

								<div class="widget-box transparent">
									<div class="widget-body">
										<div class="widget-main no-padding">
											Designed a new logo for our website. Would appreciate
											feedback. <a href="#"> Click to see <i
												class="icon-zoom-in blue bigger-110"></i>
											</a>

											<div class="space-2"></div>

											<div class="action-buttons">
												<a href="#"> <i class="icon-heart red bigger-125"></i>
												</a> <a href="#"> <i class="icon-facebook blue bigger-125"></i>
												</a> <a href="#"> <i
													class="icon-reply light-green bigger-130"></i>
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="timeline-item clearfix">
								<div class="timeline-info">
									<span class="timeline-date">9:00 am</span> <i
										class="timeline-indicator btn btn-info no-hover"></i>
								</div>

								<div class="widget-box transparent">
									<div class="widget-body">
										<div class="widget-main no-padding">Took the final exam.
											Phew!</div>
									</div>
								</div>
							</div>
						</div>
						<!-- /.timeline-items -->
					</div>
					<!-- /.timeline-container -->

					<div class="timeline-container timeline-style2">
						<span class="timeline-label"> <b>Yesterday</b>
						</span>

						<div class="timeline-items">
							<div class="timeline-item clearfix">
								<div class="timeline-info">
									<span class="timeline-date">9:00 am</span> <i
										class="timeline-indicator btn btn-success no-hover"></i>
								</div>

								<div class="widget-box transparent">
									<div class="widget-body">
										<div class="widget-main no-padding">
											<div class="clearfix">
												<div class="pull-left">
													<span class="orange2 bolder">Haloween party</span> Lots of
													fun at Haloween party. <br /> Take a look at some pics:
												</div>

												<div class="pull-right">
													<i class="icon-chevron-left blue bigger-110"></i> &nbsp; 
													<img alt="Image 4" width="36" src="${staticUrl}/static/assets/images/gallery/thumb-4.jpg" /> 
													<img alt="Image 3" width="36" src="${staticUrl}/static/assets/images/gallery/thumb-3.jpg" />
													<img alt="Image 2" width="36" src="${staticUrl}/static/assets/images/gallery/thumb-2.jpg" />
													<img alt="Image 1" width="36" src="${staticUrl}/static/assets/images/gallery/thumb-1.jpg" /> &nbsp; 
													<i class="icon-chevron-right blue bigger-110"></i>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="timeline-item clearfix">
								<div class="timeline-info">
									<span class="timeline-date">9:00 am</span> <i
										class="timeline-indicator btn btn-success no-hover"></i>
								</div>
								<div class="widget-box transparent">
									<div class="widget-body">
										<div class="widget-main no-padding">
											Anim pariatur cliche reprehenderit, enim eiusmod <span
												class="pink2 bolder">high life</span> accusamus terry
											richardson ad squid &hellip;
										</div>
									</div>
								</div>
							</div>

							<div class="timeline-item clearfix">
								<div class="timeline-info">
									<span class="timeline-date">9:00 am</span> <i
										class="timeline-indicator btn btn-success no-hover"></i>
								</div>

								<div class="widget-box transparent">
									<div class="widget-body">
										<div class="widget-main no-padding">Going to cafe for
											lunch</div>
									</div>
								</div>
							</div>

							<div class="timeline-item clearfix">
								<div class="timeline-info">
									<span class="timeline-date">9:00 am</span> <i
										class="timeline-indicator btn btn-success no-hover"></i>
								</div>

								<div class="widget-box transparent">
									<div class="widget-body">
										<div class="widget-main no-padding">
											<span class="red bolder">Critical security patch
												released</span> <br /> Please download the new patch for maximum
											security.
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- /.timeline-items -->
					</div>
					<!-- /.timeline-container -->

					<div class="timeline-container timeline-style2">
						<span class="timeline-label"> <b>May 17</b>
						</span>

						<div class="timeline-items">
							<div class="timeline-item clearfix">
								<div class="timeline-info">
									<span class="timeline-date">9:00 am</span> <i
										class="timeline-indicator btn btn-grey no-hover"></i>
								</div>

								<div class="widget-box transparent">
									<div class="widget-body">
										<div class="widget-main no-padding">
											<span class="bolder blue">Lorum Ipsum</span> Anim pariatur
											cliche reprehenderit, enim eiusmod <span
												class="purple bolder">high life</span> accusamus terry
											richardson ad squid &hellip;
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- /.timeline-items -->
					</div>
					<!-- /.timeline-container -->
				</div>
			</div>
		</div>

		<!-- PAGE CONTENT ENDS -->
	</div>
	<!-- /.col -->
</div>
<!-- /.row -->
</div>
<!-- /.page-content -->
</div>
<!-- /.main-content -->

<div class="ace-settings-container" id="ace-settings-container">
	<div class="btn btn-app btn-xs btn-warning ace-settings-btn"
		id="ace-settings-btn">
		<i class="icon-cog bigger-150"></i>
	</div>

	<div class="ace-settings-box" id="ace-settings-box">
		<div>
			<div class="pull-left">
				<select id="skin-colorpicker" class="hide">
					<option data-skin="default" value="#438EB9">#438EB9</option>
					<option data-skin="skin-1" value="#222A2D">#222A2D</option>
					<option data-skin="skin-2" value="#C6487E">#C6487E</option>
					<option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
				</select>
			</div>
			<span>&nbsp; Choose Skin</span>
		</div>

		<div>
			<input type="checkbox" class="ace ace-checkbox-2"
				id="ace-settings-navbar" /> <label class="lbl"
				for="ace-settings-navbar"> Fixed Navbar</label>
		</div>

		<div>
			<input type="checkbox" class="ace ace-checkbox-2"
				id="ace-settings-sidebar" /> <label class="lbl"
				for="ace-settings-sidebar"> Fixed Sidebar</label>
		</div>

		<div>
			<input type="checkbox" class="ace ace-checkbox-2"
				id="ace-settings-breadcrumbs" /> <label class="lbl"
				for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
		</div>

		<div>
			<input type="checkbox" class="ace ace-checkbox-2"
				id="ace-settings-rtl" /> <label class="lbl" for="ace-settings-rtl">
				Right To Left (rtl)</label>
		</div>

		<div>
			<input type="checkbox" class="ace ace-checkbox-2"
				id="ace-settings-add-container" /> <label class="lbl"
				for="ace-settings-add-container"> Inside <b>.container</b>
			</label>
		</div>
	</div>
</div>
<!-- /#ace-settings-container -->


<!-- inline scripts related to this page -->

<script type="text/javascript">
	jQuery(function($) {
		$('[data-toggle="buttons"] .btn').on('click', function(e) {
			var target = $(this).find('input[type=radio]');
			var which = parseInt(target.val());
			$('[id*="timeline-"]').addClass('hide');
			$('#timeline-' + which).removeClass('hide');
		});
	});
</script>
