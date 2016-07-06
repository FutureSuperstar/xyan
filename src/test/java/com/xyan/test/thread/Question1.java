package com.xyan.test.thread;

public class Question1 {
    /**
     * 判断是否为奇数
     * @param i
     * @return true 为奇数 false 为偶数
     */
    public static boolean isOdd(int i){
        return i%2==1;
    }
    /**
     * @param args
     */
    public static void main(String[] args) {
    	int i=Integer.MAX_VALUE-4;
    	System.out.println("i:::"+i);
        for(;i<=Integer.MAX_VALUE;++i){
            boolean isOdd=isOdd(i);
            System.out.println(String.format("i=%d,isOdd=%b", i, isOdd));
        }
    }
}