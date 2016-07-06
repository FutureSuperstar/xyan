package com.xyan.frame.security.model;

import com.xyan.frame.base.model.BaseModel;

/**
 * @Description  用户角色
 * @author wangming
 * @since 2016年3月5日 下午5:40:40
 */
public class UserRoleModel extends BaseModel {
	
	private Long userId;//用户ID
	private Long roleId;//角色ID
	public UserRoleModel() {
		
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public Long getRoleId() {
		return roleId;
	}
	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}
	
}
