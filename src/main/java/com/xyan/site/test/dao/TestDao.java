package com.xyan.site.test.dao;

import com.xyan.frame.base.dao.GenericDao;
import com.xyan.frame.feature.mybatis.annotation.MyBatisRepository;
import com.xyan.site.test.model.TestModel;

@MyBatisRepository
public interface TestDao extends GenericDao<TestModel, Long>{

}
