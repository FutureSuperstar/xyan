package com.xyan.frame.base.web;

import java.sql.SQLException;
import java.util.List;

import org.codehaus.jackson.map.JsonMappingException;
import org.springframework.dao.DataAccessException;

import com.xyan.frame.base.model.BaseModel;

public class ResponseModel{
	/**消息*/
	private String message;
	/**返回的状态码*/
	private String returnCode;
	/**字符串1*/
	private String str1;
	/**字符串2*/
	private String str2;
	/**整型数1*/
	private Long long1;
	/**整型数2*/
	private Long long2;
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

	public String getStr1() {
		return str1;
	}

	public ResponseModel setStr1(String str1) {
		this.str1 = str1;
		return this;
	}

	public String getStr2() {
		return str2;
	}

	public ResponseModel setStr2(String str2) {
		this.str2 = str2;
		return this;
	}

	public Long getLong1() {
		return long1;
	}

	public ResponseModel setLong1(Long long1) {
		this.long1 = long1;
		return this;
	}

	public Long getLong2() {
		return long2;
	}

	public ResponseModel setLong2(Long long2) {
		this.long2 = long2;
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
	public void setModelData(BaseModel modelData) {
		this.modelData = modelData;
	}
	@SuppressWarnings("rawtypes")
	public List getListData() {
		return listData;
	}
	@SuppressWarnings("rawtypes")
	public void setListData(List listData) {
		this.listData = listData;
	}
	
	public static ResponseModel from(Exception e){
		ResponseModel response=new ResponseModel();
		response.setSuccess(false);
		response.setReturnCode("500");
		response.setMessage(getTextFromException(e));
		response.setTimestamp(System.currentTimeMillis());
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
