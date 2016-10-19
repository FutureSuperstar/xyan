package com.xyan.blog.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xyan.admin.model.MailModel;
import com.xyan.admin.service.MailService;
import com.xyan.admin.service.PreferenceService;
import com.xyan.blog.dao.MessageDao;
import com.xyan.blog.model.MessageModel;
import com.xyan.blog.service.MessageService;
import com.xyan.blog.vo.MessageVO;
import com.xyan.common.cache.CacheUtil;
import com.xyan.common.enums.PreferenceType;
import com.xyan.frame.base.dao.GenericDao;
import com.xyan.frame.base.service.impl.GenericServiceImpl;
import com.xyan.frame.feature.web.exception.XyanException;
import com.xyan.frame.security.model.UserModel;
import com.xyan.frame.security.web.util.SessionUtil;

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
	
	@Autowired
	private MailService mailService;//邮件
	
	@Override
	public GenericDao<MessageModel, Long> getDao() {
		return  messageDao;
	}
	
	@Override
	public int insert(MessageModel model) {
		UserModel user=SessionUtil.getLoginUser();
		if(user==null){
			throw new XyanException("尚未登陆！");
		}
		model.setRead("false");
		model.setCreateTime(new Date());
		model.setSource(user.getId());
		if("true".equals(model.getMerge())){
			MailModel mail=new MailModel();
			mail.setContent("您有紧急留言啦<p>"+model.getContent());
			mail.setFromUser("网站");
			mail.setToUser(CacheUtil.getCache("mail", PreferenceType.MAIL.getCode()));
			mail.setState("00");
			mail.setSubject("网站留言");
			mailService.insert(mail);
		}
		return super.insert(model);
	}

	@Override
	public List<MessageVO> selectShowMess() {
		return messageDao.selectShowMess();
	}
}
