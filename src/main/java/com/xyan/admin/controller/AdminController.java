package com.xyan.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author wangming
 *管理员
 */
@Controller
@RequestMapping("admin")
public class AdminController {
	
	@RequestMapping(value={"/","/index"},method={RequestMethod.GET,RequestMethod.POST})
	public String index(){
		return "admin/index";
	}
	
	@RequestMapping(value="login",method=RequestMethod.GET)
	public String login(){
		return "admin/login";
	}
	
	@RequestMapping(value="{other}",method=RequestMethod.GET)
	public String other(@PathVariable String other){
		
		return "admin/"+other;
	}
	
}
