package com.xyan.blog.controller;

import java.util.HashMap;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.xyan.blog.model.ArticleModel;
import com.xyan.blog.model.MessageModel;
import com.xyan.blog.service.ArticleService;
import com.xyan.blog.service.MessageService;
import com.xyan.blog.vo.ArticleVO;
import com.xyan.common.enums.ArticleType;
import com.xyan.frame.feature.mybatis.intercept.Page;


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
	private ArticleService articleService;//文章
	
	@Autowired
	private MessageService  messageService;
	/**列表查询*/
	@RequestMapping
	public ModelAndView index(ArticleVO vo,Page<HashMap<String, Object>> page){
		return new ModelAndView("blog/article/articleList")
				.addObject("page", articleService.selectTalkByPage(vo, page));
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
		MessageModel model=new MessageModel();
		model.setDest(entity.getId());
		return new ModelAndView("blog/article/articleView")
			.addObject("discussList", messageService.selectByExample(model))
			.addObject("title","文章（博客）查看")
			.addObject("model", entity);
	}
}
