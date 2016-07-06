package com.xyan.frame.feature.web.exception;

import org.springframework.util.StringUtils;

import com.xyan.frame.util.MessageUtils;

/**
 * @Description  项目业务异常
 * @author wangming
 * @since 2016年3月7日 上午9:44:45
 */
public class XyanException extends RuntimeException {
	
	 /**
	 * 
	 */
	private static final long serialVersionUID = -8857917068219327955L;

	//所属模块
    private String module;

    /**
     * 错误码
     */
    private String code;

    /**
     * 错误码对应的参数
     */
    private Object[] args;

    /**
     * 错误消息
     */
    private String defaultMessage;


    public XyanException(String module, String code, Object[] args, String defaultMessage) {
        this.module = module;
        this.code = code;
        this.args = args;
        this.defaultMessage = defaultMessage;
    }

    public XyanException(String module, String code, Object[] args) {
        this(module, code, args, null);
    }

    public XyanException(String module, String defaultMessage) {
        this(module, null, null, defaultMessage);
    }

    public XyanException(String code, Object[] args) {
        this(null, code, args, null);
    }

    public XyanException(String defaultMessage) {
        this(null, null, null, defaultMessage);
    }

    @Override
    public String getMessage() {
        String message = null;
        if (!StringUtils.isEmpty(code)) {
            message = MessageUtils.message(code, args);
        }
        if (message == null) {
            message = defaultMessage;
        }
        return message;
    }


    public String getModule() {
        return module;
    }

    public String getCode() {
        return code;
    }

    public Object[] getArgs() {
        return args;
    }

    public String getDefaultMessage() {
        return defaultMessage;
    }

    @Override
    public String toString() {
        return this.getClass() + "{" +
                "module='" + module + '\'' +
                ", message='" + getMessage() + '\'' +
                '}';
    }
}
