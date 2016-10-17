package com.xyan.common.cache;

import java.util.HashMap;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.util.CollectionUtils;

import com.xyan.admin.model.PreferenceModel;
import com.xyan.admin.service.PreferenceService;
import com.xyan.admin.service.impl.PreferenceServiceImpl;
import com.xyan.frame.util.SpringUtil;

public class CacheUtil {

	private static HashMap<String, String> cache;
	
	private static Logger logger=Logger.getLogger(CacheUtil.class);
	
	
	public static void initCache(){
		logger.info("初始化缓存信息。。。");
		PreferenceService preferenceService=SpringUtil.getBean(PreferenceServiceImpl.class);
		List<PreferenceModel> initList=preferenceService.selectModelByExample(null);
		if(!CollectionUtils.isEmpty(initList)){
			logger.info("从数据库中读取缓存信息。。。");
			cache=new HashMap<>(initList.size());
			for (PreferenceModel model : initList) {
				cache.put(model.getName()+"."+model.getKind(), model.getValue());
			}
		}
	}
	
	public static String getCache(String name,String kind){
		return cache.get(name+"."+kind);
	}
	
	public static void remove(String name,String kind){
		if(StringUtils.isBlank(kind)||StringUtils.isBlank(name)){
			cache.clear();
		}else{
			cache.remove(name+"."+kind);
		}
	}
}
