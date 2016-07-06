package com.xyan.frame.util.poi;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.springframework.cglib.beans.BeanGenerator;
import org.springframework.cglib.beans.BeanMap;


/**
 * 动态实体类
 */
public class DynamicEntity {
	
	private Object object=null;
	private BeanMap beanmap=null;
	public DynamicEntity() {
	}
	
	@SuppressWarnings("rawtypes")
	public DynamicEntity(Map propertymap){
		this.object=generateBean(propertymap);
		this.beanmap=BeanMap.create(this.object);
	}
	
	public void setValue(String property,Object value){
		beanmap.put(property, value);
	}
	
	public Object getValue(String property){
		return beanmap.get(property);
	}
	
	public Object getObject(){
		return this.object;
	}
	@SuppressWarnings("rawtypes")
	private Object generateBean(Map propertymap) {
		BeanGenerator generator=new BeanGenerator();
		Set keySet=propertymap.keySet();
		for(Iterator it=keySet.iterator();it.hasNext();){
			String key=(String) it.next();
			generator.addProperty(key, (Class) propertymap.get(key));
		}
		return generator.create();
	}
}
