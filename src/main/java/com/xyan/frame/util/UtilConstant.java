package com.xyan.frame.util;

/**
 * @Description 工具参数类
 * @author wangming
 * @since 2016年3月4日 下午12:57:53
 */
public interface UtilConstant {
	
	/**
	 * 全格式
	 */
	public static String DATE_FORMAT_LONG 		="yyyy-MM-dd HH:mm:ss";
	
	/**
	 * 中文全格式
	 */
	public static String DATE_FORMAT_LONG_ZH	="yyyy年M月d日H时m分s秒";
	/**
	 * 年月日
	 */
	public static String DATE_FORMAT_DATE ="yyyy-MM-dd";
	
	/**
	 * 时分秒
	 */
	public static String DATE_FORMAT_TIME ="HH:mm:ss";
	
	/**
	 * 小写字母
	 */
	public static char[] smallCharArr=new char[]{'a','b','c','d','e','f','g','h','i',
			'j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'};
	
	/**
	 * 大写字母
	 */
	public static char[] bigCharArr=new char[]{'A','B','C','D','E','F','G','H','I',
			'J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'};
	
	/**
	 * 数字
	 */
	public static int[] numberArr=new int[]{0,1,2,3,4,5,6,7,8,9};
	/**
	 * 符号
	 */
	public static char[] symbolArr=new char[]{',',';',' ','.','。','-','_','ˉ',':','(',')','{','}','[',']'};
	
	/**小写字母(默认)*/
	public static int GENERATE_FORMAT_SMALL=1;
	/**大写字母*/
	public static int GENERATE_FORMAT_BIG=2;
	/**数字*/
	public static int GENERATE_FORMAT_NUMBER=3;
	/**字符(全英文)*/
	public static int GENERATE_FORMAT_CHARACTER=4;
	/**英文和数字*/
	public static int GENERATE_FORMAT_CHAR_ADN_NUM=5;
	/**符号*/
	public static int GENERATE_FORMAT_SYSMBOL=6;
	/**全部都包含*/
	public static int GENERATE_FORMAT_ALL=7;
	
	
	
}
