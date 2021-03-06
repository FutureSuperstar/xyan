package com.xyan.admin.dao;

import com.xyan.admin.model.PreferenceModel;
import com.xyan.frame.base.dao.GenericDao;
import com.xyan.frame.feature.mybatis.annotation.MyBatisRepository;

/**
 * @description  邮件--dao层接口
 * @author wangming
 * @email：18136442251@163.com
 * @Date:2016-06-14 11:02:12
 */
@MyBatisRepository
public interface PreferenceDao extends GenericDao<PreferenceModel, Long>{

	
 }