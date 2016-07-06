package com.xyan.frame.grab.webCollector;

import java.io.IOException;

import cn.edu.hfut.dmic.webcollector.crawler.BreadthCrawler;
import cn.edu.hfut.dmic.webcollector.model.Links;
import cn.edu.hfut.dmic.webcollector.model.Page;

import com.xyan.frame.util.FileUtil;

public class ZhihuCrawler extends BreadthCrawler{
		
	 public ZhihuCrawler(String crawlPath, boolean autoParse) {
		super(crawlPath, autoParse);
	}

	@Override
	public void visit(Page page, Links nextLinks) {
		try {
			FileUtil.log("URL", page.getUrl());
			FileUtil.log("Content", page.getHtml());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	 public static void main(String[] args) throws Exception{   
	        ZhihuCrawler crawler=new ZhihuCrawler("crawl",true);
	        crawler.addSeed("http://www.ahut.edu.cn/");
	        crawler.addRegex("http://.*ahut\\.edu\\.cn/.*");
	        crawler.start(5);   
	        crawler.setThreads(500);
	  }
	  
}