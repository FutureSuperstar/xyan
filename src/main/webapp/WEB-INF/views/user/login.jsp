<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<title>登陆 </title>
	<meta name="keywords" content="Bootstrap" />
	<meta name="description" content="" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<!-- basic styles -->

	<link href="${path}/static/assets/css/bootstrap.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="${path}/static/assets/css/font-awesome.min.css" />

	<!--[if IE 7]>
	  <link rel="stylesheet" href="${path}/static/assets/css/font-awesome-ie7.min.css" />
	<![endif]-->

	<!-- page specific plugin styles -->

	<!-- fonts -->

	<link rel="stylesheet" href="${path}/static/googleapis/css?family=Open+Sans:400,300" />

	<!-- ace styles -->

	<link rel="stylesheet" href="${path}/static/assets/css/ace.min.css" />
	<link rel="stylesheet" href="${path}/static/assets/css/ace-rtl.min.css" />

	<!--[if lte IE 8]>
	  <link rel="stylesheet" href="${path}/static/assets/css/ace-ie.min.css" />
	<![endif]-->
	<!-- inline styles related to this page -->
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	<script src="${path}/static/assets/js/html5shiv.js"></script>
	<script src="${path}/static/assets/js/respond.min.js"></script>
	<![endif]-->
</head>
<body class="login-layout">
<div class="main-container">
	<div class="main-content">
		<div class="row">
			<div class="col-sm-10 col-sm-offset-1">
				<div class="login-container">
					<div class="center">
						<h1>
							<i class="icon-leaf green"></i>
							<span class="red">xyan</span>
							<span class="white">Application</span>
						</h1>
						<h4 class="blue">&copy; Company Name</h4>
					</div>

					<div class="space-6"></div>

					<div class="position-relative">
						<div id="login-box" class="login-box visible widget-box no-border">
							<div class="widget-body">
								<div class="widget-main">
									<h4 class="header blue lighter bigger">
										<i class="icon-coffee green"></i>
										请输入您的登陆信息
									</h4>

									<div class="space-6"></div>

									<form id="loginForm">
										<fieldset>
											<label class="block clearfix">
												<span class="block input-icon input-icon-right">
													<input type="text" class="form-control" placeholder="用户名" id="loginName" />
													<i class="icon-user"></i>
												</span>
											</label>

											<label class="block clearfix">
												<span class="block input-icon input-icon-right">
													<input type="password" class="form-control" placeholder="密码" id="password"/>
													<i class="icon-lock"></i>
												</span>
											</label>
											
											<label class="block clearfix">
												<span id="loginError" class="block input-icon input-icon-right red text-center">
												</span>
											</label>

											<div class="space"></div>

											<div class="clearfix">
												<label class="inline">
													<input type="checkbox" class="ace" />
													<span class="lbl">记住我</span>
												</label>

												<button type="button" onclick="toLogin()" class="width-35 pull-right btn btn-sm btn-primary">
													<i class="icon-key"></i>
													登陆
												</button>
											</div>

											<div class="space-4"></div>
										</fieldset>
									</form>

									<div class="social-or-login center">
										<span class="bigger-110">或者用下面的方式</span>
									</div>

									<div class="social-login center">
										<a class="btn btn-primary">
											<i class="icon-facebook"></i>
										</a>

										<a class="btn btn-info">
											<i class="icon-twitter"></i>
										</a>

										<a class="btn btn-danger">
											<i class="icon-google-plus"></i>
										</a>
									</div>
								</div><!-- /widget-main -->

								<div class="toolbar clearfix">
									<div>
										<a href="#" onclick="show_box('forgot-box'); return false;" class="forgot-password-link">
											<i class="icon-arrow-left"></i>
											忘记密码
										</a>
									</div>

									<div>
										<a href="#" onclick="show_box('signup-box'); return false;" class="user-signup-link">
											注册
											<i class="icon-arrow-right"></i>
										</a>
									</div>
								</div>
							</div><!-- /widget-body -->
						</div><!-- /login-box -->

						<div id="forgot-box" class="forgot-box widget-box no-border">
							<div class="widget-body">
								<div class="widget-main">
									<h4 class="header red lighter bigger">
										<i class="icon-key"></i>
										取回密码
									</h4>

									<div class="space-6"></div>
									<p>输入您的注册邮箱</p>
									<form>
										<fieldset>
											<label class="block clearfix">
												<span class="block input-icon input-icon-right">
													<input type="email" class="form-control" placeholder="邮箱" />
													<i class="icon-envelope"></i>
												</span>
											</label>

											<div class="clearfix">
												<button type="button" class="width-35 pull-right btn btn-sm btn-danger">
													<i class="icon-lightbulb"></i>
													发送
												</button>
											</div>
										</fieldset>
									</form>
								</div><!-- /widget-main -->

								<div class="toolbar center">
									<a href="#" onclick="show_box('login-box'); return false;" class="back-to-login-link">
										返回登陆
										<i class="icon-arrow-right"></i>
									</a>
								</div>
							</div><!-- /widget-body -->
						</div><!-- /forgot-box -->

						<div id="signup-box" class="signup-box widget-box no-border">
							<div class="widget-body">
								<div class="widget-main">
									<h4 class="header green lighter bigger">
										<i class="icon-group blue"></i>
										注册信息
									</h4>

									<div class="space-6"></div>
									<p>开始注册： </p>

									<form>
										<fieldset>
											<label class="block clearfix">
												<span class="block input-icon input-icon-right">
													<input type="email" class="form-control" placeholder="邮箱" />
													<i class="icon-envelope"></i>
												</span>
											</label>

											<label class="block clearfix">
												<span class="block input-icon input-icon-right">
													<input type="text" class="form-control" placeholder="用户名" />
													<i class="icon-user"></i>
												</span>
											</label>

											<label class="block clearfix">
												<span class="block input-icon input-icon-right">
													<input type="password" class="form-control" placeholder="密码" />
													<i class="icon-lock"></i>
												</span>
											</label>

											<label class="block clearfix">
												<span class="block input-icon input-icon-right">
													<input type="password" class="form-control" placeholder="再确认您的密码" />
													<i class="icon-retweet"></i>
												</span>
											</label>

											<label class="block">
												<input type="checkbox" class="ace" />
												<span class="lbl">
													我同意
													<a href="#">xxxx协议</a>
												</span>
											</label>

											<div class="space-24"></div>

											<div class="clearfix">
												<button type="reset" class="width-30 pull-left btn btn-sm">
													<i class="icon-refresh"></i>
													重置
												</button>

												<button type="button" class="width-65 pull-right btn btn-sm btn-success">
													注册
													<i class="icon-arrow-right icon-on-right"></i>
												</button>
											</div>
										</fieldset>
									</form>
								</div>

								<div class="toolbar center">
									<a href="#" onclick="show_box('login-box'); return false;" class="back-to-login-link">
										<i class="icon-arrow-left"></i>
										返回登陆
									</a>
								</div>
							</div><!-- /widget-body -->
						</div><!-- /signup-box -->
					</div><!-- /position-relative -->
				</div>
			</div><!-- /.col -->
		</div><!-- /.row -->
	</div>
</div><!-- /.main-container -->
<input type="hidden" value="${saveUrl}" id="saveUrl"/>
<!-- basic scripts -->
<script src="${path}/static/js/jquery/jquery-1.10.1.js"></script>
<script type="text/javascript">
	if("ontouchend" in document) document.write("<script src='${path}/static/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
</script>
<!-- inline scripts related to this page -->
<script type="text/javascript">
var path='${path}';
function show_box(id) {
	 jQuery('.widget-box.visible').removeClass('visible');
	 jQuery('#'+id).addClass('visible');
}
</script>
<script type="text/javascript" src="${path}/static/js/jquery/jquery.md5.js"></script>
<script type="text/javascript" src="${path}/static/js/login.js"></script>
<div style="display:none"><script src='${path}/static/googleapis/stat.js' charset='utf-8'></script></div>
</body>
</html>