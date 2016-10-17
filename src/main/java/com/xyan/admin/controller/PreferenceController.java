package com.xyan.admin.controller;

import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.xyan.admin.model.PreferenceModel;
import com.xyan.common.cache.CacheUtil;
import com.xyan.frame.feature.mybatis.intercept.Page;

/**
 *配置管理--配置系统信息
 * @author wangming
 */
@Controller
@RequestMapping("/admin/preference")
public class PreferenceController {
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView index(){
		return new ModelAndView("/admin/preference/preference");
	}
	
	@RequestMapping(value="pageData",method=RequestMethod.POST)
	public ModelAndView pageData(PreferenceModel query,Page<HashMap<String, Object>> page){
		
		return new ModelAndView("/admin/preference/preferenceData")
			.addObject("cache", CacheUtil.getAllCache());
	}
	
}
