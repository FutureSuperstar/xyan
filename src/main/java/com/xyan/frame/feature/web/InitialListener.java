package com.xyan.frame.feature.web;

import java.util.List;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.Logger;
import org.quartz.SchedulerException;

import com.xyan.frame.quartz.common.JobUtils;
import com.xyan.frame.quartz.common.QuartzJobFactory;
import com.xyan.frame.quartz.model.ScheduleJobModel;
import com.xyan.frame.quartz.service.ScheduleJobService;
import com.xyan.frame.quartz.service.impl.ScheduleJobServiceImpl;
import com.xyan.frame.util.SpringUtil;
import com.xyan.frame.util.SystemUtil;

public class InitialListener implements ServletContextListener{

	
	private static Logger logger=Logger.getLogger(QuartzJobFactory.class);
	
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		if("1".equals(SystemUtil.getProperty("startQuartz"))){
			ScheduleJobService jobService= SpringUtil.getBean(ScheduleJobServiceImpl.class);
			ScheduleJobModel queryVo=new ScheduleJobModel();
			queryVo.setJobStatus("1");//启用状态的任务
			List<ScheduleJobModel> jobList=jobService.selectByExample(queryVo);
			try {
				JobUtils.addJob(jobList);
			} catch (SchedulerException e) {
				logger.error("初始化任务失败", e);
			}
		}
		
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		
	}

}
