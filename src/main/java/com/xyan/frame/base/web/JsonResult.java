package com.xyan.frame.base.web;

public class JsonResult {
	
	public static int SERVER_SUCCESS=200;
	public static int SERVER_FAILURE=500;
	public static int CLIENT_FAILURE=400;
	
	private int code;
	
	private boolean suucess;
	
	private Object data;

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public boolean isSuucess() {
		return suucess;
	}

	public void setSuucess(boolean suucess) {
		this.suucess = suucess;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}
	
	
	
}
