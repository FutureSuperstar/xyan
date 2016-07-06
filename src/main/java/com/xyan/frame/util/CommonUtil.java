package com.xyan.frame.util;

import java.util.List;

public class CommonUtil {

	public static boolean isEmpty(List<?> list) {
		if(list==null||list.size()<1){
			return true;
		}else{
			boolean flag=true;
			for (int i = 0; i < list.size(); i++) {
				if(list.get(i)!=null){
					flag=false;
					break;
				}
			}
			return flag;
		}
	}

}
