package com.xyan.site.test.model;

import com.xyan.frame.base.model.BaseModel;

public class OtherModel extends BaseModel{

	private int other;

	public int getOther() {
		return other;
	}

	public void setOther(int other) {
		this.other = other;
	}

	@Override
	public String toString() {
		return "OtherModel [other=" + other + ", id=" + getId() + "]";
	}
	
}
