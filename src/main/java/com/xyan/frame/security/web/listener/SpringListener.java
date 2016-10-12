package com.xyan.frame.security.web.listener;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationListener;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

@Component
@Lazy(value=false)
public class SpringListener implements ApplicationListener<ContextRefreshedEvent>{
	private static Logger logger=Logger.getLogger(SpringListener.class);
	
	public SpringListener() {
		logger.info("spring创建对象");
	}

	@Override
	public void onApplicationEvent(ContextRefreshedEvent event) {
		logger.info("spring启动成功。。。");
		ApplicationContext applicationContext=event.getApplicationContext();
		if(applicationContext instanceof WebApplicationContext){
			logger.info("当前是web环境");
		}
	}
	
}