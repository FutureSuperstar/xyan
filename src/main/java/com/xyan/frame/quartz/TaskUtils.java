package com.xyan.frame.quartz;
/*package com.xyan.core.quartz;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.quartz.CronScheduleBuilder;
import org.quartz.CronTrigger;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.JobExecutionContext;
import org.quartz.JobKey;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.TriggerKey;
import org.quartz.impl.matchers.GroupMatcher;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;

import com.xyan.api.model.ScheduleJobModel;
import com.xyan.core.util.SpringBeanUtil;
import com.xyan.service.ScheduleJobService;

public class TaskUtils {
	private final static Logger log = LoggerFactory.getLogger(TaskUtils.class);

	public void init() throws Exception {
		// 这里从数据库中获取任务信息数据
		List<ScheduleJobModel> jobList = scheduleJobService.getAll();

		for (ScheduleJobModel job : jobList) {
			addJob(job);
		}
	}

	*//**
	 * 添加任务
	 * 
	 * @param scheduleJob
	 * @throws SchedulerException
	 *//*
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void addJob(ScheduleJobModel job) throws SchedulerException {
		if (job == null || !ScheduleJobModel.STATUS_RUNNING.equals(job.getJobStatus())) {
			return;
		}
		Scheduler scheduler = schedulerFactoryBean.getScheduler();
		log.debug("增加一个定时任务 开始。。。");
		TriggerKey triggerKey = TriggerKey.triggerKey(job.getJobName(), job.getJobGroup());
		CronTrigger trigger = (CronTrigger) scheduler.getTrigger(triggerKey);
		// 不存在，创建一个
		if (null == trigger) {
			Class clazz = ScheduleJobModel.CONCURRENT_IS.equals(job.getIsConcurrent()) ? QuartzJobFactory.class
					: QuartzJobFactoryDisallowConcurrentExecution.class;
			JobDetail jobDetail = JobBuilder.newJob(clazz).withIdentity(job.getJobName(), job.getJobGroup()).build();
			jobDetail.getJobDataMap().put("scheduleJob", job);
			CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(job.getCronExpression());
			trigger = TriggerBuilder.newTrigger().withIdentity(job.getJobName(), job.getJobGroup())
					.withSchedule(scheduleBuilder).build();
			scheduler.scheduleJob(jobDetail, trigger);
		} else {
			// Trigger已存在，那么更新相应的定时设置
			CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(job.getCronExpression());
			// 按新的cronExpression表达式重新构建trigger
			trigger = trigger.getTriggerBuilder().withIdentity(triggerKey).withSchedule(scheduleBuilder).build();
			// 按新的trigger重新设置job执行
			scheduler.rescheduleJob(triggerKey, trigger);
		}
	}

	*//**
	 * 通过反射调用scheduleJob中定义的方法
	 * @param scheduleJob
	 *//*
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static void invokMethod(ScheduleJobModel scheduleJob) {
		Object object = null;
		Class clazz = null;
		// springId不为空先按springId查找bean
		if (StringUtils.isNotBlank(scheduleJob.getSpringId())) {
			object = SpringBeanUtil.getBean(scheduleJob.getSpringId());
		} else if (StringUtils.isNotBlank(scheduleJob.getBeanClass())) {
			try {
				clazz = Class.forName(scheduleJob.getBeanClass());
				object = clazz.newInstance();
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		if (object == null) {
			log.error("任务名称 = [" + scheduleJob.getJobName() + "]---------------未启动成功，请检查是否配置正确！！！");
			return;
		}
		clazz = object.getClass();
		Method method = null;
		try {
			method = clazz.getDeclaredMethod(scheduleJob.getMethodName());
		} catch (NoSuchMethodException e) {
			log.error("任务名称 = [" + scheduleJob.getJobName() + "]---------------未启动成功，方法名设置错误！！！");
		} catch (SecurityException e) {
			e.printStackTrace();
		}
		if (method != null) {
			try {
				method.invoke(object);
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				e.printStackTrace();
			}
		}

	}

	*//**
	 * 获取所有计划中的任务列表
	 * @return
	 * @throws SchedulerException
	 *//*
	public List<ScheduleJobModel> getAllJob() throws SchedulerException {
		Scheduler scheduler = schedulerFactoryBean.getScheduler();
		GroupMatcher<JobKey> matcher = GroupMatcher.anyJobGroup();
		Set<JobKey> jobKeys = scheduler.getJobKeys(matcher);
		List<ScheduleJobModel> jobList = new ArrayList<ScheduleJobModel>();
		for (JobKey jobKey : jobKeys) {
			List<? extends Trigger> triggers = scheduler.getTriggersOfJob(jobKey);
			for (Trigger trigger : triggers) {
				ScheduleJobModel job = new ScheduleJobModel();
				job.setJobName(jobKey.getName());
				job.setJobGroup(jobKey.getGroup());
				job.setDescription("触发器:" + trigger.getKey());
				Trigger.TriggerState triggerState = scheduler.getTriggerState(trigger.getKey());
				job.setJobStatus(triggerState.name());
				if (trigger instanceof CronTrigger) {
					CronTrigger cronTrigger = (CronTrigger) trigger;
					String cronExpression = cronTrigger.getCronExpression();
					job.setCronExpression(cronExpression);
				}
				jobList.add(job);
			}
		}
		return jobList;
	}

	*//**
	 * 所有正在运行的job
	 * @return
	 * @throws SchedulerException
	 *//*
	public List<ScheduleJobModel> getRunningJob() throws SchedulerException {
		Scheduler scheduler = schedulerFactoryBean.getScheduler();
		List<JobExecutionContext> executingJobs = scheduler.getCurrentlyExecutingJobs();
		List<ScheduleJobModel> jobList = new ArrayList<ScheduleJobModel>(executingJobs.size());
		for (JobExecutionContext executingJob : executingJobs) {
			ScheduleJobModel job = new ScheduleJobModel();
			JobDetail jobDetail = executingJob.getJobDetail();
			JobKey jobKey = jobDetail.getKey();
			Trigger trigger = executingJob.getTrigger();
			job.setJobName(jobKey.getName());
			job.setJobGroup(jobKey.getGroup());
			job.setDescription("触发器:" + trigger.getKey());
			Trigger.TriggerState triggerState = scheduler.getTriggerState(trigger.getKey());
			job.setJobStatus(triggerState.name());
			if (trigger instanceof CronTrigger) {
				CronTrigger cronTrigger = (CronTrigger) trigger;
				String cronExpression = cronTrigger.getCronExpression();
				job.setCronExpression(cronExpression);
			}
			jobList.add(job);
		}
		return jobList;
	}

	*//**
	 * 暂停一个job
	 * @param scheduleJob
	 * @throws SchedulerException
	 *//*
	public void pauseJob(ScheduleJobModel scheduleJob) throws SchedulerException {
		Scheduler scheduler = schedulerFactoryBean.getScheduler();
		JobKey jobKey = JobKey.jobKey(scheduleJob.getJobName(), scheduleJob.getJobGroup());
		scheduler.pauseJob(jobKey);
	}

	*//**
	 * 恢复一个job
	 * @param scheduleJob
	 * @throws SchedulerException
	 *//*
	public void resumeJob(ScheduleJobModel scheduleJob) throws SchedulerException {
		Scheduler scheduler = schedulerFactoryBean.getScheduler();
		JobKey jobKey = JobKey.jobKey(scheduleJob.getJobName(), scheduleJob.getJobGroup());
		scheduler.resumeJob(jobKey);
	}

	*//**
	 * 删除一个job
	 * @param scheduleJob
	 * @throws SchedulerException
	 *//*
	public void deleteJob(ScheduleJobModel scheduleJob) throws SchedulerException {
		Scheduler scheduler = schedulerFactoryBean.getScheduler();
		JobKey jobKey = JobKey.jobKey(scheduleJob.getJobName(), scheduleJob.getJobGroup());
		scheduler.deleteJob(jobKey);

	}

	*//**
	 * 立即执行job
	 * @param scheduleJob
	 * @throws SchedulerException
	 *//*
	public void runAJobNow(ScheduleJobModel scheduleJob) throws SchedulerException {
		Scheduler scheduler = schedulerFactoryBean.getScheduler();
		JobKey jobKey = JobKey.jobKey(scheduleJob.getJobName(), scheduleJob.getJobGroup());
		scheduler.triggerJob(jobKey);
	}

	*//**
	 * 更新job时间表达式
	 * @param scheduleJob
	 * @throws SchedulerException
	 *//*
	public void updateJobCron(ScheduleJobModel scheduleJob) throws SchedulerException {
		Scheduler scheduler = schedulerFactoryBean.getScheduler();
		TriggerKey triggerKey = TriggerKey.triggerKey(scheduleJob.getJobName(), scheduleJob.getJobGroup());
		CronTrigger trigger = (CronTrigger) scheduler.getTrigger(triggerKey);
		CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(scheduleJob.getCronExpression());
		trigger = trigger.getTriggerBuilder().withIdentity(triggerKey).withSchedule(scheduleBuilder).build();
		scheduler.rescheduleJob(triggerKey, trigger);
	}

	@Autowired
	private SchedulerFactoryBean schedulerFactoryBean;

	@Autowired
	private ScheduleJobService scheduleJobService;
}
*/