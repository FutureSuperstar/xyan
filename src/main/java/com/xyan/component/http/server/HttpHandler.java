package com.xyan.component.http.server;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.SelectionKey;
import java.nio.channels.ServerSocketChannel;
import java.nio.channels.SocketChannel;
import java.nio.charset.Charset;

public class HttpHandler implements Runnable {
	

	private int bufferSize=1024;
	private String localCharset="UTF-8";
	private SelectionKey key;
	public HttpHandler() {
	}
	
	public HttpHandler(SelectionKey key) {
		this.key=key;
	}
	
	public void accept() throws IOException{
		SocketChannel channel=((ServerSocketChannel)key.channel()).accept();
		channel.configureBlocking(false);
		channel.register(key.selector(), SelectionKey.OP_READ, ByteBuffer.allocate(bufferSize));
	}
	
	public void read() throws IOException{
		SocketChannel channel=(SocketChannel)key.channel();
		ByteBuffer buffer=(ByteBuffer) key.attachment();
		buffer.clear();
		if(channel.read(buffer)==-1){
			channel.close();
		}else{
			buffer.flip();
			String reveive=Charset.forName(localCharset).newDecoder().decode(buffer).toString();
			String[] messges=reveive.split("\r\n");
			for (String mess : messges) {
				System.out.println(mess);
				if(mess.isEmpty()){
					break;
				}
			}
			
			StringBuilder builder=new StringBuilder();
			builder.append("HTTP/1.1 200 OK\r\n");//响应报文首行，200
			builder.append("Content-Type:text/html;charset="+localCharset+"\r\n");
			builder.append("\r\n");
			//报文头结束
			builder.append("<html><head><title>显示报文</title></head><body>");
			builder.append("接收到的报文是：<br>");
			for (String mess : messges) {
				builder.append(mess+"<br>");
			}
			builder.append("</body></html>");
			buffer=ByteBuffer.wrap(builder.toString().getBytes(localCharset));
			channel.write(buffer);
			channel.close();
		}
	}
	
	@Override
	public void run() {
			try {
				if(key.isAcceptable()){
					accept();
				}
				if(key.isReadable()){
					read();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
	}

}
