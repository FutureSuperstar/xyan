<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<title>收件箱</title>

<div class="page-header">
	<h1>
		邮件<small> <i class="icon-double-angle-right"></i> 已发送和待发送的
		</small>
	</h1>
</div>
<!-- /.page-header -->

<div class="page-content">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->

		<div class="row">
			<div class="col-xs-12">
				<div class="tabbable">
					<ul id="inbox-tabs" class="inbox-tabs nav nav-tabs padding-16 tab-size-bigger tab-space-1">
						<!-- ./li-new-mail -->
						<li class="active">
							<a data-toggle="tab" href="#inbox" data-target="inbox"> 
								<i class="blue icon-inbox bigger-130"></i><span class="bigger-110">邮箱</span>
							</a>
						</li>
					</ul>
					<div class="tab-content no-border no-padding">
						<div class="tab-pane in active">
							<div class="message-container">
								<!-- 消息列表 -->
								<div class="message-list-container">
									<div class="message-list" id="message-list">
										<c:forEach items="${mailList}" var="item">
											<div class="message-item <c:if test='${state=="00"}'>message-unread</c:if> ">
												<label class="inline"> 
													<input type="checkbox" class="ace" /><span class="lbl"></span>
												</label> 
												<i class="message-star icon-star-empty light-grey"></i> 
												<span class="sender" title="John Doe">${item.fromUser}</span> 
												<span class="time"><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span> 
												<span class="attachment"> <i class="icon-paper-clip"></i></span> 
												<span class="summary"><span class="text" data-id="${item.id}">${item.subject}</span></span>
											</div>
										</c:forEach>
									</div>
								</div>
								<!-- /.message-list-container -->

								<!-- 底部 -->
								<div class="message-footer clearfix">
									<div class="pull-left">151 messages total</div>
									<div class="pull-right">
										<div class="inline middle">page 1 of 16</div>
										&nbsp; &nbsp;
										<ul class="pagination middle">
											<li class="disabled"><span> <i
													class="icon-step-backward middle"></i>
											</span></li>

											<li class="disabled"><span> <i
													class="icon-caret-left bigger-140 middle"></i>
											</span></li>

											<li><span> <input value="1" maxlength="3"
													type="text" />
											</span></li>

											<li><a href="#"> <i
													class="icon-caret-right bigger-140 middle"></i>
											</a></li>

											<li><a href="#"> <i class="icon-step-forward middle"></i>
											</a></li>
										</ul>
									</div>
								</div>
								
								<!-- 底部右侧 -->
								<div class="hide message-footer message-footer-style2 clearfix">
									<div class="pull-left">simpler footer</div>

									<div class="pull-right">
										<div class="inline middle">message 1 of 151</div>

										&nbsp; &nbsp;
										<ul class="pagination middle">
											<li class="disabled"><span> <i
													class="icon-angle-left bigger-150"></i>
											</span></li>

											<li><a href="#"> <i
													class="icon-angle-right bigger-150"></i>
											</a></li>
										</ul>
									</div>
								</div>
							</div>
							<!-- /.message-container -->
						</div>
						<!-- /.tab-pane -->
					</div>
					<!-- /.tab-content -->
				</div>
				<!-- /.tabbable -->
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->

		
		<!-- 消息内容 -->
		<c:forEach var="item" items="${mailList}">
			<div class="hide message-content" id="id-message-content${item.id}">
				<div class="message-header clearfix">
					<div class="pull-left">
						<i class="icon-star orange2 mark-star"></i> &nbsp; 
						<img class="middle" alt="John's Avatar" src="${path}/static/assets/avatars/avatar.png" width="32" /> &nbsp; 
						<a href="#" class="sender">${item.fromUser}</a>&nbsp; 
						<i class="icon-time bigger-110 orange middle"></i> 
						<span class="time"><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/> </span>
					</div>
					<div class="action-buttons pull-right">
						<!-- 删除邮件 -->
						<a href="${path}/admin/mail/del${item.id}"><i class="icon-trash red icon-only bigger-130"></i></a>
					</div>
				</div>
	
				<div class="hr hr-double"></div>
	
				<div class="message-body">
					${item.content}
				</div>
				<div class="hr hr-double"></div>
			</div>
		</c:forEach>
		<!-- /.message-content -->

		<!-- PAGE CONTENT ENDS -->
	</div>
	<!-- /.col -->
</div>
<!-- /.row -->


<!-- page specific plugin scripts -->
<script src="${staticUrl}/static/assets/js/jquery.slimscroll.min.js"></script>

<!-- inline scripts related to this page -->
<script type="text/javascript">
	jQuery(function($) {


		//basic initializations
		$('.message-list .message-item input[type=checkbox]').removeAttr('checked');
		$('.message-list').delegate('.message-item input[type=checkbox]','click',function() {
			$(this).closest('.message-item').toggleClass('selected');
			if (this.checked)
				Inbox.display_bar(1);//display action toolbar when a message is selected
			else {
				Inbox.display_bar($('.message-list input[type=checkbox]:checked').length);
			}
		});

		//display second message right inside the message list
		$('.message-list .message-item .text').on('click',function() {
			var message = $(this).closest('.message-item');

			//if message is open, then close it
			if (message.hasClass('message-inline-open')) {
				message.removeClass('message-inline-open')
						.find('.message-content').remove();
				return;
			}
			var messageId=$(this).data("id");
			$('.message-container').append('<div class="message-loading-overlay"><i class="icon-spin icon-spinner orange2 bigger-160"></i></div>');
			setTimeout(function() {
				$('.message-container').find('.message-loading-overlay').remove();
				message.addClass('message-inline-open').append('<div class="message-content" />')
				var content = message.find('.message-content:last').html($('#id-message-content'+messageId).html());
				content.find('.message-body').slimScroll({height : 200,railVisible : true});
			}, 500 + parseInt(Math.random() * 500));

		});


		var Inbox = {
			//displays a toolbar according to the number of selected messages
			display_bar : function(count) {
				if (count == 0) {
					$('#id-toggle-all').removeAttr('checked');
					$('#id-message-list-navbar .message-toolbar').addClass('hide');
					$('#id-message-list-navbar .message-infobar').removeClass('hide');
				} else {
					$('#id-message-list-navbar .message-infobar').addClass('hide');
					$('#id-message-list-navbar .message-toolbar').removeClass('hide');
				}
			},
		}

	});
</script>