package com.xyan.frame.util;

public final class ExceptionHandle {
	
	public static String message(Exception e){
		String message=null;
		if(e instanceof NumberFormatException){
			message="数字格式化错误！";
		}
		return message;
	}
}
