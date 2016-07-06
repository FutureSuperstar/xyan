/*package com.xyan.frame.security.shiro;

import java.util.List;

import org.apache.commons.lang.builder.ReflectionToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import com.xyan.frame.feature.web.exception.XyanException;
import com.xyan.frame.security.model.RoleModel;
import com.xyan.frame.security.model.UserModel;
import com.xyan.frame.security.service.ResourceService;
import com.xyan.frame.security.service.RoleService;
import com.xyan.frame.security.service.UserService;
import com.xyan.frame.security.web.util.SessionUtil;
import com.xyan.frame.util.CommonUtil;

*//**
 * 自定义的指定Shiro验证用户登录的类
 *//*
public class MyRealm extends AuthorizingRealm {
	private Logger logger = Logger.getLogger(MyRealm.class);

	@Autowired
	protected UserService userService;
	@Autowired
	protected RoleService roleService;
	@Autowired
	private ResourceService resourceService;

	*//**
	 * 为当前登录的Subject授予角色和权限
	 *//*
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		
		 * 0.检查用户是否登录
		 
		if (!SecurityUtils.getSubject().isAuthenticated()) {
			logger.info("用户未登录或者用户登录超时");
			doClearCache(principals);
			SecurityUtils.getSubject().logout();
			return null;
		}
		
		 * 1.获取用户登录信息
		 
		UserModel user = (UserModel) SessionUtil.getSessionUser();
		if (user == null) {
			logger.info("登录用户信息丢失");
			doClearCache(principals);
			SecurityUtils.getSubject().logout();
			return null;
		}

		
		 * 2.获取登录用户角色
		 
		List<RoleModel> roles = roleService.getUserRoles(user);
		if (CommonUtil.isEmpty(roles))
			return null;

		
		 * 3.加载当前登录用户角色关联权限
		 
		List<String> permissionList = resourceService.queryRoleResource(roles);

		
		 * 4.将权限放置于sesson中
		 
		SimpleAuthorizationInfo simpleAuthorInfo = new SimpleAuthorizationInfo();
		simpleAuthorInfo.addStringPermissions(permissionList);
		return simpleAuthorInfo;
	}

	*//**
	 * 验证当前登录的Subject
	 * @see 经测试:本例中该方法的调用时机为LoginController.login()方法中执行Subject.login()时
	 *//*
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken authcToken) throws AuthenticationException {
		// 获取基于用户名和密码的令牌
		// 实际上这个authcToken是从LoginController里面currentUser.login(token)传过来的
		// 两个token的引用都是一样的,本例中是org.apache.shiro.authc.UsernamePasswordToken@33799a1e
		*//**
		 * 1.获取页面中输入的登录用户名和密码
		 *//*
		UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
		logger.info("验证当前Subject时获取到token为"
				+ ReflectionToStringBuilder.toString(token,
						ToStringStyle.MULTI_LINE_STYLE));
		UserModel user = null;
		try {
			*//**
			 * 2.由页面输入获取数据中用户并且获取角色以及清理用户敏感数据
			 *//*
			user = userService.getUser(token.getUsername());
			if (null != user) {
				logger.warn("user msg in the db....................");
				String password = getAuthorizationPassWord(user);
				AuthenticationInfo authcInfo = new SimpleAuthenticationInfo(
						user, password, getName());
				return authcInfo;
			} else {
				logger.warn("user msg not in the db....................");
				throw new XyanException("没找到该用户");
			}
		} catch (Exception e) {
			logger.error("the db connot connect....................", e);
			if (e instanceof IncorrectCredentialsException){
				try {
					throw new XyanException("用户名或密码不正确");
				} catch (XyanException e1) {
					e1.printStackTrace();
				}
			}else{
				try {
					throw new XyanException("系统异常，请稍后再试");
				} catch (XyanException e1) {
					e1.printStackTrace();
				}
			}
		}
		return null;

	}

	*//**
	 * @Title: getAuthorizationPassWord
	 * @Description: 获取密码，在本平台中，由两个登录入口， 1.为短信登录认证2.为密码登录认证，因此将此方法剥离出来
	 *               且此处该方法为获取密码登录认证的密码，因此直接取出数据库存储密码即可
	 * @param @param user
	 * @param @return 设定文件
	 * @return String 返回类型
	 * @throws
	 *//*
	protected String getAuthorizationPassWord(UserModel user) {
		return user.getPassword();
	}
}
*/