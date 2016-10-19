package com.xyan.blog.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xyan.blog.model.MessageModel;
import com.xyan.blog.service.MessageService;
import com.xyan.frame.base.web.ResponseModel;
import com.xyan.frame.feature.mybatis.intercept.Page;


/**
 *@description 文章（博客） --控制器
 *@Author：wangming
 *@Date:2016-05-16 10:32:51
 */
@Controller
@RequestMapping(value = "/blog/board")
public class MessageController {

	private static final Logger logger = Logger.getLogger(MessageController.class);

	@Autowired
	private MessageService messageService;
	
	
	@InitBinder  
	public void initBinder(WebDataBinder binder) throws Exception {  
	     DateFormat df = new SimpleDateFormat("yyyy-MM-dd");  
	     binder.registerCustomEditor(Date.class, null, new CustomDateEditor(df,  
	                true));  
	}
	
	/**列表查询*/
	@RequestMapping(method = RequestMethod.GET)
	public String list(){
		return "blog/message/messageList";
	}
	
	/**分页数据*/
	@RequestMapping(value="pageData")
	public ModelAndView data(MessageModel entity,Page<HashMap<String, Object>> page){
		logger.warn(entity);
		entity.setDest(-1L);
		page=messageService.selectByPage(entity,page);
		return new ModelAndView("blog/message/messageData")
				.addObject("page", page);
	}
	
	@RequestMapping(method=RequestMethod.POST,value="saveMess")
	@ResponseBody
	public ResponseModel saveMess(MessageModel message){
		messageService.insert(message);
		return new ResponseModel(true);
	}

	
}
