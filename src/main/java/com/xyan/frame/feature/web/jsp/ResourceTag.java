package com.xyan.frame.feature.web.jsp;

import java.io.IOException;

import javax.servlet.ServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.lang.StringUtils;

import com.xyan.frame.util.ApplicationUtils;

public class ResourceTag extends TagSupport {

	/**键*/
	private String key;
	/**值*/
	private String value;
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
	public int doStartTag() throws JspException {
		 JspWriter out = this.pageContext.getOut();
		 ServletRequest request=this.pageContext.getRequest();
		 if(StringUtils.isNotBlank(key)){
			 this.value=ApplicationUtils.getResourceValue(key,request.getLocale());
		 }
		try {
			out.print(value);
		} catch (IOException e) {
			e.printStackTrace();
		}
		 return EVAL_PAGE;
	}
	
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
}
