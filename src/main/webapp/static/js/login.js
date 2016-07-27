
/**
 * 登陆
 */
function toLogin(){
	$.ajax({
		url:path+"/admin/login",
		type:"POST",
		data:{"loginName":$("#loginName").val(),"password":$.md5($("#password").val())},
		success:function(data){
			if(data.success){
				location=path+data.message;
			}else{
				console.log(data);
			}
		},
		error:function(e){
			console.log("非法参数，服务器拒绝登陆");
		}
	});
}