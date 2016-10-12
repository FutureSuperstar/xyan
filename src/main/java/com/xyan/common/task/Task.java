package com.xyan.common.task;

import java.util.Calendar;
import java.util.List;
import java.util.Locale;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import com.xyan.blog.model.ArticleTypeModel;
import com.xyan.blog.service.ArticleTypeService;

@Component
public class Task {
	
	private static Logger logger=Logger.getLogger(Task.class);
	@Autowired
	private ArticleTypeService typeService;
	
	@Scheduled(cron = "${scheduled.articleType}")
	public void articleType(){
		logger.info("检查更新博客分类start。。。");
		ArticleTypeModel example=new ArticleTypeModel();
		Calendar now=Calendar.getInstance(Locale.CHINA);
		example.setName(now.get(Calendar.YEAR)+"年"+numToMonth(now.get(Calendar.MONTH))+"月");
		//生成博客分类
		List<ArticleTypeModel> typeList=typeService.selectByExample(example);
		if(CollectionUtils.isEmpty(typeList)){
			logger.info("更新博客分类");
			example.setpId(-1L);
			example.setHidden(false);
			example.setHalfCheck(false);
			example.setIsParent(false);
			example.setOpen(true);
			typeService.insert(example);
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
