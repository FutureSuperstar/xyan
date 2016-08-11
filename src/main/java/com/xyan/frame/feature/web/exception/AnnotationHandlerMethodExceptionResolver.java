package com.xyan.frame.feature.web.exception;

import java.io.IOException;
import java.lang.reflect.Method;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.http.HttpInputMessage;
import org.springframework.http.HttpOutputMessage;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.http.server.ServletServerHttpResponse;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.ExceptionHandlerExceptionResolver;

import com.xyan.common.enums.LogType;
import com.xyan.frame.base.web.ResponseModel;
import com.xyan.frame.feature.log.model.LogModel;
import com.xyan.frame.feature.log.service.LogService;
import com.xyan.frame.feature.web.constant.Constant;
import com.xyan.frame.util.PropertiesUtil;

/**
 * 不必在Controller中对异常进行处理，抛出即可，由此异常解析器统一控制。<br>
 * ajax请求（有@ResponseBody的Controller）发生错误，输出JSON。<br>
 * 页面请求（无@ResponseBody的Controller）发生错误，输出错误页面。<br>
 * 需要与AnnotationMethodHandlerAdapter使用同一个messageConverters<br>
 * Controller中需要有专门处理异常的方法。
 */
public class AnnotationHandlerMethodExceptionResolver extends ExceptionHandlerExceptionResolver {
	private static boolean log=PropertiesUtil.getProperties("logOpen").equals("1");
	
    private String defaultErrorView;
    
    @Autowired
	private LogService logService;
    
    public String getDefaultErrorView() {
        return defaultErrorView;
    }

    public void setDefaultErrorView(String defaultErrorView) {
        this.defaultErrorView = defaultErrorView;
    }

    protected ModelAndView doResolveHandlerMethodException(HttpServletRequest request, HttpServletResponse response, HandlerMethod handlerMethod, Exception exception) {
    	if(log){
    		LogModel logModel=new LogModel();
    		logModel.setLogDate(new Date());
    		logModel.setLogType(LogType.LOG_EXCEPTION.toString());
    		logModel.setContent("【异常】"+exception.getMessage());
    		logService.insert(logModel);
    	}
        if (handlerMethod == null) {
            return null;
        }
        Method method = handlerMethod.getMethod();
        if (method == null) {
            return null;
        }
        //如果定义了ExceptionHandler则返回相应的Map中的数据
        ModelAndView returnValue = super.doResolveHandlerMethodException(request, response, handlerMethod, exception);
       //判断是否ajax
        ResponseBody responseBodyAnn = AnnotationUtils.findAnnotation(method, ResponseBody.class);
        if (responseBodyAnn != null) {
            try {
                ResponseStatus responseStatusAnn = AnnotationUtils.findAnnotation(method, ResponseStatus.class);
                if (responseStatusAnn != null) {
                    HttpStatus responseStatus = responseStatusAnn.value();
                    String reason = responseStatusAnn.reason();
                    if (!StringUtils.hasText(reason)) {
                        response.setStatus(responseStatus.value());
                    } else {
                        try {
                            response.sendError(responseStatus.value(), reason);
                        } catch (IOException e) { }
                    }
                }
                // 如果没有ExceptionHandler注解那么returnValue就为空
                if (returnValue == null) {
                    ResponseModel respn =ResponseModel.from(exception);
                    Object user=request.getSession().getAttribute(Constant.lOGIN_USER);
                    respn.setLogin(user!=null);
                    handleResponseError(respn, request, response);
                    return new ModelAndView();
                }
                return handleResponseBody(returnValue, request, response);
            } catch (Exception e) {
                return null;
            }
        }

        if( null == returnValue) {
            returnValue = new ModelAndView();
            if (null == returnValue.getViewName()) {
                returnValue.addObject("errorMessage", ResponseModel.getTextFromException(exception)).setViewName(defaultErrorView);
            }
        }
        return returnValue;
    }

    
    @SuppressWarnings({ "unchecked", "rawtypes", "resource" })
    private ModelAndView handleResponseBody(ModelAndView returnValue, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map value = returnValue.getModelMap();
        HttpInputMessage inputMessage = new ServletServerHttpRequest(request);
        List<MediaType> acceptedMediaTypes = inputMessage.getHeaders().getAccept();
        if (acceptedMediaTypes.isEmpty()) {
            acceptedMediaTypes = Collections.singletonList(MediaType.ALL);
        }
        MediaType.sortByQualityValue(acceptedMediaTypes);
        HttpOutputMessage outputMessage = new ServletServerHttpResponse(response);
        Class<?> returnValueType = value.getClass();
        List<HttpMessageConverter<?>> messageConverters = super.getMessageConverters();
        if (messageConverters != null) {
            for (MediaType acceptedMediaType : acceptedMediaTypes) {
                for (HttpMessageConverter messageConverter : messageConverters) {
                    if (messageConverter.canWrite(returnValueType, acceptedMediaType)) {
                        messageConverter.write(value, acceptedMediaType, outputMessage);
                        return new ModelAndView();
                    }
                }
            }
        }
        if (logger.isWarnEnabled()) {
            logger.warn("Could not find HttpMessageConverter that supports return type [" + returnValueType + "] and " + acceptedMediaTypes);
        }
        return null;
    }
    
    
    @SuppressWarnings({ "unchecked", "rawtypes", "resource" })
    private ModelAndView handleResponseError(ResponseModel respn, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpInputMessage inputMessage = new ServletServerHttpRequest(request);
        List<MediaType> acceptedMediaTypes = inputMessage.getHeaders().getAccept();
        if (acceptedMediaTypes.isEmpty()) {
            acceptedMediaTypes = Collections.singletonList(MediaType.ALL);
        }
        MediaType.sortByQualityValue(acceptedMediaTypes);
        HttpOutputMessage outputMessage = new ServletServerHttpResponse(response);
        Class<?> returnValueType = respn.getClass();
        List<HttpMessageConverter<?>> messageConverters = super.getMessageConverters();
        if (messageConverters != null) {
            for (MediaType acceptedMediaType : acceptedMediaTypes) {
                for (HttpMessageConverter messageConverter : messageConverters) {
                    if (messageConverter.canWrite(returnValueType, acceptedMediaType)) {
                        messageConverter.write(respn, acceptedMediaType, outputMessage);
                        return new ModelAndView();
                    }
                }
            }
        }
        if (logger.isWarnEnabled()) {
            logger.warn("Could not find HttpMessageConverter that supports return type [" + returnValueType + "] and " + acceptedMediaTypes);
        }
        return null;
    }

}
