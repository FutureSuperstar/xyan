package com.xyan.blog.dao;

import com.xyan.blog.model.StatementModel;
import com.xyan.frame.base.dao.GenericDao;
import com.xyan.frame.feature.mybatis.annotation.MyBatisRepository;

/**
 * @description 闲言碎语 --dao层接口
 * @author wangming
 * @email：w18855525068@163.com
 * @Date:2016-06-16 15:07:58
 */
@MyBatisRepository
public interface StatementDao extends GenericDao<StatementModel, Long> {
	
 }