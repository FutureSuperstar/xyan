package com.xyan.common.task;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class Tark {
	
	//@Scheduled(cron = "${scheduled.test}")
	public void method1(){
		System.out.println("任务一。。。。。。。");
	}
}
