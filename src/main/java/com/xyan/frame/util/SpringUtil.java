package com.xyan.frame.util;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

/**SpringBean工具类*/
@Component
public final class SpringUtil implements ApplicationContextAware {

	private static ApplicationContext ctx;

	public void setApplicationContext(ApplicationContext applicationcontext) throws BeansException {
		ctx = applicationcontext;
	}

	public static ApplicationContext getApplicationContext(){
		return ctx;
	}
	
	public static WebApplicationContext getWebApplicationContext(){
		if(ctx instanceof WebApplicationContext){
			return (WebApplicationContext)ctx;
		}
		return null;
	}
	
	/**
	 * 通过spring配置文件中配置的bean id取得bean对象
	 * @param id  spring bean ID值
	 * @return spring bean对象
	 */
	public static Object getBean(String id) {
		if (ctx == null) {
			throw new NullPointerException("ApplicationContext is null");
		}
		return ctx.getBean(id);
	}
	
	/***
	 * 通过spring配置文件中配置的bean id取得bean对象
	 * @param name
	 * @param requiredType
	 * @return
	 */
	public static <T> T getBean(String name, Class<T> requiredType){
		if (ctx == null) {
			throw new NullPointerException("ApplicationContext is null");
		}
		return ctx.getBean(name,requiredType);
	}
	/***
	 * 通过spring配置文件中配置的bean id取得bean对象
	 * @param requiredType
	 * @return
	 */
	public static <T> T getBean( Class<T> requiredType){
		if (ctx == null) {
			throw new NullPointerException("ApplicationContext is null");
		}
		return ctx.getBean(requiredType);
	}
}