package com.misaka.libmanager.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.misaka.libmanager.po.User;
import com.misaka.libmanager.util.DBUtil;
public class UserDao {
	public boolean isExists(String account,String pwd) {
		boolean isExists = false; 
		String sql = "select * from User where account = \""+account+"\" and password = \""+pwd+"\"";
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConn();
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			if (rs.next())
				isExists = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.release(conn, st, rs);  
		}
		return isExists;
	}
	public boolean isExists(String account) {
		boolean isExists = false; 
		String sql = "select * from User where account = \""+account+"\"";
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConn();
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			if (rs.next())
				isExists = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.release(conn, st, rs);  
		}
		return isExists;
	}
	public void insertUser(String account,String pwd) {
		User user = new User(account,pwd,0);
		
		String sql = "insert into user value("+user.toString()+")";
		Connection conn = null;
		Statement st = null;
		
		conn = DBUtil.getConn();
		try {
			st = conn.createStatement();
			st.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public int isAdmin(String account) {
		String sql = "select admin from user where account = "+"'"+account+"'";
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		int x = 0;
		try {
			conn = DBUtil.getConn();
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			if (rs.next()) {
				x = rs.getInt("admin");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.release(conn, st, rs);  
		}
		return x;
	}
	public List<User> allUsers() {
		List<User> userList = new ArrayList<User>();
		String sql = "select * from user";
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConn();
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				String account = rs.getString("account");
				int admin = rs.getInt("admin");
				String pwd = rs.getString("password");
				userList.add(new User(account,pwd,admin)); 
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.release(conn, st, rs);  
		}
		return userList;
	}
	public void delUser(String account) {
		String sql = "delete from user where account = "+"'"+account+"'";
		Connection conn = null;
		Statement st = null;
		
		conn = DBUtil.getConn();
		try {
			st = conn.createStatement();
			st.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
