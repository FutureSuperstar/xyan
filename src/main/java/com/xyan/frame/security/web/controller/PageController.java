package com.xyan.frame.security.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *  This controller is page controller. It provides the page service,which means error.
 * @author wangming
 *
 */
@Controller
@RequestMapping("page")
public class PageController {
	
	@RequestMapping("400")
	public String error400(){
		return "page/400";
	}
	
	@RequestMapping("401")
	public String error401(){
		return "page/401";
	}
	
	@RequestMapping("403")
	public String error403(){
		return "page/403";
	}
	
	@RequestMapping("404")
	public String error404(){
		return "page/404";
	}
	
	
	@RequestMapping("500")
	public String error500(){
		return "page/500";
	}
	
}
