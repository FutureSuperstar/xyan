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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.xyan.blog.model.ArticleModel;
import com.xyan.blog.service.ArticleService;
import com.xyan.frame.base.web.ResponseModel;
import com.xyan.frame.feature.mybatis.intercept.Page;
import com.xyan.frame.feature.web.MediaTypes;


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
	
	
	@InitBinder  
	public void initBinder(WebDataBinder binder) throws Exception {  
	     DateFormat df = new SimpleDateFormat("yyyy-MM-dd");  
	     binder.registerCustomEditor(Date.class, null, new CustomDateEditor(df,  
	                true));  
	}
	
	/**列表查询*/
	@RequestMapping(method = RequestMethod.GET)
	public String list(){
		return "blog/article/articleList";
	}
	
	/**分页数据*/
	@RequestMapping(value="pageData")
	public ModelAndView data(ArticleModel entity,Page<HashMap<String, Object>> page){
		logger.warn(entity);
		page=articleService.selectByPage(entity,page);
		return new ModelAndView("blog/article/articleData")
				.addObject("page", page);
	}
	
	
	/**进入新增*/
	@RequestMapping(value="add", method = RequestMethod.GET)
	public ModelAndView toAdd(){
		return new ModelAndView("blog/article/articleAdd")
				.addObject("action","add")
				.addObject("title","新增文章");
	}
	
	/**新增*/
	@RequestMapping(value="add", method = RequestMethod.POST,produces = MediaTypes.JSON_UTF_8)
	@ResponseBody
	public ResponseModel add(ArticleModel entity){
		logger.warn(entity);
		articleService.insert(entity);
		return new ResponseModel(true);
	}
	
	/**进入编辑*/
	@RequestMapping(value="edit", method = RequestMethod.GET)
	public ModelAndView toEdit(Long id){
		ArticleModel entity =articleService.selectByPrimaryKey(id);
		if(entity==null){
			throw new NullPointerException("没有找到指定的文章（博客）");
		}
		return new ModelAndView("blog/article/articleAdd")
				.addObject("action","edit").addObject("title","文章（博客）修改").addObject("model", entity);
	}
	
	
	/**编辑*/
	@RequestMapping(value="edit", method = RequestMethod.POST,produces = MediaTypes.JSON_UTF_8)
	@ResponseBody
	public ResponseModel edit(ArticleModel entity){
		logger.warn(entity);
		try {
			articleService.update(entity);
		} catch (Exception e) {
			throw new RuntimeException("保存失败");
		}
		return new ResponseModel(true);	
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
	
	
	/**删除（批量删除）*/
	@RequestMapping(value="del", method = RequestMethod.POST)
	public String del(String ids,RedirectAttributes remodel){
		//articleService.deleteByIds(ids);
		remodel.addFlashAttribute("message","删除成功！");
		return "redirect:/blog/article";
	}
	
	
}
