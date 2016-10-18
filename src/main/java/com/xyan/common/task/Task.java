package com.xyan.common.task;

import java.util.Calendar;
import java.util.List;
import java.util.Locale;

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
import com.xyan.frame.util.MailUtil;
import com.xyan.frame.util.SpringUtil;

@Component
public class Task {
	
	private static Logger logger=Logger.getLogger(Task.class);
	@Autowired
	private DictService dictService;
	@Autowired
	private MailService mailService;
	
	
	@Scheduled(cron = "${scheduled.mailSend}")
	public void mailSend(){
		logger.info("检查邮件start。。。");
		MailModel model=new MailModel();
		model.setState("00");
		List<MailModel> dbList=mailService.selectModelByExample(model);
		for (MailModel mailModel : dbList) {
			MailUtil.send(mailModel);
			mailModel.setState("10");
		}
		mailService.updateModels(dbList);
	}
	
	//@Scheduled(cron = "${scheduled.articleType}")
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
