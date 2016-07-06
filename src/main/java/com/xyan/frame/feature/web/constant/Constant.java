package com.xyan.frame.feature.web.constant;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.xyan.frame.feature.web.MultiViewResover;

public class Constant implements ServletContextListener{

	private final Logger log = LoggerFactory.getLogger(Constant.class);  
	
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		log.warn("项目结束。。。");
	}

	@Override
	public void contextInitialized(ServletContextEvent sc) {
		log.warn("项目开始启动，设置全局属性。。。。");
		//设置项目的部署路径
		MultiViewResover.setViewPath(sc.getServletContext().getRealPath("/")+"WEB-INF\\views\\");
		String path=sc.getServletContext().getContextPath();
		sc.getServletContext().setAttribute("path", path);
	}
}
