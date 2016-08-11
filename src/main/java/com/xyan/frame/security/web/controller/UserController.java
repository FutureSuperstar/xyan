package com.xyan.frame.security.web.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xyan.frame.base.web.ResponseModel;
import com.xyan.frame.feature.web.constant.Constant;
import com.xyan.frame.security.model.UserModel;
import com.xyan.frame.security.service.UserService;
import com.xyan.frame.security.web.util.SessionUtil;
import com.xyan.frame.util.PropertiesUtil;
import com.xyan.frame.util.VerifyCodeUtils;

@Controller
@RequestMapping("user")
public class UserController {

	protected Logger logger = Logger.getLogger(UserController.class);

	@Autowired
	private UserService userService;// 用户

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String toLogin(HttpServletRequest request,Model model) {
		return "user/login";
	}
	
	@RequestMapping(value = "loginCode", method = RequestMethod.GET)
	public void loginCode(HttpServletRequest request,HttpServletResponse response) {
		try {
			String loginCode=VerifyCodeUtils.generateVerifyCode(4);
			request.getSession().setAttribute(PropertiesUtil.getProperties("LOGIN_CODE"), loginCode);
			VerifyCodeUtils.outputImage(200, 80, response.getOutputStream(), loginCode);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

	@RequestMapping(value = "login", method = RequestMethod.POST)
	@ResponseBody
	public ResponseModel login(UserModel user, String code,HttpServletRequest request) {
		ResponseModel responseModel = new ResponseModel();
		/*
		 * 1、验证码
		 */
		String sessionCode=SessionUtil.getSession(request).getAttribute(PropertiesUtil.getProperties("LOGIN_CODE")).toString();
		if(!sessionCode.equalsIgnoreCase(code)){
			responseModel.setMessage("验证码输入错误！").setSuccess(false);
		}else{
			responseModel=userService.login(user);
		}
		/*
		 * 3.设置回调链接 如果是空的，返回首页
		 */
		logger.warn("LoginController login end............................");
		return responseModel;
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		request.getSession().removeAttribute(Constant.lOGIN_USER);
		return "index";
	}

}
