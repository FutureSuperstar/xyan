package com.xyan.component.spider;

import java.io.IOException;
import java.util.ListIterator;

import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Spider {
	
	private String seed;
	
	public Spider(String seed) {
		this.seed=seed;
	}

	public String getSeed() {
		return seed;
	}

	public void setSeed(String seed) {
		this.seed = seed;
	}
	
	
	/**
	 * @Author:wangming
	 * @Description:开始抓取
	 * @since 2016年12月27日下午2:13:46
	 */
	public void start(){
		try {
			Graber graber=new Graber(seed);
			Document document=graber.grab();
			Resolver resolver=new Resolver(document);
			String html=resolver.resolve();
			System.out.println(html);
			System.out.println("=========================================================================");
			Elements elements=resolver.getElements();
			ListIterator<Element> iterator=elements.listIterator();
			while (iterator.hasNext()) {
				Element element=iterator.next();
				String href=element.attr("href");
				Spider spider=new Spider(href);
				spider.start();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		new Spider("https://github.com/FutureSuperstar/blog").start();
	}
}
