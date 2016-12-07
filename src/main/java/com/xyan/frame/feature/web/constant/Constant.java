package com.xyan.frame.feature.web.constant;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.xyan.frame.feature.web.MultiViewResover;
import com.xyan.frame.util.PropertiesUtil;

public class Constant implements ServletContextListener{

	private final Logger log = LoggerFactory.getLogger(Constant.class);  
	
	public static String lOGIN_USER;
	
	static{
		lOGIN_USER=PropertiesUtil.getProperties("LOGIN_USER");
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		log.warn("项目结束。。。");
	}

	@Override
	public void contextInitialized(ServletContextEvent sc) {
		log.warn("项目开始启动，设置全局属性。。。。");
		//设置项目的部署路径
		MultiViewResover.setViewPath(sc.getServletContext().getRealPath("/")+"WEB-INF\\views\\");
		String path=PropertiesUtil.getProperties("project.url");
		if(StringUtils.isBlank(path)){
			path=null;
		}else{
			path=sc.getServletContext().getContextPath();
			sc.getServletContext().setAttribute("path", path);
		}
		String staticUrl=PropertiesUtil.getProperties("image.url");
		sc.getServletContext().setAttribute("staticUrl", staticUrl);
		
		
	}
}
