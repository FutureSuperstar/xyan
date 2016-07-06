package com.xyan.test;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Vector;

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
		int len=100;
		/*long start1=System.currentTimeMillis();
		List<Integer> list1=new ArrayList<>();
		new Thread(new AddUnit(len, list1),"add ArrayList").start();
		Thread t1=new Thread(new ReadUnit(len,list1),"read ArrayList");
		t1.start();
		t1.join();
		long end1=System.currentTimeMillis();
		System.out.println("arrayList耗时："+(end1-start1));
		
		
		long start2=System.currentTimeMillis();
		List<Integer> list2=new LinkedList<>();
		new Thread(new AddUnit(len, list2),"add LinkedList").start();
		Thread t2=new Thread(new ReadUnit(len,list2),"read LinkedList");
		t2.start();
		t2.join();
		long end2=System.currentTimeMillis();
		System.out.println("linkedList耗时："+(end2-start2));
		*/
		
		long start3=System.currentTimeMillis();
		List<Integer> list3=new Vector<>();
		new Thread(new AddUnit(len, list3),"add Vector").start();
		Thread t3=new Thread(new ReadUnit(len,list3),"read Vector");
		t3.start();
		t3.join();
		long end3=System.currentTimeMillis();
		System.out.println("vector耗时："+(end3-start3));
		
		String name=Thread.currentThread().getName();
		System.out.println(name);
	}
}
