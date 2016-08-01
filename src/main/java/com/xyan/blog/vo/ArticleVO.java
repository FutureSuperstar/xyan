package com.xyan.blog.vo;

import com.xyan.blog.model.ArticleModel;

/**
 *VO，用于查询或传递信息
 *@Author：wangming
 *@Date:2016-05-16 10:32:51
 */
public class ArticleVO extends ArticleModel {
	
	private String typeName;

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	
	
}