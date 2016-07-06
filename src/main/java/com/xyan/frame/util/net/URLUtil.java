package com.xyan.frame.util.net;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.LinkedList;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;

import com.xyan.frame.util.FileUtil;
import com.xyan.frame.util.SystemUtil;

/**
 * @author wangming
 */
public class URLUtil {

	/**
	 *@Auhor:wangming
	 *@Description:(用一句话描述)
	 *@param url
	 *@return
	 *@Date:2016年4月16日 下午9:50:30
	 */
	public static String getFileNameFromURL(String url) {
		int lst = url.lastIndexOf("/") + 1;
		return url.substring(lst);
	}

	private static DefaultHttpClient httpClient = new DefaultHttpClient();
	
	/**
	 *@Auhor:wangming
	 *@Description:下载到默认的目录
	 *@param url
	 *@Date:2016年4月18日 上午10:21:03
	 */
	public static void download(String url){
		String dst=SystemUtil.getProperty("file.download.path");
		downLoad(url, dst);
	}

	/**
	 *@Auhor:wangming
	 *@Description:下载到指定的目录
	 *@param url
	 *@param dst
	 *@Date:2016年4月16日 下午9:50:33
	 */
	public static void downLoad(String url, String dst) {
		System.out.println("开始下载！" + dst);
		HttpGet httpGet=null;
		try {
			httpGet = new HttpGet(url);
			FileUtil.createDir(dst);
			HttpResponse httpResponse = httpClient.execute(httpGet);
			HttpEntity entity = httpResponse.getEntity();
			InputStream in = entity.getContent();
			long length = entity.getContentLength();
			if (length <= 0) {
				System.out.println("下载文件不存在！");
				return;
			}
			OutputStream out = new FileOutputStream(new File(dst));
			saveTo(in, out);
			System.out.println("下载完成！");
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			//释放资源
		}
	}

	/**
	 *@Auhor:wangming
	 *@Description:(用一句话描述)
	 *@param in
	 *@param out
	 *@throws Exception
	 *@Date:2016年4月16日 下午9:50:39
	 */
	public static void saveTo(InputStream in, OutputStream out) throws Exception {
		byte[] data = new byte[1024 * 1024];
		int index = 0;
		while ((index = in.read(data)) != -1) {
			out.write(data, 0, index);
		}
		in.close();
		out.close();
	}
	
	public static void main(String[] args) {
		List<String> urlList=new LinkedList<String>();
		urlList.add("");
		for(String url:urlList){
			download(url);
		}
	}
}
