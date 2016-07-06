package com.xyan.frame.feature.mybatis.dialect;

import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.session.Configuration;

/**
 * 数据库方言工厂,产生方言对象
 * 
 * @author wangming
 * @since 2014年5月18日 下午1:32:23
 **/
public class DialectFactory {

    public static String dialectClass = null;

    public static Dialect buildDialect(Configuration configuration) {
        if (dialectClass == null) {
            synchronized (DialectFactory.class) {
                if (dialectClass == null) {
                    dialectClass = configuration.getVariables().getProperty("dialectClass");
                }
            }
        }
        Dialect dialect = null;
        try {
            dialect = (Dialect) Class.forName(dialectClass).newInstance();
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("请检查 mybatis-config.xml 中  dialectClass 是否配置正确?");
        }
        return dialect;
    }
    
    public static DBMS getDataBaseType(Configuration configuration){
    	 if (dialectClass == null) {
             synchronized (DialectFactory.class) {
                 if (dialectClass == null) {
                     dialectClass = configuration.getVariables().getProperty("dialectClass");
                 }
             }
         }
    	 if(StringUtils.containsIgnoreCase(dialectClass, "mysql")){
    		 return DBMS.MYSQL;
    	 }else if(StringUtils.containsIgnoreCase(dialectClass, "oracle")){
    		 return DBMS.ORACLE;
    	 }else if(StringUtils.containsIgnoreCase(dialectClass, "DB2")){
    		 return DBMS.DB2;
    	 }else if(StringUtils.containsIgnoreCase(dialectClass, "H2")){
    		 return DBMS.H2;
    	 }else if(StringUtils.containsIgnoreCase(dialectClass, "HSQL")){
    		 return DBMS.HSQL;
    	 }else if(StringUtils.containsIgnoreCase(dialectClass, "POSTGRE")){
    		 return DBMS.POSTGRE;
    	 }else if(StringUtils.containsIgnoreCase(dialectClass, "SQLSERVER")){
    		 return DBMS.SQLSERVER;
    	 }else if(StringUtils.containsIgnoreCase(dialectClass, "SQLSERVER2005")){
    		 return DBMS.SQLSERVER2005;
    	 }else if(StringUtils.containsIgnoreCase(dialectClass, "SYBASE")){
    		 return DBMS.SYBASE;
    	 }else{
    		 return DBMS.EX;
    	 }
    }
}
