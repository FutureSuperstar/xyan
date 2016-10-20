package com.xyan.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.xyan.admin.service.MailService;


/**
 *@description  邮件--控制器
 *@Author：wangming
 *@email：18136442251@163.com
 *@Date:2016-06-14 11:02:12
 */
@Controller
@RequestMapping(value = "/admin/mail")
public class MailController {

	@Autowired
	private MailService mailService;
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView index(){
		return new ModelAndView("admin/mail/mail").addObject("mailList", mailService.selectByExample(null));
	}
}
