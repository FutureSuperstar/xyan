package com.xyan.test.obj;

public class Test {
	
	public static void main(String[] args) {
		for (int i = 0; i < 20; i++) {
			System.out.println(new Test());
		}
		System.out.println("-------------------------------------");
		
		for (int i = 0; i < 20; i++) {
			//System.out.println(Singleton.Holder.INSTANCE.getInstance());
		}
	}
	
	
}

