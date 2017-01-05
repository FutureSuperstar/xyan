package com.xyan.frame.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.text.SimpleDateFormat;
import java.util.Date;

/**文件工具类*/
public class FileUtil {

	
	
	public static  String getFileName(String realFolder,String fileName,String suffix,String prefix){
		File file=new File(realFolder+File.separator+prefix+"."+suffix);
		if(file.exists()){
			prefix+="(1)";
			return getFileName(realFolder, fileName, suffix, prefix);
		}else{
			return prefix;
		}
	}
	
	/**
	 * @Author：wangming
	 * @Description：
	 * @param file：文件
	 * @return
	 * @since 2017年1月5日下午2:23:50
	 */
	public static String getFileExtName(String file){
		int pos = file.lastIndexOf(".");
		if (pos == -1) {
			return file;
		}
		return file.substring(pos + 1);
	}
	
	/**
	 * 写文件
	 * @param content 文件内容
	 * @param file 文件名
	 */
	public static void writeFile(byte[] content, String file) {
		try {
			File f = new File(file).getParentFile();
			if (!f.exists()) {
				f.mkdirs();
			}
			FileOutputStream fos = new FileOutputStream(file);
			fos.write(content, 0, content.length);
			fos.flush();
			fos.close();
		} catch (IOException ex) {
			throw new RuntimeException(ex);
		}
	}
	
	/**
	 *@Auhor:创建目录
	 *@Description:(用一句话描述)
	 *@param dir
	 *@Date:2016年4月18日 上午10:26:51
	 */
	public static void createDir(String dir){
		File file=new File(dir);
		if(!file.exists()){
			file.mkdirs();
		}
	}
	
	public static void log(String key,String content) throws IOException{
		File logFile=new File(SystemUtil.getProperty("file.log.path")+new SimpleDateFormat("yyyy-MM-dd").format(new Date())+".log");
		if(!logFile.exists()){
			logFile.createNewFile();
		}
		Writer out=new BufferedWriter(new FileWriter(logFile,true));
		out.write("\n"+key+"\n");
		out.write(content);
		out.close();
	}
}
