package com.xyan.frame.util;

import java.text.SimpleDateFormat;
import java.util.Date;


/**
 * @Description  日期工具类
 * @author wangming
 * @since 2016年3月4日 下午12:54:57
 */
public class DateUtil implements UtilConstant{
	
	private static SimpleDateFormat sf=new SimpleDateFormat(DATE_FORMAT_LONG);
	
	 /**
	  * @Author:wangming
	  * @Description:按格式获取当前日期
	  * @param format 格式
	  * @return
	  * @since 2015年12月2日 下午4:10:21
	  */
	public static String getNowDate(String format){
		sf.applyPattern(format);
		return sf.format(new Date());
	}
	
	 /**
	  * @Author:wangming
	  * @Description:获取默认格式的当前日期
	  * @return
	  * @since 2015年12月2日 下午4:10:21
	  */
	public static String getNowDate(){
		return sf.format(new Date());
	}
	
	 /**
	  * @Author:wangming
	  * @Description:获取两个时间间隔的毫秒数
	  * @param date1 第一个日期
	  * @param date2 第二个日期
	  * @return
	  * @since 2015年12月2日 下午4:10:21
	  */
	public static long getDiff(Date date1,Date date2){
		return Math.abs(date1.getTime()-date2.getTime());
	}
	
	 /**
	  * @Author:wangming
	  * @Description:获取与当前时间间隔的毫秒数
	  * @param date 指定时间
	  * @return
	  * @since 2015年12月2日 下午4:10:21
	  */
	public static long getDiffDate2Now(Date date){
		return Math.abs(System.currentTimeMillis()-date.getTime());
	}
	
	/**获得时间戳*/
	public static long getTimestamp(Date date){
		return date==null?new Date().getTime():date.getTime();
	}
}
