package com.xyan.common.cache;

import java.util.List;

import org.apache.log4j.Logger;

import com.xyan.blog.model.ArticleTypeModel;
import com.xyan.blog.service.impl.ArticleTypeServiceImpl;
import com.xyan.common.enums.ArticleType;
import com.xyan.frame.util.SpringUtil;

public class Cache {

	public static List<ArticleTypeModel> articleTypeCache=null;
	private static Logger logger=Logger.getLogger(Cache.class);
	
	static{
		initArticleTypeCache();
	}
	
	public static void initArticleTypeCache(){
		ArticleTypeServiceImpl typeService=SpringUtil.getBean(ArticleTypeServiceImpl.class);
		ArticleTypeModel example=new ArticleTypeModel();
		example.setpId(ArticleType.TYPE_TECHNOLOGY.getCode());
		articleTypeCache=typeService.selectByExample(example);
		logger.info("初始化分类完成。。。");
	}
}
