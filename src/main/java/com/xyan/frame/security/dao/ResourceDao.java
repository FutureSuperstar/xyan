package com.xyan.frame.security.dao;

import java.util.List;

import com.xyan.frame.base.dao.GenericDao;
import com.xyan.frame.feature.mybatis.annotation.MyBatisRepository;
import com.xyan.frame.security.model.ResourceModel;
import com.xyan.frame.security.model.RoleModel;

@MyBatisRepository
public interface ResourceDao extends GenericDao<ResourceModel, Long>{

	 /**
	  * @Author:wangming
	  * @Description:查询用户的所有权限
	  * @param userId
	  * @return
	  * @since 2015年12月2日 下午4:10:21
	  */
	List<ResourceModel> selectUserResource(Long userId);

	 /**
	  * @Author:wangming
	  * @Description:查询指定角色的所有资源
	  * @param roles
	  * @return
	  * @since 2015年12月2日 下午4:10:21
	  */
	List<String> queryRoleResource(List<RoleModel> roles);
	
}
