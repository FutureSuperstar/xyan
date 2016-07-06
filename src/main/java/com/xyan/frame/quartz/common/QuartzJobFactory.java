package com.xyan.frame.quartz.common;

import java.util.Date;

import org.apache.log4j.Logger;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.xyan.frame.feature.log.model.LogModel;
import com.xyan.frame.feature.log.service.LogService;
import com.xyan.frame.feature.log.service.impl.LogServiceImpl;
import com.xyan.frame.grab.GrabService;
import com.xyan.frame.grab.model.PageModel;
import com.xyan.frame.grab.service.PageService;
import com.xyan.frame.grab.service.impl.PageServiceImpl;
import com.xyan.frame.quartz.model.ScheduleJobModel;
import com.xyan.frame.util.SpringUtil;

public class QuartzJobFactory implements Job {
	private static PageService pageService= SpringUtil.getBean(PageServiceImpl.class);
	private static LogService logService= SpringUtil.getBean(LogServiceImpl.class);
	private static Logger logger=Logger.getLogger(QuartzJobFactory.class);
    @Override
    public void execute(JobExecutionContext context) throws JobExecutionException {
    	System.out.println();
        ScheduleJobModel scheduleJob = (ScheduleJobModel)context.getMergedJobDataMap().get("scheduleJob");
        System.out.println("任务成功运行\t任务名称 = [" + scheduleJob.getJobName() + "]");
        System.out.println();
        try {
        	PageModel pageModel=GrabService.grab(scheduleJob.getRemark());
        	pageService.insert(pageModel);
		} catch (Exception e) {
			logger.error("发生异常了，异常信息是：",e);
			logService.insert(new LogModel(new Date(),e.getMessage()));
		}
    }
}