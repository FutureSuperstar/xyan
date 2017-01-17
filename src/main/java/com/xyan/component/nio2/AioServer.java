package com.xyan.component.nio2;

public class AioServer {
	
	public static void main(String[] args) {
		int port=8080;
		AsyncServerHandler serverHandler=new AsyncServerHandler(port);
		new Thread(serverHandler, "AIO-AsyncTimeServerHandler-001").start();
	}
}
