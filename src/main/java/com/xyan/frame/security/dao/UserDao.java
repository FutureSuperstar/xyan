package com.xyan.frame.security.dao;

import com.xyan.frame.base.dao.GenericDao;
import com.xyan.frame.feature.mybatis.annotation.MyBatisRepository;
import com.xyan.frame.security.model.UserModel;

@MyBatisRepository
public interface UserDao extends GenericDao<UserModel, Long>{
	
}
