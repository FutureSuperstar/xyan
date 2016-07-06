package com.xyan.frame.feature.log.dao;

import com.xyan.frame.base.dao.GenericDao;
import com.xyan.frame.feature.log.model.LogModel;
import com.xyan.frame.feature.mybatis.annotation.MyBatisRepository;

/**
 * @description  日志--dao层接口
 * @author wangming
 * @Date:2016-04-14 17:18:14
 */
@MyBatisRepository
public interface LogDao extends GenericDao<LogModel, Long>{

	
}