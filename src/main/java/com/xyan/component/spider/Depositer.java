package com.xyan.component.spider;

import java.io.InputStream;

/**
 * @author wangming
 * 存放
 */
public class Depositer {
	
	private InputStream inputStream;
	
	public Depositer(InputStream inputStream) {
		this.inputStream=inputStream;
	}
	

	/**
	 * @Author:wangming
	 * @Description:存储
	 * @since 2016年12月27日下午2:20:49
	 */
	public void deposit(){
		
	}
	
	public InputStream getInputStream() {
		return inputStream;
	}
	
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
}
