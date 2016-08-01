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
 *慢生活
 */
@Controller
@RequestMapping(value = "/blog/life")
public class LifeController {
	
	@Autowired
	private ArticleService articleService;
	
	@RequestMapping
	public ModelAndView index(){
		ArticleModel query=new ArticleVO();
		query.setTypeId(ArticleType.TYPE_LIFE.getCode());
		return new ModelAndView("blog/life/life")
				.addObject("page", articleService.selectByPage(query, null));
	}
}
