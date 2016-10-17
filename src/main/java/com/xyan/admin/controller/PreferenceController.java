package com.xyan.admin.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.xyan.admin.model.PreferenceModel;
import com.xyan.admin.service.PreferenceService;
import com.xyan.blog.vo.ArticleVO;
import com.xyan.frame.feature.mybatis.intercept.Page;

/**
 *配置管理--配置系统信息
 * @author wangming
 */
@Controller
@RequestMapping("/admin/preference")
public class PreferenceController {
	
	@Autowired
	private PreferenceService preferenceService;
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView index(){
		return new ModelAndView("/admin/preference/preference");
	}
	
	@RequestMapping(value="pageData",method=RequestMethod.POST)
	public ModelAndView pageData(PreferenceModel query,Page<HashMap<String, Object>> page){
		return new ModelAndView("/admin/preference/preferenceData")
			.addObject("page", preferenceService.selectByPage(query, page));
	}
	
	@RequestMapping(value="dialog/config",method=RequestMethod.GET)
	public ModelAndView config(String name,String kind,String value){
		return new ModelAndView("/admin/preference/config")
				.addObject("kind", kind)
				.addObject("value",value)
				.addObject("name", name);
	}
}
