package com.xyan.test;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.codec.digest.Md5Crypt;

class AddUnit implements Runnable{
	
	private  List<Integer> list;
	private int len;
	
	public AddUnit(int len,List<Integer> list) {
		this.len=len;
		this.list=list;
	}
	
	@Override
	public void run() {
		synchronized(list){
			System.out.println(new SimpleDateFormat("HH:mm:ss").format(new Date())+"\t"+Thread.currentThread().getName());
			for (int i=0;i<len;i++) {
				list.add(i);
			}
			System.out.println(new SimpleDateFormat("HH:mm:ss").format(new Date())+"\t"+Thread.currentThread().getName());
			list.notifyAll();
		}
		
	}
	
}

class ReadUnit implements Runnable{
	
	private  List<Integer> list;
	private int len;
	
	public ReadUnit(int len,List<Integer> list) {
		this.list=list;
		this.len=len;
	}
	
	@Override
	public void run() {
		synchronized(list){
			try {
				System.out.println(new SimpleDateFormat("HH:mm:ss").format(new Date())+"\t"+Thread.currentThread().getName());
				while(list.size()!=len){
					list.wait();
				}
				for (Integer integer : list) {
				}
				System.out.println(new SimpleDateFormat("HH:mm:ss").format(new Date())+"\t"+Thread.currentThread().getName());
				list.notifyAll();
				System.out.println(new SimpleDateFormat("HH:mm:ss").format(new Date())+"\t"+Thread.currentThread().getName());
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}
	
}


public class Test {
	
	public static void main(String[] args) throws InterruptedException {
		//TestDate.Inner in=new TestDate().new Inner();
		System.out.println(Md5Crypt.apr1Crypt(new String("123456").getBytes()));
	}
}
