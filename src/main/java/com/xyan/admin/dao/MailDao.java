package com.xyan.admin.dao;

import java.util.List;

import com.xyan.admin.model.MailModel;
import com.xyan.frame.base.dao.GenericDao;
import com.xyan.frame.feature.mybatis.annotation.MyBatisRepository;

/**
 * @description  邮件--dao层接口
 * @author wangming
 * @email：18136442251@163.com
 * @Date:2016-06-14 11:02:12
 */
@MyBatisRepository
public interface MailDao extends GenericDao<MailModel, Long>{

	/**
	 * @Author:wangming
	 * @Description: 批量更新
	 * @param list
	 * @return
	 * @since 2016年10月18日上午10:34:30
	 */
	public int updateModels(List list);
	
 }