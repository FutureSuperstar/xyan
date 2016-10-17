package com.xyan.frame.feature.log.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xyan.frame.base.dao.GenericDao;
import com.xyan.frame.base.service.impl.GenericServiceImpl;
import com.xyan.frame.feature.log.dao.LogDao;
import com.xyan.frame.feature.log.model.LogModel;
import com.xyan.frame.feature.log.service.LogService;

/**
 *@Description：日志 -- Servcie实现类
 *@Author：wangming
 *@Date:2016-04-14 17:18:14
 */
@Service
@Transactional
public class LogServiceImpl extends GenericServiceImpl<LogModel, Long> implements LogService{

 	
	@Autowired
	private LogDao  logService;//日志
	
	
	@Override
	public GenericDao<LogModel, Long> getDao() {
		return  logService;
	}


	@Override
	public List<LogModel> selectModelByExample(LogModel model) {
		return null;
	}
}
