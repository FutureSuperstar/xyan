package com.xyan.component.spider;

import java.io.IOException;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

/**
 * @author wangming
 * 抓取器
 */
public class Graber {
	
	private String url;
	
	public Graber(String url){
		this.url=url;
	}
	
	/**
	 * @throws IOException 
	 * @Author:wangming
	 * @Description:
	 * @since 2016年12月27日下午2:16:07
	 */
	public Document grab() throws IOException{
		Connection connection=Jsoup.connect(url);
		return connection.get();
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	
	
}
