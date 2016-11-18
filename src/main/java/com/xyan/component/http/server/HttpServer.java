package com.xyan.component.http.server;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.nio.channels.SelectionKey;
import java.nio.channels.Selector;
import java.nio.channels.ServerSocketChannel;
import java.util.Iterator;

/**
 * @author wangming
 * 主服务器
 */
public class HttpServer {
	
	public static void main(String[] args) throws IOException {
		ServerSocketChannel serverSocketChannel=ServerSocketChannel.open();
		serverSocketChannel.socket().bind(new InetSocketAddress(8080));
		serverSocketChannel.configureBlocking(false);
		Selector selector=Selector.open();
		
		serverSocketChannel.register(selector, SelectionKey.OP_ACCEPT);
		
		while(true){
			if(selector.select(3000)==0){//每三秒检查一次，如果没有就继续
				continue;
			}
			Iterator<SelectionKey> keys=selector.selectedKeys().iterator();
			while (keys.hasNext()) {
				SelectionKey selectionKey = (SelectionKey) keys.next();
				new Thread(new HttpHandler(selectionKey)).start();
				keys.remove();
			}
		}
	}
}
