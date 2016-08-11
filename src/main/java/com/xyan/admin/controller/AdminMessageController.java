package com.xyan.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xyan.blog.service.MessageService;
import com.xyan.blog.vo.MessageVO;
import com.xyan.frame.base.web.ResponseModel;

@Controller
@RequestMapping("admin/mess")
public class AdminMessageController {
	
	@Autowired
	private MessageService messageService;
	
	@RequestMapping("getMess")
	@ResponseBody
	public ResponseModel getshowMess(){
		List<MessageVO> listData=messageService.selectShowMess();
		return new ResponseModel(true).setListData(listData);
	}
}
