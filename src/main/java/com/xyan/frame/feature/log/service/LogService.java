package com.xyan.frame.feature.log.service;

import com.xyan.frame.feature.log.model.LogModel;

/**
 *@Description： 日志--Servcie
 *@Author：wangming
 *@Date:2016-04-14 17:18:14
 */
public interface LogService{
	  /**
     * 插入单个对象
     * @param model 对象
     */
    int insert(LogModel model);

	
}
