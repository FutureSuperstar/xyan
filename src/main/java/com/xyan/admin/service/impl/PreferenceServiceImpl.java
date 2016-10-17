package com.xyan.admin.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xyan.admin.dao.PreferenceDao;
import com.xyan.admin.model.PreferenceModel;
import com.xyan.admin.service.PreferenceService;
import com.xyan.frame.base.dao.GenericDao;
import com.xyan.frame.base.service.impl.GenericServiceImpl;

/**
 *@Description：邮件 -- Servcie实现类
 *@Author：wangming
 *@email：18136442251@163.com
 *@Date:2016-06-14 11:02:12
 */
@Service
@Lazy(false)
@Transactional
public class PreferenceServiceImpl extends GenericServiceImpl<PreferenceModel, Long> implements PreferenceService{
	
	@Autowired
	private PreferenceDao  preferenceDao;//邮件
	
	@Override
	public GenericDao<PreferenceModel, Long> getDao() {
		return preferenceDao;
	}

}
