package com.xyan.blog.vo;

import java.util.Date;

import com.xyan.blog.model.ArticleModel;

/**
 *VO，用于查询或传递信息
 *@Author：wangming
 *@Date:2016-05-16 10:32:51
 */
public class ArticleVO extends ArticleModel {
	
	private String typeName;
	
	private Date createTimeStart;
	private Date createTimeEnd;

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public Date getCreateTimeStart() {
		return createTimeStart;
	}

	public void setCreateTimeStart(Date createTimeStart) {
		this.createTimeStart = createTimeStart;
	}

	public Date getCreateTimeEnd() {
		return createTimeEnd;
	}

	public void setCreateTimeEnd(Date createTimeEnd) {
		this.createTimeEnd = createTimeEnd;
	}
	
	
}