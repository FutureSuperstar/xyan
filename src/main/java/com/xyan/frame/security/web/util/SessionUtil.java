package com.xyan.frame.security.web.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


/**
 * @Description  Session工具类
 * @author wangming
 * @since 2016年3月8日 下午12:17:18
 */
public class SessionUtil {
	
	private static ThreadLocal<HttpServletRequest> local=new ThreadLocal<>();
	
	public static void setRequest(HttpServletRequest request){
		local.set(request);
	}
	
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
	
	
	
	
}
