package com.xyan.common.enums;

/**
 * @author wangming
 * 字典类别
 */
public enum DictType {
	/**
	 * 归档
	 */
	DICT_GD("慢生活", "GD"),
    
  ;
	
    /**
     * 名称
     */
    private String label;

    /**
     * 代码
     */
    private String code;
    
    
    private DictType(String label, String code) {
        this.code = code;
        this.label = label;
    }

    public static String getLabel(String code) {
        for (DictType t : DictType.values()) {
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
