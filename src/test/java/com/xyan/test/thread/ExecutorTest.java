package com.xyan.test.thread;

import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

public class ExecutorTest {
    public static void main(String[] args) {
        Runnable hello = new Runnable() {
			@Override
			public void run() {
				 for (int i = 0; i < 100; i++) {
		                System.out.println(i + " hello");
		            }
				
			}
        };
        Runnable bye = new Runnable(){
			@Override
			public void run() {
				for (int i = 0; i < 100; i++) {
	                System.out.println(i + " bye");
	            }				
			}
        };
        //Executor executor = Executors.newCachedThreadPool();
        //Executor executor = Executors.newFixedThreadPool(5);
        //Executor executor = Executors.newSingleThreadScheduledExecutor();
        Executor executor = Executors.newScheduledThreadPool(5);
        executor.execute(hello);
        executor.execute(bye);

    }
}