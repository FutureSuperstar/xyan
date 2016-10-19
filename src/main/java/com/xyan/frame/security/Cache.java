package com.xyan.frame.security;

import java.util.Date;
import java.util.HashMap;

public class Cache {
	
	private static HashMap<String, Date> cache=new HashMap<>();
	
	public static void initCache(){
		cache=new HashMap<>();
	}
	
	public static void put(String ip){
		cache.put(ip, new Date());
	}
	
	public static void remove(String ip){
		cache.remove(ip);
	}
	
	public static Date get(String ip){
		return cache.get(ip);
	}
	
	public static void reset(HashMap<String, Date> cache){
		Cache.cache=cache;
	}
	
	public static HashMap<String, Date> getCache(){
		return cache;
	}
}
