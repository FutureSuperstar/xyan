package com.xyan.blog.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.xyan.blog.service.ArticleService;
import com.xyan.blog.vo.ArticleVO;
import com.xyan.frame.feature.mybatis.intercept.Page;

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
	public ModelAndView index(ArticleVO vo,Page<HashMap<String, Object>> page){
		return new ModelAndView("blog/life/life")
				.addObject("page", articleService.selectLifeByPage(vo, page));
	}
}
