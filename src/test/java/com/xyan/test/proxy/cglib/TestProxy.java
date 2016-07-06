package com.xyan.test.proxy.cglib;

  
public class TestProxy {  
  
    public static void main(String[] args) {  
    	PersonProxyCglib proxy=new PersonProxyCglib();
    	Man man=(Man) proxy.getInstance(new Man());
    	man.hello();
    }  
  
}