package com.xyan.frame.feature.log.dao;

import com.xyan.frame.feature.log.model.LogModel;
import com.xyan.frame.feature.mybatis.annotation.MyBatisRepository;

/**
 * @description  日志--dao层接口
 * @author wangming
 * @Date:2016-04-14 17:18:14
 */
@MyBatisRepository
public interface LogDao{
	 /**
     * 插入单个对象
     * @param model 对象
     */
    int insert(LogModel model);
  
	
}