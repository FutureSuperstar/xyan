package com.xyan.frame.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.LineNumberReader;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Locale;
import java.util.ResourceBundle;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * @Description 全局工具类，提供各种方便
 * @author wangming
 * @since 2016年3月4日 下午12:53:53
 */
public class ApplicationUtils {
	 private final static Logger log = LoggerFactory.getLogger(ApplicationUtils.class);  
    /**
     * 产生一个36个字符的UUID
     *
     * @return UUID
     */
    public static String randomUUID() {
        return UUID.randomUUID().toString();
    }

     /**
      * @Author:wangming
      * @Description:(描述方法的用途)
      * @param locale
      * @return
      * @since 2015年12月2日 下午4:10:21
      */
    public static ResourceBundle getResourceBundleByLocale(Locale locale){
    	if(locale==null){return null;}
    	return ResourceBundle.getBundle("message.message", locale);
    }
    
    public static String getResourceValue(String key,Locale locale){
    	if(locale==null||StringUtils.isBlank(key)){return null;}
    	return ResourceBundle.getBundle("message.message", locale).getString(key);
    }
  
    /**获得时间IP地址*/
    public static String getIpAddr(HttpServletRequest request){  
        String ipAddress = request.getHeader("x-forwarded-for");  
            if(ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {  
                ipAddress = request.getHeader("Proxy-Client-IP");  
            }  
            if(ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {  
                ipAddress = request.getHeader("WL-Proxy-Client-IP");  
            }  
            if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
            	ipAddress = request.getHeader("HTTP_X_FORWARDED_FOR");
	        }
            if(ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {  
                ipAddress = request.getRemoteAddr();  
                if(ipAddress.equals("127.0.0.1") || ipAddress.equals("0:0:0:0:0:0:0:1")){  
                    //根据网卡取本机配置的IP  
                    InetAddress inet=null;  
                    try {  
                        inet = InetAddress.getLocalHost();  
                    } catch (UnknownHostException e) {  
                        e.printStackTrace();  
                    }  
                    ipAddress= inet.getHostAddress();  
                }  
            }  
            log.warn("本次的IP地址是："+ipAddress);
            //对于通过多个代理的情况，第一个IP为客户端真实IP,多个IP按照','分割  
            if(ipAddress!=null && ipAddress.length()>15){ //"***.***.***.***".length() = 15  
                if(ipAddress.indexOf(",")>0){  
                    ipAddress = ipAddress.substring(0,ipAddress.indexOf(","));  
                }  
            }  
            return ipAddress;   
    }  
    
    /**获取Mac地址*/ 
 	public String getMAC() {
 		String mac = null;
 		try {
 			Process pro = Runtime.getRuntime().exec("cmd.exe /c ipconfig/all");
 			InputStream is = pro.getInputStream();
 			BufferedReader br = new BufferedReader(new InputStreamReader(is));
 			String message = br.readLine();
 			int index = -1;
 			while (message != null) {
 				if ((index = message.indexOf("Physical Address")) > 0) {
 					mac = message.substring(index + 36).trim();
 					break;
 				}
 				message = br.readLine();
 			}
 			br.close();
 			pro.destroy();
 		} catch (IOException e) {
 			log.error("Can't get mac address!");
 			return null;
 		}
 		return mac;
 	}

 	 /**获取Mac地址*/ 
 	public String getMAC(String ip) {
 		String str = null;
 		String macAddress = null;
 		try {
 			Process p = Runtime.getRuntime().exec("nbtstat -A " + ip);
 			InputStreamReader ir = new InputStreamReader(p.getInputStream());
 			LineNumberReader input = new LineNumberReader(ir);
 			for (; true;) {
 				str = input.readLine();
 				if (str != null) {
 					if (str.indexOf("MAC Address") > 1) {
 						macAddress = str
 								.substring(str.indexOf("MAC Address") + 14);
 						break;
 					}
 				}
 			}
 		} catch (IOException e) {
 			e.printStackTrace();
 			return null;
 		}
 		return macAddress;
 	}
}
