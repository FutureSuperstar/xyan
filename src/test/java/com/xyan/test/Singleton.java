package com.xyan.test;

public class Singleton {
	
	private Singleton() {
		
	}
	
	public static class Inner{
		private static Singleton singleton=new Singleton();
		
		public static Singleton getInstance(){
			return singleton;
		}
	}
	
	public static void main(String[] args) {
		int i=0,j=2;
		System.out.println(i+++j);
	}
}
