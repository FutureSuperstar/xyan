package com.xyan.frame.security.service;

import com.xyan.frame.base.service.GenericService;
import com.xyan.frame.base.web.ResponseModel;
import com.xyan.frame.security.model.UserModel;

public interface UserService extends GenericService<UserModel, Long>{

	UserModel getUser(String username);

	ResponseModel login(UserModel user);

}
