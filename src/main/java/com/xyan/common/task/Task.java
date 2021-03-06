package com.xyan.common.task;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map.Entry;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import com.xyan.admin.model.MailModel;
import com.xyan.admin.service.MailService;
import com.xyan.blog.model.DictModel;
import com.xyan.blog.service.DictService;
import com.xyan.common.enums.DictType;
import com.xyan.frame.security.Cache;
import com.xyan.frame.util.DateUtil;
import com.xyan.frame.util.MailUtil;
import com.xyan.frame.util.SpringUtil;

@Component
public class Task {
	
	private static Logger logger=Logger.getLogger(Task.class);
	@Autowired
	private DictService dictService;
	@Autowired
	private MailService mailService;
	
	
	private MailModel mailModel;
	
	public Task() {
		mailModel=new MailModel();
		mailModel.setState("00");
	}
	
	
	@Scheduled(cron = "${scheduled.mailSend}")
	public void mailSend(){
		logger.info("检查邮件start。。。");
		List<MailModel> dbList=mailService.selectModelByExample(mailModel);
		for (MailModel mailModel : dbList) {
			MailUtil.send(mailModel);
			mailModel.setState("10");
		}
		mailService.updateModels(dbList);
		logger.info("检查邮件end。。。");
	}
	
	/**
	 * @Author:wangming
	 * @Description 清理拦截访问
	 * @since 2016年10月19日上午11:13:29
	 */
	@Scheduled(cron = "${scheduled.blogClear}")
	public void blogClear(){
		logger.info("清理拦截start。。。");
		HashMap<String, Date> cache=new HashMap<>();
		for (Entry<String, Date> entry: Cache.getCache().entrySet()) {
			if(DateUtil.getDiff(new Date(), entry.getValue())<30000){
				cache.put(entry.getKey(), entry.getValue());
			}
		}
		if(cache.size()>0){
			Cache.reset(cache);
		}
		logger.info("清理拦截end。。。"+cache.size());
		cache=null;
	}
	
	@Scheduled(cron = "${scheduled.articleType}")
	public void articleType(){
		logger.info("检查更新博客分类start。。。");
		DictModel example=new DictModel();
		Calendar now=Calendar.getInstance(Locale.CHINA);
		example.setType(DictType.DICT_GD.getCode());
		int month=now.get(Calendar.MONTH)+1;
		example.setName(now.get(Calendar.YEAR)+""+(month<10?("0"+month):(month+"")));
		example.setRemark(now.get(Calendar.YEAR)+"年"+numToMonth(now.get(Calendar.MONTH))+"月");
		//生成博客分类
		List<DictModel> typeList=dictService.selectModelByExample(example);
		if(CollectionUtils.isEmpty(typeList)){
			logger.info("更新博客分类");
			dictService.insert(example);
			DictModel model=new DictModel();
			model.setType(DictType.DICT_GD.getCode());
			List<DictModel> dictList=dictService.selectModelByExample(model);
			SpringUtil.getWebApplicationContext().getServletContext().setAttribute("gdList", dictList);
		}
		logger.info("检查更新博客分类end。。。");
	}
	
	private String numToMonth(int num){
		String result="";
		switch (num) {
			case 0:
				result="一";
				break;
			case 1:
				result="二";
				break;
			case 2:
				result="三";
				break;
			case 3:
				result="四";
				break;
			case 4:
				result="五";
				break;
			case 5:
				result="六";
				break;
			case 6:
				result="七";
				break;
			case 7:
				result="八";
				break;
			case 8:
				result="九";
				break;
			case 9:
				result="十";
				break;
			case 10:
				result="十一";
				break;
			case 11:
				result="十二";
				break;

		}
		return result;
	}
	
	public static void main(String[] args) {
		System.out.println(Calendar.getInstance().get(Calendar.MONTH));
	}
}
