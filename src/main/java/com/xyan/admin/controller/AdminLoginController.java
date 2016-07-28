package com.xyan.admin.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xyan.frame.base.web.ResponseModel;
import com.xyan.frame.security.SecureUtil;
import com.xyan.frame.security.model.UserModel;
import com.xyan.frame.security.service.UserService;
import com.xyan.frame.util.PropertiesUtil;

/**
 * 后台登陆，需要做严格的限制
 * @author wangming
 */
@Controller
@RequestMapping("/admin")
public class AdminLoginController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="login",method=RequestMethod.GET)
	public String toLogin(HttpServletRequest request,HttpServletResponse response){
		String cookieValue=SecureUtil.md5(SecureUtil.md5(PropertiesUtil.getProperties("system.code"))+System.currentTimeMillis());
		Cookie cookie=new Cookie("id",cookieValue);
		response.addCookie(cookie);
		request.getSession().setMaxInactiveInterval(1000000);
		request.getSession().setAttribute("id", cookieValue);
		System.out.println(request.getAttribute("saveUrl"));
		return "user/login";
	}
	
	@RequestMapping(value="login",method=RequestMethod.POST)
	@ResponseBody
	public ResponseModel login(HttpServletRequest request,UserModel user){
		request.getSession().removeAttribute("id");
		return userService.login(user);
	}
}
