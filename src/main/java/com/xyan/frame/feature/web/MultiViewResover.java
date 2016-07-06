package com.xyan.frame.feature.web;

import java.io.File;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.ViewResolver;

/**自定义视图解析*/
public class MultiViewResover implements ViewResolver {
	public static String viewPath="";
	private final Logger log = LoggerFactory.getLogger(MultiViewResover.class);  
	private Map<String, ViewResolver> resolvers;
	

	@Override
	public View resolveViewName(String viewName, Locale locale) throws Exception {
		String suffix = "";
		/* 
		 * 关键问题，如何去寻找模板？
		 * 给定viewName,去WEB-INF/views下面的文件夹找？找到什么算什么，没有则使用jsp
		 */
		
		String path=viewPath+viewName;
		File file=new File(path);
		if(file.exists()){
			suffix = "thymeleaf";
		}else{
			suffix = "jsp";
		}
		path+="."+suffix;
		//根据后缀名找
		ViewResolver resolver = resolvers.get(suffix);
		log.warn("本次请求的视图为:"+suffix+"，后台响应文件为："+path);;
		return resolver.resolveViewName(viewName, locale);
	}

	public Map<String, ViewResolver> getResolvers() {
		return resolvers;
	}

	public void setResolvers(Map<String, ViewResolver> resolvers) {
		this.resolvers = resolvers;
	}
	
	public static void setViewPath(String viewPath){
		MultiViewResover.viewPath=viewPath;
	}
}
