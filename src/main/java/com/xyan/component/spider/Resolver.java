package com.xyan.component.spider;

import java.io.IOException;
import java.util.ListIterator;

import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

/**
 * @author wangming
 * 解析器
 */
public class Resolver {

	private Elements elements;
	private Document document;
	
	public Resolver(Document document) {
		this.document=document;
		elements=document.select("a[href]");
	}
	/**
	 * @param document 
	 * @Author:wangming
	 * @Description：解析
	 * @since 2016年12月27日下午2:17:29
	 */
	public String resolve(){
		return document.html();
	}
	
	public Elements getElements() {
		return elements;
	}
	
	public void setElements(Elements elements) {
		this.elements = elements;
	}
	
}
