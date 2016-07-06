package com.xyan.test.proxy;

  
public class TestProxy {  
  
    public static void main(String[] args) {  
    	PersonProxy proxy=new PersonProxy();
    	Person person=(Person) proxy.bind(new Man());
    	person.hello();
    }  
  
}