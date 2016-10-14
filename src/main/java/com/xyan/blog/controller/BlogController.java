package com.xyan.blog.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xyan.blog.model.ArticleModel;
import com.xyan.blog.model.DictModel;
import com.xyan.blog.service.ArticleService;
import com.xyan.blog.service.DictService;
import com.xyan.blog.vo.ArticleVO;
import com.xyan.common.enums.ArticleType;
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
		return dictService.selectByExample(model);
	}
	@RequestMapping("getLastArticle")
	@ResponseBody
	public Page<HashMap<String, Object>> getLastArticle(){
		ArticleVO model=new ArticleVO();
		return articleService.selectByPage(model, new Page<HashMap<String,Object>>(1, 6));
	}
	
	/**列表查询*/
	@RequestMapping(value="gdList",method = RequestMethod.GET)
	public ModelAndView list(String date){
		//技术类博客，查询ID不是慢生活和闲言碎语的
		ArticleVO query=new ArticleVO();
		int year=Integer.parseInt(date.substring(0, 4));
		int month=Integer.parseInt(date.substring(4, 6));
		Calendar start=Calendar.getInstance();
		start.set(year, month-1, 1);
		start.set(Calendar.HOUR_OF_DAY, 0);
		start.set(Calendar.MINUTE, 0);
		start.set(Calendar.SECOND, 0);
		query.setCreateTimeStart(start.getTime());
		query.setCreateTimeStart(start.getTime());
		start.add(Calendar.MONTH, 1);
		query.setCreateTimeEnd(start.getTime());
		return new ModelAndView("blog/article/articleList")
				.addObject("page", articleService.selectByPage(query, new Page<HashMap<String,Object>>(1,10)));
	}
}

