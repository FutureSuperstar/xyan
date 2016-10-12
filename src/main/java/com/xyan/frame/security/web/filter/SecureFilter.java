package com.xyan.frame.security.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.xyan.frame.feature.web.constant.Constant;
import com.xyan.frame.security.model.UserModel;

/**
 * @author wangming
 * 安全过滤器，暂未启用
 */
public class SecureFilter implements Filter {
	
	private static Logger logger=Logger.getLogger(SecureFilter.class);
	@Autowired
	private String errorPage=null;
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		//初始化
		errorPage=filterConfig.getInitParameter("errorPage");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		/*
		 * 1、拿到请求中的user
		 */
		String LOGIN_KEY=Constant.lOGIN_USER;
		HttpServletRequest req=(HttpServletRequest) request;
		UserModel user=(UserModel) req.getSession().getAttribute(LOGIN_KEY);
		
		/*
		 * 2、通过用户id和url去检索有没有这个权限
		 * 	如果没有权限则转发到预设的页面
		 */
		String url=req.getRequestURI();
		logger.warn("当前拦截url:"+url);
		if(check(url,user)){
			chain.doFilter(request, response);
		}else{
			request.setAttribute("saveUrl", url);
			request.getRequestDispatcher(errorPage).forward(request, response);
		}
		
	}

	@Override
	public void destroy() {
		//摧毁
	}

	private boolean check(String url,UserModel user){
		//return true;
		if(user!=null&&user.getId().longValue()==1L){
			return true;
		}else if(url.endsWith("admin/login")){
			return true;
		}else{
			return false;
		}
	}
}
