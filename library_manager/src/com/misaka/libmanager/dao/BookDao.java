package com.misaka.libmanager.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.misaka.libmanager.po.Book;
import com.misaka.libmanager.util.DBUtil;

public class BookDao {
	public boolean isExists(String id) {
		boolean isExists = false; 
		String sql = "select * from book where id = \""+id+"\"";
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
	public void addBook(String id,String name) {
		Book book = new Book(id,name,1);
		
		String sql = "insert into book value("+book.toString()+")";
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
	public void delBook(String id) {
		String sql = "delete from book where id = "+"'"+id+"'";
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
	public String qName(String id) {
		String sql = "select name from book where id = "+"'"+id+"'";
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		String x = "";
		try {
			conn = DBUtil.getConn();
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			if (rs.next()) {
				x = rs.getString("name");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.release(conn, st, rs);  
		}
		return x;
	}
	public int qFlag(String id) {
		String sql = "select flag from book where id = "+"'"+id+"'";
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		int x = 0;
		try {
			conn = DBUtil.getConn();
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			if (rs.next()) {
				x = rs.getInt("flag");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.release(conn, st, rs);  
		}
		return x;
	}
	public void setflag(String id,int i) {
		String sql = "update book set flag = "+i+" where id = "+"'"+id+"'";
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
	
	public List<Book> allBooks() {
		List<Book> bookList = new ArrayList<Book>();
		String sql = "select * from book";
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConn();
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("name");
				int flag = rs.getInt("flag");
				bookList.add(new Book(id,name,flag)); 
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.release(conn, st, rs);  
		}
		return bookList;
	}
}
