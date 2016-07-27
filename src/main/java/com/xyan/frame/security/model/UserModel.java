package com.xyan.frame.security.model;

import java.util.Date;

import com.xyan.frame.base.model.BaseModel;

/**
 * @Description  用户
 * @author wangming
 * @since 2016年3月5日 下午5:39:24
 */
public class UserModel extends BaseModel {
	
	private String loginName;//登陆名
	private String userName;//用户名
	private String password;//密码（二次加密的）
	private String salt;//盐值
	private String email;//email邮箱
	private String mobile;//手机号
	private Integer lockTime;//锁的次数，三次即锁住半小时
	private Date lockDate;//锁住日期
	
	
	public UserModel() {
		
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public Integer getLockTime() {
		return lockTime;
	}
	public void setLockTime(Integer lockTime) {
		this.lockTime = lockTime;
	}
	public Date getLockDate() {
		return lockDate;
	}
	public void setLockDate(Date lockDate) {
		this.lockDate = lockDate;
	}
}
