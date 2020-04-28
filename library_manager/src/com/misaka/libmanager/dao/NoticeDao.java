package com.misaka.libmanager.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.misaka.libmanager.po.Notice;
import com.misaka.libmanager.util.DBUtil;

public class NoticeDao {
	public void delNotice(String id) {
		String sql = "delete from notice where id = "+"'"+id+"'";
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
	public boolean isExists(String id) {
		boolean isExists = false; 
		String sql = "select * from notice where id = \""+id+"\"";
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
	public void addNotice(Notice notice) {		
		String sql = "insert into notice value("+notice.toString()+")";
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
	public List<Notice> allNotices() {
		List<Notice> noticeList = new ArrayList<Notice>();
		String sql = "select * from notice";
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConn();
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("content");
				Date t = rs.getDate("time");
				noticeList.add(new Notice(id,name,t)); 
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.release(conn, st, rs);  
		}
		return noticeList;
	}
}