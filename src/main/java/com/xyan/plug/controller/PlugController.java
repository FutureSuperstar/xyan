package com.xyan.plug.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("plug")
public class PlugController {
	private Logger logger=Logger.getLogger(PlugController.class);
	
	@RequestMapping("{other}/{page}")
	public String page(@PathVariable String other,@PathVariable String page){
		logger.info("插件集合。。。"+other);
		return "plug/"+other+"/"+page;
	}
	
	@RequestMapping("{other}")
	public String index(@PathVariable String other){
		logger.info("插件集合。。。"+other);
		return "plug/"+other;
	}
	
}
