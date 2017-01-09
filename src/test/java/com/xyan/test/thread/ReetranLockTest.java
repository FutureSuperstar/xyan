package com.xyan.test.thread;

import java.util.concurrent.locks.ReentrantLock;

class MyReetranLoc {
	
	int a=0;
	//ReentrantLock lock=new ReentrantLock();
	
	public void write(){
		//lock.lock();
		System.out.println(Thread.currentThread().getName()+"写："+a);
		a++;
		//lock.unlock();
	}
	
	public int read(){
		//lock.lock();
		int i=a;
		//lock.unlock();
		return i;
	}
}
class MyThread extends Thread{
	private MyReetranLoc loc;
	public MyThread(MyReetranLoc lock) {
		this.loc=lock;
	}
	
	@Override
	public void run() {
		loc.write();
		System.out.println(Thread.currentThread().getName()+"读："+loc.a);
	}
}

public class ReetranLockTest{
	
	public static void main(String[] args) {
		MyReetranLoc lock=new MyReetranLoc();
		MyThread t1=new MyThread(lock);
		MyThread t2=new MyThread(lock);
		MyThread t3=new MyThread(lock);
		t1.start();
		t2.start();
		t3.start();
		//System.out.println(lock.a);
	}
}

