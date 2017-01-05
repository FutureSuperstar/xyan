package com.xyan.frame.base.web;

public class JsonResult {
	
	public static int SERVER_SUCCESS=200;
	public static int SERVER_FAILURE=500;
	public static int CLIENT_FAILURE=400;
	
	private int code;
	
	private boolean suucess;
	
	private Object data;
	
	public JsonResult() {}
	
	public JsonResult(int code,boolean success){
		this.code=code;
		this.suucess=success;
	}
	
	public JsonResult(boolean success,Object data){
		this.suucess=success;
		if(data instanceof Exception){
			Exception e=(Exception) data;
			this.data=e.getMessage();
		}
	}
	
	public JsonResult(int code,boolean success,Object data) {
		this.code=code;
		this.suucess=success;
		if(data instanceof Exception){
			Exception e=(Exception) data;
			this.data=e.getMessage();
		}
	}

	public int getCode() {
		return code;
	}

	public JsonResult setCode(int code) {
		this.code = code;
		return this;
	}

	public boolean isSuucess() {
		return suucess;
	}

	public JsonResult setSuucess(boolean suucess) {
		this.suucess = suucess;
		return this;
	}

	public Object getData() {
		return data;
	}

	public JsonResult setData(Object data) {
		this.data = data;
		return this;
	}
	
	
	
}
