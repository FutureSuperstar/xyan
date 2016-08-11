package com.xyan.frame.security.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xyan.frame.base.dao.GenericDao;
import com.xyan.frame.base.service.impl.GenericServiceImpl;
import com.xyan.frame.base.web.ResponseModel;
import com.xyan.frame.feature.web.constant.Constant;
import com.xyan.frame.lang.date.DateUtil;
import com.xyan.frame.security.SecureUtil;
import com.xyan.frame.security.dao.UserDao;
import com.xyan.frame.security.model.UserModel;
import com.xyan.frame.security.service.UserService;
import com.xyan.frame.security.web.util.SessionUtil;

@Service
public class UserServiceImpl extends GenericServiceImpl<UserModel, Long> implements UserService{
	
	public static void main(String[] args) {
		System.out.println(SecureUtil.md5(SecureUtil.md5("123456").toLowerCase()+"123456"));
	}

	@Autowired
	private UserDao userDao;
	
	@Override
	public GenericDao<UserModel, Long> getDao() {
		return userDao;
	}

	@Override
	public UserModel getUser(String loginName) {
		UserModel model=new UserModel();
		model.setLoginName(loginName);
		List<UserModel> list=userDao.selectByExample(model);
		if(list==null||list.size()<1){
			return null;
		}
		return list.get(0);
	}

	@Override
	public ResponseModel login(UserModel user) {
		UserModel queryUser=new UserModel();
		queryUser.setLoginName(user.getLoginName());
		List<UserModel> userList=userDao.selectByExample(queryUser);
		if(userList==null||userList.size()!=1){
			return new ResponseModel(false,"用户名错误");
		}
		UserModel userModel=userList.get(0);
		//如果锁住超过三次且锁住时间在半小时以内，则返回
		if(userModel.getLockTime()>3&&DateUtil.getBetween(userModel.getLockDate())<1800){
			return new ResponseModel(false,"密码错误次数过度，账户锁住半小时");
		}
		String pass=SecureUtil.md5(user.getPassword().toLowerCase()+userModel.getSalt());
		if(userModel.getPassword().equals(pass)){
			//登陆成功，并清除用户锁
			userModel.setLockTime(0);
			userDao.update(userModel);
			//加入session，做登陆相关的事情
			userModel.setPassword("");
			SessionUtil.getSession().setAttribute(Constant.lOGIN_USER, userModel);
			return new ResponseModel(true,true);
		}else{
			//更新锁
			userModel.setLockTime(userModel.getLockTime()+1);
			if(userModel.getLockTime()>3){
				userModel.setLockDate(new Date());
			}
			userDao.update(userModel);
			return new ResponseModel(false,"密码错误");
		}
	}

}
