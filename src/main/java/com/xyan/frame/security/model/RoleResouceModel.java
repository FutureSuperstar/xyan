package com.xyan.frame.security.model;

import com.xyan.frame.base.model.BaseModel;

/**
 * @Description  角色资源
 * @author wangming
 * @since 2016年3月5日 下午5:38:50
 */
public class RoleResouceModel extends BaseModel {
	
	private Long resouceId;//资源ID
	private Long roleId;//角色ID
	
	public RoleResouceModel() {
		
	}
	
	public Long getResouceId() {
		return resouceId;
	}
	public void setResouceId(Long resouceId) {
		this.resouceId = resouceId;
	}
	public Long getRoleId() {
		return roleId;
	}
	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}
	
}
