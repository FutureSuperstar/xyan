;
function showPageMsg(msg){
	acceptPanel('系统提示',msg,false);
}
;jQuery.MyPage = {    
	//js分页
	init:function(opts) {  
		var defaults = {     
				tableId: 'dataTable', //分页的tableId    
			    pageId: 'pagination',//分页组件的id
			    pageNum:1,//当前页码
			    pageTotal:1,//总页数
			    pageSize:10,
			    pageSizeId:"pageSizeId",//每页显示多少条
			    pageUrl:"",//分页的服务器地址，可以在参数上传或者在分页的组建中传
			    method:"POST",//交互方法
			    formId:"queryForm",//需要提交的form
			    doInit:true,//是否需要初始化查询条件
			    keyEvent:false,//是否开启键盘松开事件
			    getTable:null,//ajax拼接的table,可以自定义table的样式，也可以使用默认的
			    initback:null,//分页插件初始化完成回掉的方法
			    pageback:null//每次分页完成后的回掉方法
			  };
		opts = $.extend(defaults, opts);//加载配置
		if(!(!!opts.pageUrl)){
			opts.pageUrl=$("#"+opts.pageId).data("url");
		}
		if(!!opts.formId){
			$.MyPage.bindForm(opts,1);
		}
		var pages=$("#"+opts.pageId).data("pages");
		if(!!pages){//有值说明是form提交了查询，此时只需要初始化分页，不需要查询数据
			$.jqPaginator('#'+opts.pageId, {
				totalPages: pages,
				visiblePages: 5,
				currentPage: 1,
				wrapper:'<ul ></ul>',
				first: '<li class="first"><a href="javascript:void(0);">首页</a></li>',
				prev: '<li class="prev"><a href="javascript:void(0);">上一页</a></li>',
				next: '<li class="next"><a href="javascript:void(0);">下一页</a></li>',
				last: '<li class="last"><a href="javascript:void(0);">最后</a></li>',
				page: '<li class="page"><a href="javascript:void(0);">{{page}}</a></li>',
				onPageChange: function (num, type) {
					//插入数据
					if(type=="init"){
						//初始化自定义数据
						return;
					} else{
						$.MyPage.insertData(opts,num);
					}
					
				}
			});
			if(!!opts.initback){
				opts.initback();
			}
			if(!!opts.pageback){
				opts.pageback();
			}
		}else{//没有值就需要自己去服务器查询数据
			//初始化数据
			$.MyPage.insertData(opts,1,true);
		}
		
		$("#"+opts.pageSizeId).change(function(){
			var myPageSize=$(this).val();
			opts.pageSize=myPageSize;
			$.MyPage.insertData(opts,1,false);
		});
	},
	//js插入数据，禁止插件外调用
	insertData:function(options,num,re){
		var param="pageNum="+num+"&pageSize="+options.pageSize+"&"+$("#"+options.formId).serialize();
		$.ajax({
			url:options.pageUrl,
			type: options.method,
			dataType:"json",
			data:param,
			timeout:5000,  
			beforeSend:function(){
                var _div = $("<div class='add-style'><img src='"+path+"/static/images/loading-1.gif'/>页面正在加载中</div>");
                 _div.appendTo('body');
           },
           complete:function(XMLHttpRequest,status){
               setTimeout(function(){
            	   $('.add-style').remove();
            	   if(status=='timeout'){//超时,status还有success,error等值的情况
            		   showPageMsg("请求超时，请刷新重试......");
            	   }
               },200);
               
           },
           error:function(XMLHttpRequest, textStatus, errorThrown){
				if(XMLHttpRequest.status==400){
					showPageMsg("您提交的数据异常，服务器拒绝响应......");
				}else{
					showPageMsg("加载数据失败，请检查您的网络连接情况......");
				}
			},
    		success : function(msg){
    			setTimeout(function(){
                    $('.add-style').remove();
                   },	200);
    			if(msg.success){
    				if(options.getTable){//拼接表格
    					$("#"+options.tableId +" tbody").empty().append(options.getTable(msg.data));
    				}else{
    					var trs=[];
    					$(msg.data.result).each(function(index,data){
    						trs.push("<tr class='odd'>");
    						for(var key in data){
    							trs.push("<td>"+data[key]+"</td>");
    						}
    						trs.push("</tr>");
    					});
    					$("#"+options.tableId+" tbody").empty().append(trs.join(""));
    				}
    				if(msg.data.pages==0){
    					$("#"+options.tableId+" tbody").empty().append("<tr class='odd'><td colspan='20' class='text-center'>当前没有数据</td></tr>");
    				}
    				if(re){
    					//完成初始化后使用jqPaginator分页
        				$.jqPaginator('#'+options.pageId, {
        					totalPages: msg.data.pages==0?1:msg.data.pages,
        					visiblePages: 5,
        					currentPage: 1,
        					wrapper:'<ul></ul>',
        					first: '<li class="first"><a href="javascript:void(0);">首页</a></li>',
        					prev: '<li class="prev"><a href="javascript:void(0);">上一页</a></li>',
        					next: '<li class="next"><a href="javascript:void(0);">下一页</a></li>',
        					last: '<li class="last"><a href="javascript:void(0);">最后</a></li>',
        					page: '<li class="page"><a href="javascript:void(0);">{{page}}</a></li>',
        					onPageChange: function (num, type) {
        						//插入数据
        						if(type=="init"){
        							//初始化自定义数据
        							return;
        						} else{
        							$.MyPage.insertData(options,num);
        						}
        					}
        				});
    				}
    				if(options.pageback){
    					options.pageback();
					}
    			}else{//错误提示
    				showPageMsg("加载数据失败，请联系管理员......");
    			}
    		}
		});
	},
	//插入HTML
	initHTML:function (options){
		var defaults = {     
				tableId: 'dataTable', //分页的tableId    
			    pageId: 'pagination',//分页组件的id
			    pageSizeId:"pageSizeId",//每页显示多少条
			    pageUrl:"",//分页的服务器地址，可以在参数上传或者在分页的组建中传
			    method:"POST",//交互方法
			    formId:"queryForm",//需要提交的form
			    doInit:true,//是否需要初始化查询条件
			    getTable:null,//ajax拼接的table,可以自定义table的样式，也可以使用默认的
			    initback:null,//分页插件初始化完成回掉的方法
			  };
		var opts = $.extend(defaults, options);
		if(!(!!opts.pageUrl)){
			opts.pageUrl=$("#"+opts.pageId).data("url");
		}
		if(!!opts.formId){
			$.MyPage.bindForm(opts,2);
		}
		var sizePage=$("#"+opts.formId+" #"+opts.pageSizeId).val();
		if(!!!sizePage){
			sizePage=10;
		}
		$.MyPage.insertHTML(opts,1,sizePage,function(conf){
			$.jqPaginator('#'+opts.pageId, {
				totalPages: conf.totalPages==0?1:conf.totalPages,
				visiblePages: 5,
				currentPage: conf.currentPage,
				wrapper:'<ul></ul>',
				first: '<li class="first"><a href="javascript:void(0);">首页</a></li>',
				prev: '<li class="prev"><a href="javascript:void(0);">上一页</a></li>',
				next: '<li class="next"><a href="javascript:void(0);">下一页</a></li>',
				last: '<li class="last"><a href="javascript:void(0);">最后</a></li>',
				page: '<li class="page"><a href="javascript:void(0);">{{page}}</a></li>',
				onPageChange: function (num, type) {
					//插入数据
					if(type=="init"){
						//初始化自定义数据
						return;
					} else{
						$.MyPage.insertHTML(opts,num,10,null);
					}
				}
			});
		});
		
		
		$("#"+opts.pageSizeId).change(function(){
			var myPageSize=$(this).val();
			$.MyPage.insertHTML(opts,1,myPageSize,function(conf){
				
				$.jqPaginator('#'+opts.pageId, {
					totalPages: conf.totalPages==0?1:conf.totalPages,
					visiblePages: 5,
					currentPage: conf.currentPage,
					wrapper:'<ul></ul>',
					first: '<li class="first"><a href="javascript:void(0);">首页</a></li>',
					prev: '<li class="prev"><a href="javascript:void(0);">上一页</a></li>',
					next: '<li class="next"><a href="javascript:void(0);">下一页</a></li>',
					last: '<li class="last"><a href="javascript:void(0);">最后</a></li>',
					page: '<li class="page"><a href="javascript:void(0);">{{page}}</a></li>',
					onPageChange: function (num, type) {
						//插入数据
						if(type=="init"){
							//初始化自定义数据
							return;
						} else{
							$.MyPage.insertHTML(opts,num,myPageSize,null);
						}
					}
				});
			});
			
		});
		
	},
	insertHTML:function(options,pageNum,pageSize,callback){
		var param="pageNum="+pageNum+"&pageSize="+pageSize+"&"+$("#"+options.formId).serialize();
		$.ajax({
			url:options.pageUrl,
			type: options.method,
			data:param,
			dataType:"html",
			timeout:5000,  
			beforeSend:function(){
                var _div = $("<div class='add-style'><img src='"+path+"/static/images/loading-1.gif'/>页面正在加载中</div>");
                 _div.appendTo('body');
           },
           complete:function(XMLHttpRequest,status){
               setTimeout(function(){
            	   $('.add-style').remove();
            	   if(status=='timeout'){//超时,status还有success,error等值的情况
            		   showPageMsg("请求超时，请刷新重试......");
            	   }
               },200);
               
           },
			error:function(XMLHttpRequest, textStatus, errorThrown){
				if(XMLHttpRequest.status==400){
					showPageMsg("您提交的数据异常，服务器拒绝响应......");
				}else{
					showPageMsg("加载数据失败，请检查您的网络连接情况......");
				}
			},
    		success : function(msg){
    			$("#"+options.tableId +" tbody").empty().append(msg);
    			setTimeout(function(){
    				$('.add-style').remove();
    			},	200);
    			if($("#"+options.tableId+" tbody tr").length<2){
    				$("#"+options.tableId+" tbody").append("<tr class='odd'><td colspan='20' class='text-center'>当前没有数据</td></tr>");
    			}
    			if(!!callback){
    				var conf={"totalPages":$("#"+options.tableId +" #pageInfo").data("pages"),
    						"currentPage":$("#"+options.tableId +" #pageInfo").data("pagenum")};
    				callback(conf);
    			}
    			if(!!options.initback){
    				options.initback();
    			}
    		}
		});
	},
	bindForm:function(opts,tttype){
		if(opts.doInit){
			$("#"+opts.formId+" input,"+"#"+opts.formId+" select").val('');
			$("#"+opts.formId+" .selector-txt").html('请选择');
			var text=$("#"+opts.pageSizeId).find("option:selected").text();
			$("#"+opts.pageSizeId).siblings(".selector-txt").text(text);
		}
		//提交功能
		$("#"+opts.formId+" #submit").click(function(){
			if(tttype==1){
				$.MyPage.insertData(opts,1,true);
			}else{
				$.MyPage.insertHTML(opts,1,10,function(conf){
					$.jqPaginator('#'+opts.pageId, {
						totalPages: conf.totalPages==0?1:conf.totalPages,
						visiblePages: 5,
						currentPage: conf.currentPage,
						wrapper:'<ul></ul>',
						first: '<li class="first"><a href="javascript:void(0);">首页</a></li>',
						prev: '<li class="prev"><a href="javascript:void(0);">上一页</a></li>',
						next: '<li class="next"><a href="javascript:void(0);">下一页</a></li>',
						last: '<li class="last"><a href="javascript:void(0);">最后</a></li>',
						page: '<li class="page"><a href="javascript:void(0);">{{page}}</a></li>',
						onPageChange: function (num, type) {
							//插入数据
							if(type=="init"){
								//初始化自定义数据
								return;
							} else{
								opts.param="";
								$.MyPage.insertHTML(opts,num,10,null);
							}
						}
					});
				});
			}
		});
		$("#"+opts.formId+" input").keyup(function(e){
			if(e.keyCode==13){
				if(tttype==1){
					$.MyPage.insertData(opts,1,true);
					return ;
				}else{
					$.MyPage.insertHTML(opts,1,10,function(conf){
						$.jqPaginator('#'+opts.pageId, {
							totalPages: conf.totalPages==0?1:conf.totalPages,
							visiblePages: 5,
							currentPage: conf.currentPage,
							wrapper:'<ul></ul>',
							first: '<li class="first"><a href="javascript:void(0);">首页</a></li>',
							prev: '<li class="prev"><a href="javascript:void(0);">上一页</a></li>',
							next: '<li class="next"><a href="javascript:void(0);">下一页</a></li>',
							last: '<li class="last"><a href="javascript:void(0);">最后</a></li>',
							page: '<li class="page"><a href="javascript:void(0);">{{page}}</a></li>',
							onPageChange: function (num, type) {
								//插入数据
								if(type=="init"){
									//初始化自定义数据
									return;
								} else{
									$.MyPage.insertHTML(opts,num,10,null);
								}
							}
						});
					});
				}
				return ;
			}
			if(opts.keyEvent){
				$.MyPage.insertData(opts,1,true);
			}
		});
		//重置功能
		$("#"+opts.formId+" #reset").click(function(){
			$("#"+opts.formId+" input,"+"#"+opts.formId+" select").val('');
			$("#"+opts.formId+" .selector-txt").html('请选择');
			
		});
		//清除功能
		$("#"+opts.formId+" .close,"+"#"+opts.formId+" .close1").click(function(){
			$(this).siblings("input").val('');
		});
	}
}