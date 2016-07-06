package com.xyan.frame.security.service;

import java.util.List;

import com.xyan.frame.base.service.GenericService;
import com.xyan.frame.security.model.RoleModel;
import com.xyan.frame.security.model.UserModel;

public interface RoleService extends GenericService<RoleModel, Long>{

	List<RoleModel> getUserRoles(UserModel user);

}
