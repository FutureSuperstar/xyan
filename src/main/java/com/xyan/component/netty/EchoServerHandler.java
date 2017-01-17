package com.xyan.component.netty;

import io.netty.buffer.ByteBuf;
import io.netty.buffer.Unpooled;
import io.netty.channel.ChannelHandler;
import io.netty.channel.ChannelHandlerAdapter;
import io.netty.channel.ChannelHandlerContext;

public class EchoServerHandler extends ChannelHandlerAdapter implements ChannelHandler {
	
	@Override
	public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception {
		String response=""+msg+"$_";
		ByteBuf echo=Unpooled.copiedBuffer(response.getBytes());
		ctx.writeAndFlush(echo);
	}
	
	@Override
	public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception {
		cause.printStackTrace();
		ctx.close();
	}
}
