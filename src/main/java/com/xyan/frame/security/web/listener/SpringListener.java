package com.xyan.frame.security.web.listener;

import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationListener;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

import com.xyan.common.cache.Cache;

@Component
@Lazy(value=false)
public class SpringListener implements ApplicationListener<ContextRefreshedEvent>{
	
	public SpringListener() {
		System.out.println("spring创建对象");
	}

	@Override
	public void onApplicationEvent(ContextRefreshedEvent event) {
		System.out.println("spring启动成功。。。");
		ApplicationContext applicationContext=event.getApplicationContext();
		if(applicationContext instanceof WebApplicationContext){
			WebApplicationContext webApplicationContext=(WebApplicationContext)applicationContext;
			System.out.println("当前是web环境");
			webApplicationContext.getServletContext().setAttribute("articleTypeList",Cache.articleTypeCache);
		}
	}
	
}