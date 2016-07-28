
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
				$("#loginError").text("登陆成功").removeClass("red").addClass("green");
				location=path+data.message;
			}else{
				$("#loginError").text(data.message);
			}
		},
		error:function(e){
			$("#loginError").text("非法参数，服务器拒绝登陆");
		}
	});
}