package com.xyan.test.proxy;

public class Test {

	// 编写一个函数fun(a,b)接受两个字符串参数，以字符串的形式返回这两个字符串都包含的字符。请编写两个版本一个O(N^2)和一个O(N)的算法复杂度。
	private static final int SIZE = Character.SIZE;

	public static void main(String[] args) {
		String a = "#abcdefgaaa";
		String b = "lmnopcxbyacccc";
		String c = commonSubSequence(a, b);// abc
		System.out.println(c);
	}

	
	public static String common(String a,String b){
		return b;
	}
	
	
	
	// return the common sequence of string 'a' and string 'b'.In the order of
	// string 'a'
	public static String commonSubSequence(String a, String b) {
		if (a == null || b == null || a.length() == 0 || b.length() == 0) {
			return null;
		}
		int[] c = new int[1 << SIZE];// char[65536].Is it too large?
		char min = Character.MIN_VALUE;
		char[] x = a.toCharArray();
		char[] y = b.toCharArray();
		char[] z = new char[a.length()];// the result char sequence

		for (int i = 0, len = y.length; i < len; i++) {
			int pos = y[i] - min;
			c[pos] = 1;
		}
		int j = 0;
		for (int i = 0, len = x.length; i < len; i++) {
			int pos = x[i] - min;
			if (c[pos] == 1) {
				c[pos] = 0;
				z[j++] = x[i];
			}
		}

		return new String(z, 0, j);
	}
}
