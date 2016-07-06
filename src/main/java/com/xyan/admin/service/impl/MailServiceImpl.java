package com.xyan.admin.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xyan.admin.dao.MailDao;
import com.xyan.admin.model.MailModel;
import com.xyan.admin.service.MailService;
import com.xyan.frame.base.dao.GenericDao;
import com.xyan.frame.base.service.impl.GenericServiceImpl;
import com.xyan.frame.util.MailUtil;

/**
 *@Description：邮件 -- Servcie实现类
 *@Author：wangming
 *@email：w18855525068@163.com
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
	public void send() {
		MailUtil.send("您有新的留言了", "您有新的留言了");
	}

}
