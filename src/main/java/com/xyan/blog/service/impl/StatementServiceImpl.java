package com.xyan.blog.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xyan.blog.dao.StatementDao;
import com.xyan.blog.model.StatementModel;
import com.xyan.blog.service.StatementService;
import com.xyan.frame.base.dao.GenericDao;
import com.xyan.frame.base.service.impl.GenericServiceImpl;

/**
 *@Description：闲言碎语 -- Servcie实现类
 *@Author：wangming
 *@email：18136442251@163.com
 *@Date:2016-06-16 15:07:58
 */
@Service
@Transactional
public class StatementServiceImpl extends GenericServiceImpl<StatementModel, Long> implements StatementService{
	
	@Autowired
	private StatementDao statementDao;
	
	@Override
	public GenericDao<StatementModel, Long> getDao() {
		return statementDao;
	}

}
