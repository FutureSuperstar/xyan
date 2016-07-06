package com.xyan.frame.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


/**
 * @author wangming
 * @description 地址类工具
 * @since ctreated at 2015年12月6日 下午8:35:36
 * @update wangming modified at 2015年12月6日 下午8:35:36
 */
public class URLUtil {
	
	/**
	 * @Author:wangming
	 * @Description:执行命令
	 * @param cmd 命令
	 * @return
	 * @since 2015年12月6日 下午8:35:58
	 */
	public static String callCmd(String[] cmd) {
		StringBuffer result = new StringBuffer();
		String line = "";
		try {
			Process proc = Runtime.getRuntime().exec(cmd);
			InputStreamReader is = new InputStreamReader(proc.getInputStream());
			BufferedReader br = new BufferedReader(is);
			while ((line = br.readLine()) != null) {
				result .append( line);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result.toString();
	}

	
	/**
	 * @Author:wangming
	 * @Description:(描述方法的用途)
	 * @param cmd 第一个命令
	 * @param another 第二个命令 
	 * @return 第二个命令的执行结果
	 * @since 2015年12月6日 下午8:37:19
	 */
	public static String callCmd(String[] cmd, String[] another) {
		StringBuffer result = new StringBuffer();
		String line = "";
		try {
			Runtime rt = Runtime.getRuntime();
			Process proc = rt.exec(cmd);
			proc.waitFor();
			// 已经执行完第一个命令，准备执行第二个命令
			proc = rt.exec(another);
			InputStreamReader is = new InputStreamReader(proc.getInputStream());
			BufferedReader br = new BufferedReader(is);
			while ((line = br.readLine()) != null) {
				result.append(line);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result.toString();
	}

	
	/**
	 * @Author:wangming
	 * @Description:(描述方法的用途)
	 * @param ip 目标ip,一般在局域网内
	 * @param sourceString 命令处理的结果字符串
	 * @param macSeparator mac分隔符号
	 * @return mac地址，用上面的分隔符号表示
	 * @since 2015年12月6日 下午8:38:40
	 */
	public static String filterMacAddress(final String ip, final String sourceString, final String macSeparator) {
		StringBuffer result = new StringBuffer();
		String regExp = "((([0-9,A-F,a-f]{1,2}" + macSeparator + "){1,5})[0-9,A-F,a-f]{1,2})";
		Pattern pattern = Pattern.compile(regExp);
		Matcher matcher = pattern.matcher(sourceString);
		while (matcher.find()) {
			result .append( matcher.group(1));
			if (sourceString.indexOf(ip) <= sourceString.lastIndexOf(matcher.group(1))) {
				break;
				// 如果有多个IP,只匹配本IP对应的Mac.
			}
		}
		return result.toString();
	}

	/**
	 * @Author:wangming
	 * @Description:(描述方法的用途)
	 * @param ip 目标ip *
	 * @return Mac Address *
	 * @since 2015年12月6日 下午8:39:57
	 */
	public static String getMacInWindows(final String ip) {
		String result = "";
		String[] cmd = { "cmd", "/c", "ping " + ip };
		String[] another = { "cmd", "/c", "arp -a" };
		String cmdResult = callCmd(cmd, another);
		result = filterMacAddress(ip, cmdResult, "-");
		return result;
	}

	/**
	 * @Author:wangming
	 * @Description:(描述方法的用途)
	 * @param ip 目标ip *
	 * @return Mac Address *
	 * @since 2015年12月6日 下午8:39:57
	 */
	public static String getMacInLinux(final String ip) {
		String result = "";
		String[] cmd = { "/bin/sh", "-c", "ping " + ip + " -c 2 && arp -a" };
		String cmdResult = callCmd(cmd);
		result = filterMacAddress(ip, cmdResult, ":");
		return result;
	}

	/**
	 * @Author:wangming
	 * @Description:(描述方法的用途)
	 * @param ip 目标ip *
	 * @return Mac Address *
	 * @since 2015年12月6日 下午8:39:57
	 */
	public static String getMacAddress(String ip) {
		String macAddress = "";
		macAddress = getMacInWindows(ip).trim();
		if (macAddress == null || "".equals(macAddress)) {
			macAddress = getMacInLinux(ip).trim();
		}
		return macAddress;
	}


}