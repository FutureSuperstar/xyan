package com.xyan.component.nio2;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

public class FileUtil {
	
	/**
	 * @Author:wangming
	 * @Description: 复制文件
	 * @param source 源文件
	 * @param target 目标是一个存在的目标
	 * @throws IOException
	 * @since 2016年11月22日下午2:14:14
	 */
	public static void copy(Path source,Path target) throws IOException{
		Files.copy(source, target,StandardCopyOption.COPY_ATTRIBUTES);
	}
	
	public static void main(String[] args) {
		Path source=Paths.get("d:", "tmp/测试.txt");
		Path target=Paths.get("d:", "tmp/2016-11-22/你好.txt");
		try {
			copy(source, target);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
