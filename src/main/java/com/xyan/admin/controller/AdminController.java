package com.xyan.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xyan.frame.security.SecureUtil;

/**
 * @author wangming
 *管理员
 */
@Controller
@RequestMapping("admin")
public class AdminController {
	
	public static void main(String[] args) {
		System.out.println(SecureUtil.md5(SecureUtil.md5("123456")+"123456"));
		System.out.println(SecureUtil.md5("123456"));
		System.out.println(SecureUtil.md5("e10adc3949ba59abbe56e057f20f883e"+"123456"));
		/*
		 * 0E117EADBADC48F0D354084DCF80FCB3
E10ADC3949BA59ABBE56E057F20F883E
e10adc3949ba59abbe56e057f20f883e
5F1D7A84DB00D2FCE00B31A7FC73224F
		 * 
		 */
	}
	
	@RequestMapping(value={"/","/index"},method={RequestMethod.GET,RequestMethod.POST})
	public String index(){
		return "admin/index";
	}
	
	@RequestMapping(value="{other}",method=RequestMethod.GET)
	public String other(@PathVariable String other){
		
		return "admin/"+other;
	}
	
}
