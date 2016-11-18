package com.xyan.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xyan.frame.base.web.ResponseModel;
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
	public String toLogin(Model model, @RequestParam(required=false) String saveUrl,HttpServletRequest request,HttpServletResponse response){
		System.out.println(request.getAttribute("saveUrl"));
		if(StringUtils.isNotBlank(saveUrl)){
			model.addAttribute("saveUrl", saveUrl);
		}
		return "user/login";
	}
	
	@RequestMapping(value="login",method=RequestMethod.POST)
	@ResponseBody
	public ResponseModel login(HttpServletRequest request,UserModel user){
		request.getSession().removeAttribute("id");
		return userService.login(user);
	}
	
	@RequestMapping(value="logout",method=RequestMethod.GET)
	public String login(HttpServletRequest request){
		request.getSession().removeAttribute(PropertiesUtil.getProperties("LOGIN_USER"));
		return "redirect:/index";
	}
	
	
}
