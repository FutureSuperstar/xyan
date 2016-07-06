package com.xyan.site.test.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xyan.frame.base.dao.GenericDao;
import com.xyan.frame.base.service.impl.GenericServiceImpl;
import com.xyan.site.test.dao.TestDao;
import com.xyan.site.test.model.TestModel;
import com.xyan.site.test.service.TestService;
/**
 *@Description：测试表 Servcie实现类
 *@Author：wangming
 */
@Service
@Transactional
public class TestServiceImpl extends GenericServiceImpl<TestModel, Long> implements TestService{
	@Autowired
	private TestDao testDao;

	@Override
	public GenericDao<TestModel, Long> getDao() {
		return testDao;
	}
	
	@Override
	public int insert(TestModel model) {
		
		return super.insert(model);
	}
	
}
