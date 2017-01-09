package com.xyan.test.nio2;

public class Test {

	public static strictfp double devide(double a,double b){
		return a-b;
	}
	
	public static  double devide2(double a,double b){
		return a-b;
	}
	
	public static void main(String[] args) {
		System.out.println(devide(2, 1.1));
		System.out.println(devide2(2, 1.1));
	}

}