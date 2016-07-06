package com.xyan.common.enums;

import java.util.HashSet;
import java.util.Set;

public enum ResourceType {
	/**
	 * 菜单
	 */
    RESOURCE_MENU("菜单", "RM"),
    
    /**
     * 按钮
     */
    RESOURCE_BUTTON("按钮", "RB");
	
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
        for (ResourceType t : ResourceType.values()) {
            if (codeSet.contains(t.getCode())) {
               throw new RuntimeException("资源类型代码不能重复,重复代码为：" + t.getCode());
            }
            codeSet.add(t.getCode());
        }
	}
    
    private ResourceType(String label, String code) {
        this.code = code;
        this.label = label;
    }

    public static String getLabel(String code) {
        for (ResourceType t : ResourceType.values()) {
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
