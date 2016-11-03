$(function(){
	$("#loginName,#password").blur(function(){
		if(!!$(this).val()){
			$(this).removeClass("borderRequried");
		}else{
			$(this).addClass("borderRequried");
		}
	});
});


/**
 * 登陆
 */
function toLogin(){
	if(!!!$("#loginName").val()){
		$("#loginError").text("请填写用户名");
		$("#loginName").addClass("borderRequried");
		return ;
	}else{
		$("#loginName").removeClass("borderRequried");
	}
	if(!!!$("#password").val()){
		$("#loginError").text("请填写密码");
		$("#password").addClass("borderRequried");
		return ;
	}else{
		$("#password").removeClass("borderRequried");
	}
	$.ajax({
		url:path+"/admin/login",
		type:"POST",
		data:{"loginName":$("#loginName").val(),"password":$.md5($("#password").val())},
		success:function(data){
			if(data.success){
				$("#loginError").text("登陆成功").removeClass("red").addClass("green");
				location=$("#saveUrl").val();
			}else{
				$("#loginError").text(data.message);
			}
		},
		error:function(e){
			$("#loginError").text("非法参数，服务器拒绝登陆");
		}
	});
}