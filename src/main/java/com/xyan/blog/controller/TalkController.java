package com.xyan.blog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.xyan.blog.service.StatementService;

/**
 * @author wangming
 *闲言碎语
 */
@Controller
@RequestMapping(value = "/blog/talk")
public class TalkController {
	@Autowired
	private StatementService statementService;
	
	@RequestMapping
	public ModelAndView index(){
		return new ModelAndView("blog/talk/talk")
			.addObject("statementList", statementService.selectByExample(null));
	}
}
