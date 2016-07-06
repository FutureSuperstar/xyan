package com.xyan.common.enums;

import java.util.HashSet;
import java.util.Set;


/**
 * @author wangming
 * 日志类别
 */
public enum LogType {
	/**
	 * 访问日志
	 */
    LOG_VISIT("访问", "LV"),
    
    /**
     * 异常日志
     */
    LOG_EXCEPTION("异常", "LE");
	
    /**
     * 名称
     */
    private String label;

    /**
     * 代码
     */
    private String code;
    
    /**
     * 业务类型代码重复校验
     */
    public static void check() {
       	Set<String> codeSet = new HashSet<String>();
        for (LogType t : LogType.values()) {
            if (codeSet.contains(t.getCode())) {
               throw new RuntimeException("资源类型代码不能重复,重复代码为：" + t.getCode());
            }
            codeSet.add(t.getCode());
        }
	}
    
    private LogType(String label, String code) {
        this.code = code;
        this.label = label;
    }

    public static String getLabel(String code) {
        for (LogType t : LogType.values()) {
            if (t.getCode().equals(code)) {
                return t.label;
            }
        }
        return null;
    }

    @Override
    public String toString() {
        return String.valueOf(this.code);
    }
    public String getCode() {
        return code;
    }
}
