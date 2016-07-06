package com.xyan.frame.grab.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xyan.frame.base.dao.GenericDao;
import com.xyan.frame.base.service.impl.GenericServiceImpl;
import com.xyan.frame.grab.dao.HeadDao;
import com.xyan.frame.grab.model.HeadModel;
import com.xyan.frame.grab.service.HeadService;

/**
 *@Description： -- Servcie实现类
 *@Author：wangming
 *@Date:2016-04-14 15:45:43
 */
@Service
@Transactional
public class HeadServiceImpl extends GenericServiceImpl<HeadModel, Long> implements HeadService{

 	
	@Autowired
	private HeadDao  headService;//
	
	
	@Override
	public GenericDao<HeadModel, Long> getDao() {
		return  headService;
	}
}
