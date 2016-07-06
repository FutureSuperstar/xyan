package com.xyan.frame.security.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xyan.frame.base.dao.GenericDao;
import com.xyan.frame.base.service.impl.GenericServiceImpl;
import com.xyan.frame.security.dao.RoleDao;
import com.xyan.frame.security.model.RoleModel;
import com.xyan.frame.security.model.UserModel;
import com.xyan.frame.security.service.RoleService;

@Service
public class RoleServiceImpl extends GenericServiceImpl<RoleModel, Long> implements RoleService{

	@Autowired
	private RoleDao roleDao;
	
	@Override
	public GenericDao<RoleModel, Long> getDao() {
		return roleDao;
	}

	@Override
	public List<RoleModel> getUserRoles(UserModel user) {
		return roleDao.getUserRoles(user);
	}

}
