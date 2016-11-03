package com.xyan.blog.controller;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xyan.blog.model.DictModel;
import com.xyan.blog.service.ArticleService;
import com.xyan.blog.service.DictService;
import com.xyan.blog.vo.ArticleVO;
import com.xyan.common.enums.DictType;
import com.xyan.frame.feature.mybatis.intercept.Page;

@Controller
@RequestMapping(value = "/blog")
public class BlogController {
	
	@Autowired
	private DictService dictService;
	
	@Autowired
	private ArticleService articleService;
	
	@RequestMapping("getGdList")
	@ResponseBody
	public List<DictModel> getGdList(){
		DictModel model=new DictModel();
		model.setType(DictType.DICT_GD.getCode());
		return dictService.selectModelByExample(model);
	}
	@RequestMapping("getLastArticle")
	@ResponseBody
	public Page<HashMap<String, Object>> getLastArticle(){
		ArticleVO model=new ArticleVO();
		return articleService.selectByPage(model, new Page<HashMap<String,Object>>(1, 6));
	}
	
	/**列表查询*/
	@RequestMapping(value="date/{date}",method = RequestMethod.GET)
	public ModelAndView list(ArticleVO vo,Page<HashMap<String, Object>> page,@PathVariable String date){
		//技术类博客，查询ID不是慢生活和闲言碎语的
		int year=Integer.parseInt(date.substring(0, 4));
		int month=Integer.parseInt(date.substring(4, 6));
		Calendar start=Calendar.getInstance();
		start.set(year, month-1, 1);
		start.set(Calendar.HOUR_OF_DAY, 0);
		start.set(Calendar.MINUTE, 0);
		start.set(Calendar.SECOND, 0);
		vo.setCreateTimeStart(start.getTime());
		vo.setCreateTimeStart(start.getTime());
		start.add(Calendar.MONTH, 1);
		vo.setCreateTimeEnd(start.getTime());
		return new ModelAndView("blog/article/articleList")
				.addObject("page", articleService.selectByPage(vo, page));
	}
	
	@RequestMapping(value="type/{id}",method = RequestMethod.GET)
	public ModelAndView type(ArticleVO vo,Page<HashMap<String, Object>> page,@PathVariable Long typeId){
		//技术类博客，查询ID不是慢生活和闲言碎语的
		vo.setTypeId(typeId);
		return new ModelAndView("blog/article/articleList")
				.addObject("page", articleService.selectByPage(vo, page));
	}
}

