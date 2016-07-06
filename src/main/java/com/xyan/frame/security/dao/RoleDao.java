package com.xyan.frame.security.dao;

import java.util.List;

import com.xyan.frame.base.dao.GenericDao;
import com.xyan.frame.feature.mybatis.annotation.MyBatisRepository;
import com.xyan.frame.security.model.RoleModel;
import com.xyan.frame.security.model.UserModel;

@MyBatisRepository
public interface RoleDao extends GenericDao<RoleModel, Long>{

	 /**
	  * @Author:wangming
	  * @Description:获取当前用户所有的角色
	  * @param user
	  * @return
	  * @since 2015年12月2日 下午4:10:21
	  */
	List<RoleModel> getUserRoles(UserModel user);
}
