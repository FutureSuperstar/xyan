package com.xyan.blog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.xyan.blog.model.ArticleModel;
import com.xyan.blog.service.ArticleService;
import com.xyan.blog.vo.ArticleVO;
import com.xyan.common.enums.ArticleType;

/**
 * @author wangming
 *闲言碎语
 */
@Controller
@RequestMapping(value = "/blog/talk")
public class TalkController {
	
	@Autowired
	private ArticleService articleService;
	
	@RequestMapping
	public ModelAndView index(){
		ArticleModel query=new ArticleVO();
		query.setTypeId(ArticleType.TYPE_TALK.getCode());
		return new ModelAndView("blog/talk/talk")
				.addObject("page", articleService.selectByPage(query, null));
	}
}
