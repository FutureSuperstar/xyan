package com.xyan.common.cache;

/*
 * 缓存提供获取和移除的功能。
 * 
 * 首先需要初始化缓存，初始化缓存为从数据库中拉取信息。
 * 然后提供了获取缓存的功能，获取缓存需要提供name和kind
 * 移除缓存时也需要提高name和kind
 * 
 * 本系统缓存不支持程序更新，如果有需要要先编写数据库脚本，然后登陆后台管理，再去访问缓存地址（缓存地址不在菜单中提供）
 */
import java.util.HashMap;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.util.CollectionUtils;

import com.xyan.admin.model.PreferenceModel;
import com.xyan.admin.service.PreferenceService;
import com.xyan.frame.util.SpringUtil;

/**
 *@description 缓存
 *@Author：wangming
 *@Date:2016-10-17 10:32:51
 */
public class CacheUtil {

	/**
	 * 缓存核心
	 */
	private static HashMap<String, PreferenceModel> cache;
	
	private static Logger logger=Logger.getLogger(CacheUtil.class);
	
	
	/**
	 * @Author:wangming
	 * @Description 初始化缓存
	 * @since 2016年10月17日下午1:55:29
	 */
	public static void initCache(){
		logger.info("初始化缓存信息。。。");
		PreferenceService preferenceService=(PreferenceService) SpringUtil.getBean("preferenceServiceImpl");
		List<PreferenceModel> initList=preferenceService.selectModelByExample(null);
		if(!CollectionUtils.isEmpty(initList)){
			logger.info("从数据库中读取缓存信息。。。");
			cache=new HashMap<>(initList.size());
			for (PreferenceModel model : initList) {
				cache.put(model.getName()+"."+model.getKind(), model);
			}
		}
	}
	
	/**
	 * @Author:wangming
	 * @Description 获取缓存
	 * @param name
	 * @param kind
	 * @return
	 * @since 2016年10月17日下午1:55:46
	 */
	public static String getCache(String name,String kind){
		return cache.get(name+"."+kind).getValue();
	}
	
	/**
	 * @Author:wangming
	 * @Description 获取全部缓存
	 * @return
	 * @since 2016年10月17日下午1:55:58
	 */
	public static HashMap<String, PreferenceModel> getAllCache(){
		return cache;
	}
	
	/**
	 * @Author:wangming
	 * @Description 移除缓存
	 * @param name
	 * @param kind
	 * @since 2016年10月17日下午1:56:13
	 */
	public static void remove(String name,String kind){
		if(StringUtils.isBlank(kind)||StringUtils.isBlank(name)){
			cache.clear();
		}else{
			cache.remove(name+"."+kind);
		}
	}
}
