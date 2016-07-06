package com.xyan.frame.grab.webCollector;

import cn.edu.hfut.dmic.webcollector.crawler.BreadthCrawler;
import cn.edu.hfut.dmic.webcollector.model.Links;
import cn.edu.hfut.dmic.webcollector.model.Page;
import cn.edu.hfut.dmic.webcollector.util.FileUtils;
 


import java.io.IOException;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.regex.Pattern;
 
/**
 * 用WebCollector爬虫爬取整站图片
 */
public class PicCrawler extends BreadthCrawler{
 
    public PicCrawler(String crawlPath, boolean autoParse) {
		super(crawlPath, autoParse);
	}

	/*用一个整数，不断自增，来作为下载的图片的文件名*/
    AtomicInteger id=new AtomicInteger(0);
 
    public static void main(String[] args) throws Exception {
        PicCrawler crawler=new PicCrawler("xxx",true);
        crawler.addSeed("http://www.meishij.net/");
        crawler.addRegex("http://.*meishij.net/.*");
        crawler.setThreads(50);
        crawler.start(10);
    }

	@Override
	public void visit(Page page, Links nextLinks) {
		 /*不处理非jpg的网页/文件*/
        if(!Pattern.matches(".*jpg$",page.getUrl())){
            return;
        }
        /*将图片内容保存到文件，page.getContent()获取的是文件的byte数组*/
        try {
            FileUtils.writeFileWithParent("download/"+id.incrementAndGet()+".jpg",page.getContent());
            System.out.println("download:"+page.getUrl());
        } catch (IOException e) {
            e.printStackTrace();
        }
	}
}
