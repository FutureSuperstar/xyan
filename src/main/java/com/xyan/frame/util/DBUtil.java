package com.xyan.frame.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/**
 * 		jdbc工具类，提供了获取连接，
 * 关闭连接的方法。
 *
 */
public class DBUtil {
	private static ThreadLocal<Connection>  connections = new ThreadLocal<Connection>();
	private static String className=null;
	private static String url=null;
	private static String username=null;
	private static String pwd=null;
	static{
		InputStream ips = DBUtil.class.getClassLoader().getResourceAsStream("application.properties");
		Properties props = new Properties();
		try {
			props.load(ips);
			className=props.getProperty("jdbc.driver");
			url=props.getProperty("jdbc.url");
			username=props.getProperty("jdbc.username");
			pwd=props.getProperty("jdbc.password");
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("读取db.properties文件失败");
		}finally{
			try {
				ips.close();
				ips=null;
			} catch (IOException e) {
				e.printStackTrace();
			}
			props=null;
		}
	}
	
	public static void beginTranaction() throws SQLException{
		try {
			Connection conn = getConnection();
			conn.setAutoCommit(false);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("启动事务失败");
			throw e;
		}
	}
	public static void commit() throws SQLException{
		try {
			Connection conn = getConnection();
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("提交事务失败");
			throw e;
		}finally{
			close();
		}
	}
	public static void rollback() throws SQLException{
		try {
			Connection conn = getConnection();
			conn.rollback();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("回滚事务失败");
			throw e;
		}finally{
			close();
		}
	}
	public static Connection getConnection() throws SQLException{
		Connection conn = connections.get();
		if(conn == null){
			conn = getConn();
			connections.set(conn);
		}
		return conn;
	}
	
	public static void close(){
		Connection conn = connections.get();
		if(conn != null){
			close(conn);
			connections.set(null);
		}
	}
	private static Connection getConn() throws SQLException{
		Connection conn = null;
		try {
			Class.forName(className);
			conn = DriverManager.getConnection(
					url,username,pwd);
		} catch (ClassNotFoundException e) {
			//记日志
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		return conn;
	}
	/**
	 * 关闭连接
	 */
	private static void close(Connection conn){
		if(conn != null){
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	/**
	 * @param args
	 * @throws SQLException 
	 */
	public static void main(String[] args) throws SQLException {
		System.out.println(getConnection());
	}
}

