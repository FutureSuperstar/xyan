package com.xyan.frame.quartz;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

/**
 * @author wangming
 * @description 定时任务类
 * @since ctreated at 2015年12月8日 下午1:58:54
 * @update wangming modified at 2015年12月8日 下午1:58:54
 */
@Component("taskJob")
public class TaskJob {
	
	private final Logger log = LoggerFactory.getLogger(TaskJob.class);  
	
	
	public void run(){
		log.warn("本次定时任务执行时间："+new SimpleDateFormat("YYYY年m月d日 H时M分s秒").format(new Date()));
	}
}
