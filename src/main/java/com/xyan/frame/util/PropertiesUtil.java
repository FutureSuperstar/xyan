package com.xyan.frame.util;

import java.util.ResourceBundle;

/**properties工具类*/
public class PropertiesUtil {
	
	public static ResourceBundle bundle=ResourceBundle.getBundle("application");
	
	public static String getProperties(String key){
		return bundle.getString(key);
	}
	
	public static String getProperties(ResourceBundle bundle,String key){
		return bundle.getString(key);
	}
}
