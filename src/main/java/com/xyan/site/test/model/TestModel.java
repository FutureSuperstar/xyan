package com.xyan.site.test.model;

import com.xyan.frame.base.model.BaseModel;

public class TestModel extends BaseModel {
	
	private String name;
	
	
	public TestModel() {
	}
	public TestModel(String name) {
		this.name=name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}
