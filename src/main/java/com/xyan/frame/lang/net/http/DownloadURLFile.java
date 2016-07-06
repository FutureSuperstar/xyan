package com.xyan.frame.lang.net.http;


import java.io.File;
import java.net.URL;

import org.apache.commons.io.FileUtils;

public class DownloadURLFile {

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		String res = downloadFromUrl("http://images.17173.com/2010/www/roll/201003/0301sohu01.jpg","d:/tmp/2016-06-02/");
		System.out.println(res);
	}


	public static String downloadFromUrl(String url,String dir) {

		try {
			URL httpurl = new URL(url);
			String fileName = getFileNameFromUrl(url);
			System.out.println(fileName);
			File f = new File(dir + fileName);
			FileUtils.copyURLToFile(httpurl, f);
		} catch (Exception e) {
			e.printStackTrace();
			return "Fault!";
		} 
		return "Successful!";
	}
	
	public static String getFileNameFromUrl(String url){
		String name = new Long(System.currentTimeMillis()).toString() + ".X";
		int index = url.lastIndexOf("/");
		if(index > 0){
			name = url.substring(index + 1);
			if(name.trim().length()>0){
				return name;
			}
		}
		return name;
	}
}


