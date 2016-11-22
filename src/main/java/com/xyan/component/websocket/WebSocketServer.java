package com.xyan.component.websocket;
import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.ServerSocket;
import java.nio.ByteBuffer;
import java.nio.channels.SelectionKey;
import java.nio.channels.Selector;
import java.nio.channels.ServerSocketChannel;
import java.nio.channels.SocketChannel;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import com.xyan.frame.security.SecureUtil;
import com.xyan.frame.util.SHA1Utils;

public class WebSocketServer {

	private ServerSocketChannel ssc;
	private Selector selector;
	private Set<SocketChannel> keylist = Collections
			.synchronizedSet(new HashSet<SocketChannel>());

	public WebSocketServer() throws IOException {
		init();
	}

	private void init() throws IOException {
		ssc = ServerSocketChannel.open();
		ServerSocket ss = ssc.socket();
		ss.bind(new InetSocketAddress(9020));
		selector = Selector.open();
		ssc.configureBlocking(false);
		ssc.register(selector, SelectionKey.OP_ACCEPT);

		if (ssc.isOpen() && selector.isOpen()) {
			System.out.println("listening port:" + 9020 + "....");
			polling();
		}
	}

	private void polling() throws IOException {

		while (true) {
			try {
				int n = selector.select();
				if (n == 0) {
					continue;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			Iterator<SelectionKey> keys = selector.selectedKeys().iterator();

			while (keys.hasNext()) {
				SelectionKey key = keys.next();
				keys.remove();
				if (key.isAcceptable()) {
					acceptOperation(key);

				} else if (key.isReadable()) {
					readOperation(key);
				}else if(key.isWritable()){
					writeOperation(key);
				}
			}
		}
	}

	private void writeOperation(SelectionKey key) {
		// TODO Auto-generated method stub
		
	}

	private void acceptOperation(SelectionKey key) throws IOException {

		ServerSocketChannel server = (ServerSocketChannel) key.channel();
		SocketChannel client = server.accept();
		client.configureBlocking(false);
		client.register(selector, SelectionKey.OP_READ);
		System.out.println("coming:  " + client.socket().getReuseAddress());
		
		// 保存连接上的client
		keylist.add(client);
		
		/**welcome the clients*/
		ByteBuffer dst = ByteBuffer.allocate(1024);
		StringBuilder sb = new StringBuilder("client:");
		sb.append(client + "arrival");
		dst.put(sb.toString().getBytes());
		dst.flip();
		broadcast(keylist, dst, client);
		
	}

	private void readOperation(SelectionKey key) throws IOException {
		
		SocketChannel client = (SocketChannel) key.channel();
		ByteBuffer dst = ByteBuffer.allocate(1024);
		int n = -1;
		try {
			n = client.read(dst);
		} catch (Exception ex) {
			System.err.println("client has disconnect...");
		}
		if (n == -1) {
			System.out.println(client.socket().getRemoteSocketAddress()+" leave.............");
			key.cancel();
			client.close();
			keylist.remove(client);
			return;
		}
		dst.flip();
		StringBuilder sb = new StringBuilder();
		if (dst.hasRemaining()) {
			while (dst.hasRemaining()) {
				sb.append((char) dst.get());
			}
			if (sb.toString().contains("HTTP/1.1")) {
				dst.flip();
				/**处理协议*/
				ByteBuffer buffer = processProtocol(dst);
				writeHTTP(keylist, buffer, client);
			} else {
				dst.flip();
				broadcast(keylist, dst, client);
			}
		}
		System.out.println("receive:-----------------\r\n"+sb.toString()+"\r\n");	
		
		dst.clear();
	}

	private ByteBuffer processProtocol(ByteBuffer dst) {
		StringBuilder request=new StringBuilder();
		
		while(dst.hasRemaining()){
			request.append((char)dst.get());
		}

		/**Sec-WebSocket-Key*/
		int keyindex=request.indexOf("Sec-WebSocket-Key:");
		String key=request.substring(keyindex+19,keyindex+43);
		System.out.println("Sec-WebSocket-Key:"+key);
		
		/**计算结果*/
		String new_key=key+"258EAFA5-E914-47DA-95CA-C5AB0DC85B11";
		byte[] key_sha1=SHA1Utils.SHA1(new_key);
		String result=SecureUtil.base64Encode(new String(key_sha1));
		
		/**返回协议*/
		StringBuilder sb = new StringBuilder("HTTP/1.1 101 Switching Protocols\r\n");
		sb.append("Upgrade: websocket\r\n");
		sb.append("Connection: Upgrade\r\n");
		sb.append("Sec-WebSocket-Accept:"+result+"\r\n\r\n");

		ByteBuffer buffer = ByteBuffer.allocate(1024);
		buffer.put(sb.toString().getBytes());
		buffer.flip();
		System.out.println(sb.toString());
		return buffer;
	}

	private void writeHTTP(Set<SocketChannel> set, ByteBuffer dst, SocketChannel currentClient) throws IOException {
		currentClient.write(dst);
	}

	private void broadcast(Set<SocketChannel> set, ByteBuffer dst, SocketChannel currentClient) throws IOException {

		System.out.println("now has-" + set.size() + "-clients");
		Iterator<SocketChannel> iter = set.iterator();
		while (iter.hasNext()) {
			SocketChannel sc = iter.next();
			if (sc == currentClient) {
				continue;
			}
			try {
				sc.write(dst);
			} catch (IOException e) {
				continue;
			}
			dst.flip();
		}
	}

	
	public static void main(String[] args) throws IOException {
		WebSocketServer wss = new WebSocketServer();
	}
}