package com.xyan.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import com.xyan.admin.dao.MailDao;
import com.xyan.admin.model.MailModel;
import com.xyan.admin.service.MailService;
import com.xyan.frame.base.dao.GenericDao;
import com.xyan.frame.base.service.impl.GenericServiceImpl;

/**
 *@Description：邮件 -- Servcie实现类
 *@Author：wangming
 *@email：18136442251@163.com
 *@Date:2016-06-14 11:02:12
 */
@Service
@Transactional
public class MailServiceImpl extends GenericServiceImpl<MailModel, Long> implements MailService{
	
	@Autowired
	private MailDao  mailDao;//邮件
	
	@Override
	public GenericDao<MailModel, Long> getDao() {
		return mailDao;
	}

	@Override
	public int updateModels(List<MailModel> list) {
		if(CollectionUtils.isEmpty(list)){
			return 0;
		}
		return mailDao.updateModels(list);
	}
}
