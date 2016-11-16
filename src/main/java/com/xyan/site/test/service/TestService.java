package com.xyan.site.test.service;

import java.util.List;

import com.xyan.frame.base.service.GenericService;
import com.xyan.site.test.model.TestModel;


/**
 *@Description：测试表 Servcie
 *@Author：wangming
 */
public interface TestService extends GenericService<TestModel, Long>{

	void insertModels(List<TestModel> testList);
}
