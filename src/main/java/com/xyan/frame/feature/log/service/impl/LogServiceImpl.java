package com.xyan.frame.feature.log.service.impl;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
public class LogServiceImpl implements LogService{

 	
	@Autowired
	private LogDao  logDao;//日志

	@Override
	public int insert(LogModel model) {
		model.setId(UUID.randomUUID().toString());
		return logDao.insert(model);
	}
	
	
}
