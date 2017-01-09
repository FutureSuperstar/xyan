package com.xyan.test.thread;

import java.util.concurrent.BrokenBarrierException;
import java.util.concurrent.CyclicBarrier;

public class CyclicBarrierTest  {
	static int parties=10;
	public static void main(String[] args) {
		CyclicBarrier barrier=new CyclicBarrier(parties);
		for (int i = 0; i < parties; i++) {
			new MyThread(i+"号", barrier).start();
		}
	}
	
	static class MyThread extends Thread{
		private CyclicBarrier barrier=null;
		private String name;
		public MyThread(String name,CyclicBarrier barrier) {
			this.name=name;
			this.barrier=barrier;
		}
		
		public void run() {
			try {
				System.out.println(name+":到达");
				barrier.await();
			} catch (InterruptedException | BrokenBarrierException e) {
				e.printStackTrace();
			}
			System.out.println(name+":起跑");
			
		}
	}
}

