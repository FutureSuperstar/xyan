
/**
 * 发送消息，必须登陆以后
 */
function sendMess(){
	$.ajax({
		url:path+"/blog/aboard/saveMess",
		type:"POST",
		data:$("#messageForm").serialize(),
		success:function(data){
			if(data.success){
				
			}else{
				alert("抱歉，您的留言不合本站规定！");
			}
		},
		error:function(e){
			console.log(e);
			alert("抱歉，您的留言不合本站规定！");
		}
	});
}

/**
 * 初始化消息。完成初始化后每五分钟向后台请求一次消息。
 */
function initMess(){
	getMess();
	var time=setInterval(getMess, 5000);
}

/**
 * 获取消息
 */
function getMess(){
	$.ajax({
		url:path+"/admin/mess/getMess",
		data:$("#messageForm").serialize(),
		success:function(data){
			if(data.success){
				
			}else{
				alert("抱歉，您的留言不合本站规定！");
			}
		},
		error:function(e){
			console.log(e);
			alert("抱歉，您的留言不合本站规定！");
		}
	});
}