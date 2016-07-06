package com.xyan.site.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IconfontController {
	
	@RequestMapping("iconfont")
	public String iconfont(){
		return "iconfont/iconfont";
	}
	
	@RequestMapping("iconfont/demo")
	public String iconfontDemo(){
		return "iconfont/iconfontDemo";
	}
	
	
}
