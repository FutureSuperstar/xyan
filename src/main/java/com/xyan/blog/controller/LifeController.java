package com.xyan.blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author wangming
 *慢生活
 */
@Controller
@RequestMapping(value = "/blog/life")
public class LifeController {
	
	@RequestMapping
	public String index(){
		return "blog/life/life";
	}
}
