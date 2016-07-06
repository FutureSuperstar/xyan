;(function($) {
	$.extend($,{
		closeDialog:function(id){
			$("#"+id).remove();
			$("#Dialogbg").remove();
		},
		dialogCenter : function(options) {// 弹出框居中
			var defaults={
				drag:true,
				methodType:"GET"
			};
			options = $.extend(defaults, options);//加载配置
			var id = options.id||("dialog"+Math.random()), $self, $drag;
			var C = {
				init : function() {
						if (options.closeBtn == false) {
							$('body').append('<div class="D-ialog" style="position:absolute; border:solid 8px #c9e2f9; background:#fff; padding:15px 20px;z-index:999;" id="'+ id+ '"><div class="D-title"><h3></h3></div><div class="D-content"><div id="D-content-loading"></div></div></div>');
						} else {
							$('body').append('<div class="D-ialog" style="position:absolute; border:solid 8px #c9e2f9; background:#fff; padding:15px 20px;z-index:999;"  id="'+ id+ '"><div class="D-title"><h3></h3><span class="globalBg dialogClose"></span></div><div class="D-content"><div id="D-content-loading"></div></div></div>');
						};
						$self = $('#' + id);
						$drag = $('.D-title', $self);
						var $h3 = $('h3', $drag), $close = $('.dialogClose', $self);
						$h3.html(options.title);
						if(options.bg){
							$('body').append('<div id="Dialogbg" style="position:absolute; z-index:998;  background:#000; opacity:0.2; filter:alpha(opacity=20); width:100%; height:100%;left:0px; top:0px;"></div>');
						}
						$.ajax({
								url : options.url,
								dataType : "text",
								type:options.methodType,
								data : options.data,
								complete : function(request, status) {
									
								},
								success : function(data) {
									$('#D-content-loading').remove();
									$('.D-content', $self).html(data);
									if (options&& options.callback) {
										options.callback(options.nodeObj);
									};
									C.surePosition($self);
								},
								error : function() {
									$('.D-content', $self).html("<div class='dialog-error' style='color: red; margin: 0 auto; width:300px;font-size: 24px;'>系统异常，请联系管理员！</div>");
									C.surePosition($self);
								}
						});
						if (options.close) {
							$close.bind('click',options.closeFunc);
						} else {
							$close.bind('click',this.closeDialog);
						}
						if (options.drag == true) {
							this.dragControl();// 拖拽
						};
					$('#' + id).show();
				},
				
				surePosition:function(obj){
					var height=$(window).height();
					var width=$(window).width();
					var h=obj.height();
					var w=obj.width();
					obj.css({"left":(width-w)/2,top:(height-h)/2});
				},
				keyBoardSubmit : function(e) {
					var keyCode = e.keyCode;
					if (keyCode == 27) {
						C.closeDialog();
					}
					;
				},
				closeDialog : function() {
						$('#Dialogbg').remove();
						$self.remove();
				},
				dragControl : function() {
					$drag.css('cursor', 'move');
					C.left = null;
					C.top = null;
					C.startX = null;
					C.startY = null;
					C.style = $self.css('position');
					C.maxY = $(window).height()
							- $self.outerHeight(true);
					C.maxW = $(window).width()
							- $self.outerWidth(true);
					$drag.bind('mousedown', this.mouseDownDrag);
				},
				mouseDownDrag : function(e) {
					$('body').css({
						'-moz-user-select' : 'none',
						'-o-user-select' : 'none',
						'user-select' : 'none'
					});
					C.left = $self.offset().left;
					C.style == 'fixed' ? C.top = $self.offset().top
							- $(window).scrollTop()
							: C.top = $self.offset().top;
					C.startX = e.pageX;// 滑块按下去时鼠标X轴位置
					C.startY = e.pageY;// 滑块按下去时鼠标X轴位置
					$(document).bind({
							'mousemove' : C.mouseMoveDrag,
							'mouseup' : C.mouseUpDrag,
							'selectstart' : C.selectStartDrag,
							'selectable' : 'on'
					});
				},
				mouseMoveDrag : function(e) {
					var moveX = e.pageX;// 滑块按下去时鼠标X轴位置
					var moveY = e.pageY;// 滑块按下去时鼠标X轴位
					var left = C.left + moveX - C.startX;
					var top = C.top + moveY - C.startY;
					left = Math.min(C.maxW, Math.max(0, left));
					top = Math.max(0, top);
					if (C.style == 'fixed') {
						top = Math.min(C.maxY, top);
					}
					$self.css({
						'left' : left,
						'top' : top
					});
				},
				mouseUpDrag : function() {
					$('body').css({
						'-moz-user-select' : 'text',
						'-o-user-select' : 'text',
						'user-select' : 'text'
					});
					$(document).bind('selectable', 'off').unbind({
										'mousemove' : C.mouseMoveDrag,// 撤销移动FUN
										'selectstart' : C.selectStartDrag// 撤销被选中FUN
								});
				},
				selectStartDrag : function() {
					return false;
				}
			};
			C.init();
		}
	});
})(jQuery);