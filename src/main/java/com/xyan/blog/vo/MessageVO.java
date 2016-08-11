package com.xyan.blog.vo;

import com.xyan.blog.model.MessageModel;

/**
 * @author wangming
 *查询显示
 */
public class MessageVO extends MessageModel {
	
	private String sourceName;//创建人名称
	private String sourceHead;//创建人头像
	
	public String getSourceName() {
		return sourceName;
	}
	public void setSourceName(String sourceName) {
		this.sourceName = sourceName;
	}
	public String getSourceHead() {
		return sourceHead;
	}
	public void setSourceHead(String sourceHead) {
		this.sourceHead = sourceHead;
	}
	
	
}
