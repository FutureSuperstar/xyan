package com.xyan.admin.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xyan.admin.model.MailModel;
import com.xyan.admin.service.MailService;
import com.xyan.frame.base.web.ResponseModel;


/**
 *@description  邮件--控制器
 *@Author：wangming
 *@email：18136442251@163.com
 *@Date:2016-06-14 11:02:12
 */
@Controller
@RequestMapping(value = "/admin/mail")
public class MailController {

	private static final Logger logger = Logger.getLogger(MailController.class);

	@Autowired
	private MailService mailService;
	
	@RequestMapping(value = "send")
	@ResponseBody
	public ResponseModel send(MailModel mail){
		logger.warn("");
		mailService.send();
		return new ResponseModel(true);
	}
	
}
