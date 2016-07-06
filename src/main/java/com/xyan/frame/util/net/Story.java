package com.xyan.frame.util.net;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.nodes.TextNode;
import org.jsoup.select.Elements;

public class Story {
	
	
	/**
	 * 下载小说
	 * @param url
	 * @param dest
	 * @throws IOException
	 */
	public static void download(String url,File dest) throws IOException{
		writeFile(downloadFrom(url).getBytes(), dest);
	}
	
	private static String downloadFrom(String url) throws IOException{
		Document doc = Jsoup.connect(url).get();
		Elements els=doc.select("#content");
		StringBuffer sb=new StringBuffer();
		for (Element el : els) {
			List<TextNode> textNodes=el.textNodes();
			for (TextNode textNode : textNodes) {
				sb.append(textNode.text()+"\n");
			}
		}
		return sb.toString();
	}
	
	private static void writeFile(byte[] buff,File dest){
		FileOutputStream out=null;
		try{
			out=new FileOutputStream(dest,true);
			out.write(buff);
		} catch (Exception e) {
			
		}finally {
			try {
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
