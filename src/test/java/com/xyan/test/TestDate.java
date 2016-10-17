package com.xyan.test;

import java.util.Calendar;

public class TestDate {
		
	public static void main(String[] args) {
		Calendar now=Calendar.getInstance();
		Calendar start=(Calendar) now.clone();
		start.set(Calendar.MONTH, 7);
		start.set(Calendar.DAY_OF_MONTH, 11);
		long between=now.getTimeInMillis()-start.getTimeInMillis();
		between=between/(3600*1000*24);
		System.out.println(between);
		System.out.println(30*0.3);
	}
}
