package com.xyan.site.test.dao;

import java.util.List;

import com.xyan.frame.base.dao.GenericDao;
import com.xyan.frame.feature.mybatis.annotation.MyBatisRepository;
import com.xyan.site.test.model.TestModel;

@MyBatisRepository
public interface TestDao extends GenericDao<TestModel, Long>{
	void insertModels(List<TestModel> testList);
}
