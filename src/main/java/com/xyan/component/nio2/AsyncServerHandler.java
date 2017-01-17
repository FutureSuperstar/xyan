package com.xyan.component.nio2;

import java.net.InetSocketAddress;
import java.nio.ByteBuffer;
import java.nio.channels.AsynchronousServerSocketChannel;
import java.nio.channels.AsynchronousSocketChannel;
import java.nio.channels.CompletionHandler;


public class AsyncServerHandler implements Runnable{

	AsynchronousServerSocketChannel serverSocketChannel;
	
	public AsyncServerHandler(int port) {
		try {
			serverSocketChannel=AsynchronousServerSocketChannel.open();
			serverSocketChannel.bind(new InetSocketAddress(port));
			System.out.println("The time server is start in port : " + port);
		} catch (Exception e) {
			System.err.println("The time server is failed start in port : " + port);
		}
	}

	@Override
	public void run() {
		serverSocketChannel.accept(this,new CompletionHandler<AsynchronousSocketChannel, AsyncServerHandler>() {
			@Override
			public void completed(AsynchronousSocketChannel result, AsyncServerHandler attachment) {
				attachment.serverSocketChannel.accept(attachment, this);
				ByteBuffer buffer = ByteBuffer.allocate(1024);
				result.read(buffer, buffer, new ReadCompletionHandler(result));
			}

			@Override
			public void failed(Throwable exc, AsyncServerHandler attachment) {
				
			}
		});
	}

}
