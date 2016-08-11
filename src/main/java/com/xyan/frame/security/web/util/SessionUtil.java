package com.xyan.frame.security.web.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.xyan.frame.feature.web.constant.Constant;
import com.xyan.frame.security.model.UserModel;


/**
 * @Description  Session工具类
 * @author wangming
 * @since 2016年3月8日 下午12:17:18
 */
public class SessionUtil {
	
	private static ThreadLocal<HttpServletRequest> local=new ThreadLocal<>();
	
	/**
	 * @Author:wangming
	 * @Description：设置request
	 * @param request
	 * @since 2016年8月11日下午9:22:05
	 */
	public static void setRequest(HttpServletRequest request){
		local.set(request);
	}
	
	/**
	 * @Author:wangming
	 * @Description：移除request
	 * @since 2016年8月11日下午9:21:48
	 */
	public static void removeRequest(){
		local.remove();;
	}
	
	 /**
	  * @Author:wangming
	  * @Description:获取当前Session
	  * @param request
	  * @return
	  * @since 2015年12月2日 下午4:10:21
	  */
	public static HttpSession getSession(HttpServletRequest request) {
		return  request.getSession();
	}
	
	
	/**
	 * @Author:wangming
	 * @Description 获取session
	 * @return
	 * @since 2016年7月5日下午5:39:13
	 */
	public static HttpSession getSession() {
		return  local.get().getSession();
	}
	
	
	/**
	 * @Author:wangming
	 * @Description:获取当前登录人
	 * @return
	 * @since 2016年8月11日下午9:21:25
	 */
	public static UserModel getLoginUser(){
		return  (UserModel) local.get().getSession().getAttribute(Constant.lOGIN_USER);
	}
	
	
}
