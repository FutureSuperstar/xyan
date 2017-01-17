package com.xyan.component.netty;

import io.netty.buffer.ByteBuf;
import io.netty.buffer.Unpooled;
import io.netty.channel.ChannelHandler;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;
import io.netty.handler.codec.http.DefaultFullHttpResponse;
import io.netty.handler.codec.http.FullHttpRequest;
import io.netty.handler.codec.http.FullHttpResponse;
import io.netty.handler.codec.http.HttpResponseStatus;
import io.netty.handler.codec.http.HttpVersion;

public class HttpServerHandler extends SimpleChannelInboundHandler<FullHttpRequest> implements ChannelHandler {

	@Override
	protected void messageReceived(ChannelHandlerContext ctx, FullHttpRequest msg) throws Exception {
		System.out.println("请求路径："+msg.uri());
		System.out.println("服务端接受到消息："+msg);
		sendHttpResponse(ctx, msg, new DefaultFullHttpResponse(HttpVersion.HTTP_1_1,HttpResponseStatus.OK));
	}
	
	@Override
	public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception {
		cause.printStackTrace();
		ctx.close();
	}
	
	private void sendHttpResponse(ChannelHandlerContext ctx,FullHttpRequest req,FullHttpResponse response){
		response.headers().set("Content-Type","text/html;charset=UTF-8");
		ByteBuf text=Unpooled.copiedBuffer("\r\n这是我的第一个http服务器！".getBytes());
		response.content().writeBytes(text);
		text.release();
		//response.headers().setInt("Content-Length",response.content().readableBytes());
		ctx.channel().writeAndFlush(response);
		System.out.println("发送响应到客户端");
	}
	
	@Override
	public void channelReadComplete(ChannelHandlerContext ctx) throws Exception {
		ctx.flush();
		System.out.println("服务器readComplete 响应完成");
	}

}
