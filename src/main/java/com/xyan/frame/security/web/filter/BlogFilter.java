package com.xyan.frame.security.web.filter;

import java.io.IOException;
import java.util.Date;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

import com.xyan.frame.security.Cache;
import com.xyan.frame.util.ApplicationUtils;
import com.xyan.frame.util.DateUtil;

/**
 * @author wangming
 * 前端访问过滤器，主要为防止重复请求
 */
public class BlogFilter implements Filter {
	
	private static Logger logger=Logger.getLogger(BlogFilter.class);
	
	private String errorPage=null;
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		//初始化
		errorPage=filterConfig.getInitParameter("errorPage");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		logger.info("前端过滤");
		HttpServletRequest req=(HttpServletRequest) request;
		String ip=ApplicationUtils.getIpAddr(req);
		Date date=Cache.get(ip);
		Cache.put(ip);
		if(date==null){
			chain.doFilter(request, response);
		}else{
			long between=DateUtil.getDiff(date, new Date())/1000;//秒
			if(between>30){
				chain.doFilter(request, response);
			}else{
				request.setAttribute("message", "访问速度太快啦！");
				request.getRequestDispatcher(errorPage).forward(request, response);
			}
		}
	}

	@Override
	public void destroy() {
		//摧毁
	}

}
