package com.xyan.frame.grab;

import java.io.IOException;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.log4j.Logger;

import com.xyan.frame.grab.model.HeadModel;
import com.xyan.frame.grab.model.PageModel;

/**
 * @author wangming
 * @describle:抓取服务
 */
public class GrabService {
	private static Logger logger=Logger.getLogger(GrabService.class);

	/**
	 * @Auhor:wangming
	 * @Description:赚钱指定的网站
	 * @param url
	 *            网站的地址
	 * @Date:2016年4月10日 下午1:25:05
	 */
	public static PageModel grab(String url) {
		HttpClient httpCLient = new DefaultHttpClient();
		// 创建get请求实例
		HttpGet httpget = new HttpGet(url);
		System.out.println("executing request " + httpget.getURI());
		PageModel pageModel=new PageModel();
		pageModel.setUrl(url);
		pageModel.setGrabDate(new Date());
		try {
			// 客户端执行get请求 返回响应实体
			HttpResponse response = httpCLient.execute(httpget);
			// 服务器响应
			pageModel.setStatus(response.getStatusLine().getStatusCode());
			
			Header[] heads = response.getAllHeaders();
			List<HeadModel> headsList=new LinkedList<HeadModel>();
			// 所有响应头
			for (Header h : heads) {
				headsList.add(new HeadModel(h.getName(), h.getValue()));
			}
			pageModel.setHeads(headsList);
			// 获取响应消息实体
			HttpEntity entity = response.getEntity();
			if (entity != null) {
				// 响应内容
				//pageModel.setResult(EntityUtils.toString(entity));
			}
			logger.warn(pageModel);
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			httpCLient.getConnectionManager().shutdown();
		}
		return pageModel;
	}

	public static void main(String[] args) {
		System.out.println(grab("http://www.baidu.com"));
	}
}
