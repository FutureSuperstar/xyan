package com.xyan.frame.util;

import org.springframework.context.support.ClassPathXmlApplicationContext;

/***/
public final class SpringBeanUtil {
	
	@SuppressWarnings("resource")
	public static Object getBean(String name){
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		return context.getBean(name);
	}
	
	@SuppressWarnings("resource")
	public <T> T getBean(Class<T> clazz) {
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		return context.getBean(clazz);
	}
}
