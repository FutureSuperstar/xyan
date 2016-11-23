package com.xyan.common.enums;

import java.util.HashSet;
import java.util.Set;

/**
 * @author wangming
 * 模块
 */
public enum Module {
	/**
	 * 登陆
	 */
    LOGIN("登陆", "login"),
    
    /**
     * 发布博客
     */
    PUBLISH_BLOG("发表博客", "publish blog"),
    
    /**
     * 邮件
     */
    PUBLISH_MAIL("发表博客", "publish mail"),
	
	/**
     * 发布留言
     */
    PUBLISH_MESAAGE("发表留言", "publish mesaage");
	
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
    
    private Module(String label, String code) {
        this.code = code;
        this.label = label;
    }

    public static String getLabel(String code) {
        for (Module t : Module.values()) {
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
    
    public String getText(){
    	return label;
    }
    
    public String getCode() {
        return code;
    }
}
