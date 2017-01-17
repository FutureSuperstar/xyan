package com.xyan.component.netty;

import io.netty.buffer.Unpooled;
import io.netty.channel.ChannelHandler;
import io.netty.channel.ChannelHandlerAdapter;
import io.netty.channel.ChannelHandlerContext;

public class EchoClientHandler extends ChannelHandlerAdapter implements ChannelHandler {
	 @Override
	public void channelActive(ChannelHandlerContext ctx) throws Exception {
		 ctx.writeAndFlush(Unpooled.copiedBuffer("Welcome to Netty.$_".getBytes()));
	}
	 
	 @Override
	public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception {
		 System.out.println("received from server:"+msg);
	}
	 
	 @Override
	public void channelReadComplete(ChannelHandlerContext ctx) throws Exception {
		 ctx.flush();
	}
	 @Override
	public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception {
		 cause.printStackTrace();
		 ctx.close();
	}
}
