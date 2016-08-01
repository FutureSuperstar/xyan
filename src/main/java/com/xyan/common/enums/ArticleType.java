package com.xyan.common.enums;

import java.util.HashSet;
import java.util.Set;


/**
 * @author wangming
 * 日志类别
 */
public enum ArticleType {
	/**
	 * 慢生活
	 */
    TYPE_LIFE("慢生活", 99999L),
    
    /**
     * 技术探讨
     */
    TYPE_TECHNOLOGY("技术探讨", 99998L),
    
    /**
     * 闲言碎语
     */
    TYPE_TALK("闲言碎语", 99997L);
	
    /**
     * 名称
     */
    private String label;

    /**
     * 代码
     */
    private Long code;
    
    
    private ArticleType(String label, Long code) {
        this.code = code;
        this.label = label;
    }

    public static String getLabel(String code) {
        for (ArticleType t : ArticleType.values()) {
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
    public Long getCode() {
        return code;
    }
}
