package com.xyan.component.netty;

import io.netty.buffer.ByteBuf;
import io.netty.channel.ChannelHandlerAdapter;
import io.netty.channel.ChannelHandlerContext;
import io.netty.util.ReferenceCountUtil;

public class DiscardServerHandler extends ChannelHandlerAdapter{
	
	@Override
	public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception {
		try {
			//do something
			ByteBuf in = (ByteBuf) msg;
			//System.out.println(in.toString(io.netty.util.CharsetUtil.US_ASCII));
			ctx.write(msg);
			ctx.flush();
		} finally {
			//ReferenceCountUtil.release(msg);
		}
	}
	
	
	@Override
	public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception {
		//super.exceptionCaught(ctx, cause);
		cause.printStackTrace();
		ctx.close();
	}
}
