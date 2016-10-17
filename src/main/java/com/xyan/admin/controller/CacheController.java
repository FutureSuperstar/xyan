package com.xyan.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xyan.common.cache.CacheUtil;
import com.xyan.frame.base.web.ResponseModel;

@Controller
@RequestMapping("admin/cache")
public class CacheController {
	
	@RequestMapping("remove")
	@ResponseBody
	public ResponseModel remove(String name,String kind){
		CacheUtil.remove(name, kind);
		return new ResponseModel().setSuccess(true);
	}
	
	@RequestMapping("init")
	@ResponseBody
	public ResponseModel init(){
		CacheUtil.initCache();
		return new ResponseModel().setSuccess(true);
	}
}
