package com.xyan.blog.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.xyan.blog.model.ArticleModel;
import com.xyan.blog.service.ArticleService;
import com.xyan.blog.vo.ArticleVO;
import com.xyan.common.enums.ArticleType;


/**
 *@description 文章（博客） --控制器
 *@Author：wangming
 *@Date:2016-05-16 10:32:51
 */
@Controller
@RequestMapping(value = "/blog/article")
public class ArticleController {

	private static final Logger logger = Logger.getLogger(ArticleController.class);

	@Autowired
	private ArticleService articleService;
	
	/**列表查询*/
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView list(Long typeId){
		//技术类博客，查询ID不是慢生活和闲言碎语的
		ArticleModel query=new ArticleVO();
		query.setTypeId(typeId==null?ArticleType.TYPE_TALK.getCode():typeId);
		return new ModelAndView("blog/article/articleList")
				.addObject("page", articleService.selectByPage(query, null));
	}
	
	
	/**进入新增*/
	@RequestMapping(value="add", method = RequestMethod.GET)
	public ModelAndView toAdd(){
		return new ModelAndView("blog/article/articleAdd")
				.addObject("action","add")
				.addObject("title","新增文章");
	}
	
	
	/**进入查看*/
	@RequestMapping(value="view/{id}", method = RequestMethod.GET)
	public ModelAndView toView(@PathVariable Long id){
		ArticleModel entity=articleService.selectByPrimaryKey(id);
		if(entity==null){
			throw new NullPointerException("没有找到指定的文章（博客）");
		}
		return new ModelAndView("blog/article/articleView")
			.addObject("title","文章（博客）查看")
			.addObject("model", entity);
	}
}
