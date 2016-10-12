package com.xyan.admin.service;

import com.xyan.admin.model.MailModel;
import com.xyan.frame.base.service.GenericService;

/**
 *@Description： 邮件--Servcie
 *@Author：wangming
 *@email：18136442251@163.com
 *@Date:2016-06-14 11:02:12
 */
public interface MailService extends GenericService<MailModel, Long>{

	void send();
}
