package com.xyan.frame.quartz.common;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

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
import org.springframework.scheduling.quartz.SchedulerFactoryBean;

import com.xyan.frame.quartz.model.ScheduleJobModel;
import com.xyan.frame.util.SpringUtil;

/**
 * @author wangming
 */
public class JobUtils {

	private static org.springframework.scheduling.quartz.SchedulerFactoryBean schedulerFactoryBean= SpringUtil.getBean(SchedulerFactoryBean.class);

	/**
	 * 添加任务并立即执行
	 * @param jobList
	 * @throws SchedulerException
	 */
	public static void addJob(List<ScheduleJobModel> jobList) throws SchedulerException {
		// schedulerFactoryBean 由spring创建注入
		Scheduler scheduler = schedulerFactoryBean.getScheduler();
		for (ScheduleJobModel job : jobList) {
			TriggerKey triggerKey = TriggerKey.triggerKey(job.getJobName(), job.getJobGroup());
			// 获取trigger，即在spring配置文件中定义的 bean id="myTrigger"
			CronTrigger trigger = (CronTrigger) scheduler.getTrigger(triggerKey);
			// 不存在，创建一个
			if (null == trigger) {
				JobDetail jobDetail = JobBuilder.newJob(QuartzJobFactory.class).withIdentity(job.getJobName(),job.getJobGroup()).build();
				jobDetail.getJobDataMap().put("scheduleJob", job);
				// 表达式调度构建器
				CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(job.getCronExpression());
				// 按新的cronExpression表达式构建一个新的trigger
				trigger = TriggerBuilder.newTrigger().withIdentity(job.getJobName(), job.getJobGroup()).withSchedule(scheduleBuilder).build();
				scheduler.scheduleJob(jobDetail, trigger);
			} else {
				// Trigger已存在，那么更新相应的定时设置
				// 表达式调度构建器
				CronScheduleBuilder scheduleBuilder = CronScheduleBuilder .cronSchedule(job.getCronExpression());
				// 按新的cronExpression表达式重新构建trigger
				trigger = trigger.getTriggerBuilder().withIdentity(triggerKey) .withSchedule(scheduleBuilder).build();
				// 按新的trigger重新设置job执行
				scheduler.rescheduleJob(triggerKey, trigger);
			}
		}
	}

	
	
	
	/**
	 *@Auhor:wangming
	 *@Description:获取计划中的任务
	 *@return
	 *@throws SchedulerException
	 *@Date:2016年3月30日 下午3:11:56
	 */
	public static List<ScheduleJobModel> getPlanTask() throws SchedulerException {
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
				job.setRemark("触发器:" + trigger.getKey());
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

	
	/**
	 *@Auhor:wangming
	 *@Description:获取运行中的任务
	 *@throws SchedulerException
	 *@Date:2016年3月30日 下午3:13:10
	 */
	public static void getRunningTask() throws SchedulerException {

		Scheduler scheduler = schedulerFactoryBean.getScheduler();
		List<JobExecutionContext> executingJobs = scheduler
				.getCurrentlyExecutingJobs();
		List<ScheduleJobModel> jobList = new ArrayList<ScheduleJobModel>(
				executingJobs.size());
		for (JobExecutionContext executingJob : executingJobs) {
			ScheduleJobModel job = new ScheduleJobModel();
			JobDetail jobDetail = executingJob.getJobDetail();
			JobKey jobKey = jobDetail.getKey();
			Trigger trigger = executingJob.getTrigger();
			job.setJobName(jobKey.getName());
			job.setJobGroup(jobKey.getGroup());
			job.setRemark("触发器:" + trigger.getKey());
			Trigger.TriggerState triggerState = scheduler
					.getTriggerState(trigger.getKey());
			job.setJobStatus(triggerState.name());
			if (trigger instanceof CronTrigger) {
				CronTrigger cronTrigger = (CronTrigger) trigger;
				String cronExpression = cronTrigger.getCronExpression();
				job.setCronExpression(cronExpression);
			}
			jobList.add(job);
		}
	}

	
	/**
	 *@Auhor:wangming
	 *@Description:暂停一个任务
	 *@param scheduleJob
	 *@throws SchedulerException
	 *@Date:2016年3月30日 下午3:13:48
	 */
	public static void pauseJob(ScheduleJobModel scheduleJob)
			throws SchedulerException {
		Scheduler scheduler = schedulerFactoryBean.getScheduler();
		JobKey jobKey = JobKey.jobKey(scheduleJob.getJobName(),
				scheduleJob.getJobGroup());
		scheduler.pauseJob(jobKey);

	}

	/**
	 *@Auhor:wangming
	 *@Description:恢复一个任务
	 *@param scheduleJob
	 *@throws SchedulerException
	 *@Date:2016年3月30日 下午3:14:02
	 */
	public static void resume(ScheduleJobModel scheduleJob)
			throws SchedulerException {
		Scheduler scheduler = schedulerFactoryBean.getScheduler();
		JobKey jobKey = JobKey.jobKey(scheduleJob.getJobName(),
				scheduleJob.getJobGroup());
		scheduler.resumeJob(jobKey);
	}


	/**
	 *@Auhor:wangming
	 *@Description:删除一个任务
	 *@param scheduleJob
	 *@throws SchedulerException
	 *@Date:2016年3月30日 下午3:14:21
	 */
	public static void delete(ScheduleJobModel scheduleJob)
			throws SchedulerException {
		Scheduler scheduler = schedulerFactoryBean.getScheduler();
		JobKey jobKey = JobKey.jobKey(scheduleJob.getJobName(),
				scheduleJob.getJobGroup());
		scheduler.deleteJob(jobKey);
	}


	/**
	 *@Auhor:wangming
	 *@Description:(用一句话描述)
	 *@param scheduleJob
	 *@throws SchedulerException
	 *@Date:2016年3月30日 下午3:14:38
	 */
	public static void noWaitRun(ScheduleJobModel scheduleJob)
			throws SchedulerException {
		Scheduler scheduler = schedulerFactoryBean.getScheduler();
		JobKey jobKey = JobKey.jobKey(scheduleJob.getJobName(),
				scheduleJob.getJobGroup());
		scheduler.triggerJob(jobKey);
	}

	/**
	 *@Auhor:wangming
	 *@Description:更新一个任务
	 *@param scheduleJob
	 *@throws SchedulerException
	 *@Date:2016年3月30日 下午3:15:37
	 */
	public static void update(ScheduleJobModel scheduleJob)
			throws SchedulerException {
		Scheduler scheduler = schedulerFactoryBean.getScheduler();
		TriggerKey triggerKey = TriggerKey.triggerKey(scheduleJob.getJobName(),
				scheduleJob.getJobGroup());
		// 获取trigger，即在spring配置文件中定义的 bean id="myTrigger"
		CronTrigger trigger = (CronTrigger) scheduler.getTrigger(triggerKey);
		// 表达式调度构建器
		CronScheduleBuilder scheduleBuilder = CronScheduleBuilder
				.cronSchedule(scheduleJob.getCronExpression());
		// 按新的cronExpression表达式重新构建trigger
		trigger = trigger.getTriggerBuilder().withIdentity(triggerKey)
				.withSchedule(scheduleBuilder).build();
		// 按新的trigger重新设置job执行
		scheduler.rescheduleJob(triggerKey, trigger);
	}
}
