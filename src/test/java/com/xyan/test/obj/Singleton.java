package com.xyan.test.obj;

public class Singleton{
	
	enum Holder {
		
		INSTANCE;
		
		private Singleton instance;
		
		Holder() {
			instance = new Singleton();
		}
		
		public Singleton getInstance() {
			return instance;
		}
	}
}

