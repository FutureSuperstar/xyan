package com.xyan.admin.service;

import com.xyan.admin.model.PreferenceModel;
import com.xyan.frame.base.service.GenericService;

/**
 *@Description： 配置（需要缓存）--Servcie
 *@Author：wangming
 *@email：18136442251@163.com
 *@Date:2016-06-14 11:02:12
 */
public interface PreferenceService extends GenericService<PreferenceModel, Long>{
	
	public String selectValue(String name,String kind);
}
