package com.xyan.frame.base.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ExceptionHandler;

import com.xyan.frame.feature.web.exception.XyanException;

public class BaseController {

	@ExceptionHandler
	public String handleException(HttpServletRequest request,HttpServletResponse response,Exception ex){
		request.setAttribute("ex", ex);  
        // 根据不同错误转向不同页面  
        if(ex instanceof XyanException) {  
            return "error-business";  
        } else {  
            return "error";  
        }  
	}
}
