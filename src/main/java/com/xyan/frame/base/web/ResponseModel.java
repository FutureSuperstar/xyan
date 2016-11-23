package com.xyan.frame.base.web;

import java.sql.SQLException;
import java.util.List;

import org.codehaus.jackson.map.JsonMappingException;
import org.springframework.dao.DataAccessException;

import com.xyan.frame.base.model.BaseModel;
import com.xyan.frame.feature.web.exception.XyanException;

public class ResponseModel{
	/**消息*/
	private String message;
	/**模块*/
	private String module;
	/**返回的状态码*/
	private String returnCode;
	/**字符串1*/
	private String str;
	/**整型数1*/
	private Long lon;
	/**是否成功*/
	private boolean success;
	/**是否登录*/
	private boolean login;
	/**时间戳*/
	private long timestamp;
	/**数据*/
	private BaseModel modelData;
	/**集合数据*/
	@SuppressWarnings("rawtypes")
	private List listData;
	
	
	public ResponseModel() {
		
	}
	public String getModule() {
		return module;
	}
	public ResponseModel setModule(String module) {
		this.module = module;
		return this;
	}

	public ResponseModel(boolean success) {
		this.success=success;
	}
	
	public ResponseModel(boolean success,String message) {
		this.success=success;
		this.message=message;
	}
	
	public ResponseModel(boolean success,boolean login) {
		this.success=success;
		this.login=login;
	}
	
	public ResponseModel(boolean success,boolean login,String message) {
		this.success=success;
		this.login=login;
		this.message=message;
	}
	
	public long getTimestamp() {
		return timestamp;
	}

	public ResponseModel setTimestamp(long timestamp) {
		this.timestamp = timestamp;
		return this;
	}

	public String getReturnCode() {
		return returnCode;
	}

	public ResponseModel setReturnCode(String returnCode) {
		this.returnCode = returnCode;
		return this;
	}

	public String getMessage() {
		return message;
	}

	public ResponseModel setMessage(String message) {
		this.message = message;
		return this;
	}

	public String getStr() {
		return str;
	}

	public ResponseModel setStr(String str) {
		this.str = str;
		return this;
	}

	public Long getLon() {
		return lon;
	}

	public ResponseModel setLon(Long lon) {
		this.lon = lon;
		return this;
	}

	public boolean isSuccess() {
		return success;
	}

	public ResponseModel setSuccess(boolean success) {
		this.success = success;
		return this;
	}

	public boolean isLogin() {
		
		return login;
	}

	public ResponseModel setLogin(boolean login) {
		this.login = login;
		return this;
	}
	public BaseModel getModelData() {
		return modelData;
	}
	public ResponseModel setModelData(BaseModel modelData) {
		this.modelData = modelData;
		return this;
	}
	@SuppressWarnings("rawtypes")
	public List getListData() {
		return listData;
	}
	@SuppressWarnings("rawtypes")
	public ResponseModel setListData(List listData) {
		this.listData = listData;
		return this;
	}

	public static ResponseModel from(Exception e){
		ResponseModel response=new ResponseModel();
		response.setSuccess(false);
		response.setReturnCode("500");
		response.setMessage(getTextFromException(e));
		response.setTimestamp(System.currentTimeMillis());
		if(e instanceof XyanException){
			XyanException ee=(XyanException) e;
			response.setModule(ee.getModule().getCode());
		}
		return response;
	}
	
	 public static String getTextFromException(Exception e){
		e.printStackTrace();
		String message=e.getMessage();
		if(e instanceof SQLException||e instanceof DataAccessException||e instanceof JsonMappingException){
			message="您输入了不合法的数据，服务器拒绝响应！";
		}else if(org.apache.commons.lang.StringUtils.isBlank(message)){
			message="操作失败！";
		}else if(e instanceof ClassCastException||e instanceof IndexOutOfBoundsException||e instanceof NullPointerException||e instanceof StringIndexOutOfBoundsException){
			message="系统异常，请联系管理员！";
		}
		return message;
	 }
}
