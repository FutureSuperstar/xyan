package com.xyan.blog.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xyan.blog.dao.DictDao;
import com.xyan.blog.model.DictModel;
import com.xyan.blog.service.DictService;
import com.xyan.frame.base.dao.GenericDao;
import com.xyan.frame.base.service.impl.GenericServiceImpl;

/**
 *@Description：字典 -- Servcie实现类
 *@Author：wangming
 *@email：18136442251@163.com
 *@Date:2016-06-16 15:07:58
 */
@Service
@Transactional
public class DictServiceImpl extends GenericServiceImpl<DictModel, Long> implements DictService{
	
	@Autowired
	private DictDao dictDao;
	
	@Override
	public GenericDao<DictModel, Long> getDao() {
		return dictDao;
	}

}
