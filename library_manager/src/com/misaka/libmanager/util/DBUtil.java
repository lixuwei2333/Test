package com.misaka.libmanager.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil {
	//jdbc:mysql://localhost:3306ch?useUnicode=true&characterEncoding=UTF-8
	static String driverClass = "com.mysql.jdbc.Driver";
	static String url = "jdbc:mysql://localhost:3306/lm?useUnicode=true&characterEncoding=UTF-8";
	static String name = "root";
	static String password = "123456";
	/*
	 * 获取连接对象
	 */
	public static Connection getConn() {
		Connection conn = null;
		try {
			Class.forName(driverClass);
			conn = DriverManager.getConnection(url, name, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	/*
	 * 释放资源
	 */
	public static void release(Connection conn,Statement st, ResultSet rs) {
		closeRs(rs);
		closeSt(st);
		closeConn(conn);
	}
	private static void closeRs(ResultSet rs) {
		try {
			if(rs!=null) {
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			rs = null;
		}
	}
	private static void closeSt(Statement st) {
		try {
			if(st!=null) {
				st.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			st = null;
		}
	}
	private static void closeConn(Connection conn) {
		try {
			if(conn!=null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conn = null;
		}
	}
}
