package com.xyan.frame.security.model;

import com.xyan.frame.base.model.BaseModel;

/**
 * @Description 角色
 * @author wangming
 * @since 2016年3月5日 下午5:37:40
 */
public class RoleModel extends BaseModel {
	
	private Long pId;//父级角色
	private String roleName;//资源名称
	private int level;//层级
	
	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}
	public RoleModel() {
		
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public Long getpId() {
		return pId;
	}
	public void setpId(Long pId) {
		if(pId==null){
			pId=0L;
		}
		this.pId = pId;
	}
	
}
