package com.xyan.blog.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xyan.blog.dao.MessageDao;
import com.xyan.blog.model.MessageModel;
import com.xyan.blog.service.MessageService;
import com.xyan.frame.base.dao.GenericDao;
import com.xyan.frame.base.service.impl.GenericServiceImpl;

/**
 *@Description：文章（博客） -- Servcie实现类
 *@Author：wangming
 *@Date:2016-05-16 10:32:51
 */
@Service
@Transactional
public class MessageServiceImpl extends GenericServiceImpl<MessageModel, Long> implements MessageService{

 	
	@Autowired
	private MessageDao  messageDao;//文章（博客）
	
	
	@Override
	public GenericDao<MessageModel, Long> getDao() {
		return  messageDao;
	}
}
