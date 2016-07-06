package com.xyan.frame.lang.net;

import java.io.IOException;

public class Test {
	public static void main(String[] args) {
		try {
			new MultipartThreadDownloador(
					"http://image.tianjimedia.com/uploadImages/2012/010/8O496A2M2F2C.jpg",
					"d:/tmp/2016-06-01", "12.jpg", 2).download();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
}
