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

function initMess(){
	getMess();
	var time=setInterval(getMess, 5000);
}

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