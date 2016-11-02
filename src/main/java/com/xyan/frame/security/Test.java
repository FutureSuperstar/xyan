package com.xyan.frame.security;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class Test {
	
	@SuppressWarnings("resource")
	public static void main(String[] args) throws IOException {
		File file=new File("d:/tmp/VB(加密).rmvb");
		FileInputStream in=new FileInputStream(file);
		FileOutputStream out=new FileOutputStream("d:/tmp/VB.rmvb");
		byte[] buff=new byte[1024];
		int len=0;
		while(len!=-1){
			len=in.read(buff);
			String ciphertext=SecureUtil.base64Decode(new String(buff));
			System.out.println(ciphertext);
			out.write(ciphertext.getBytes());
		}
	}
}
