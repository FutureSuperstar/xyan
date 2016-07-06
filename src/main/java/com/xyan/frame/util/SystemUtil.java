package com.xyan.frame.util;

import java.util.ResourceBundle;

public class SystemUtil {
	
	private static ResourceBundle bundle=ResourceBundle.getBundle("application");
	
	/**
	 *@Auhor:wangming
	 *@Description:获取系统属性
	 *@param key 
	 *@return
	 *@Date:2016年5月9日 下午3:13:39
	 */
	public static String getProperty(String key){
		return bundle.getString(key);
	}
}
