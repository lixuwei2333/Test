package com.misaka.libmanager.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.misaka.libmanager.po.Borrow;
import com.misaka.libmanager.util.DBUtil;

public class BorrowDao {
	public List<Borrow> allBorrows() {
		List<Borrow> borrowList = new ArrayList<Borrow>();
		String sql = "select * from borrow";
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConn();
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				String id = rs.getString("id");
				String account = rs.getString("account");
				Date t = rs.getDate("time");
				borrowList.add(new Borrow(id,account,t)); 
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.release(conn, st, rs);  
		}
		return borrowList;
	}
	public void addBorrow(Borrow borrow) {		
		String sql = "insert into borrow value("+borrow.toString()+")";
		System.out.println(sql);
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
	public void delBorrow(Borrow borrow) {		
		String sql = "delete from borrow where id = "+"'"+borrow.getId()+"'"+" and account ="+"'"+borrow.getAccount()+"'";
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
	public boolean isExists(String id,String account) {
		boolean isExists = false; 
		String sql = "select * from borrow where id = \""+id+"\""+" and account = "+"'"+account+"'";
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
	
}
