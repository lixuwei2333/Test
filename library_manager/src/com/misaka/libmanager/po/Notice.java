package com.misaka.libmanager.po;

import java.sql.Date;

public class Notice {
	private String id;
	private String content;
	private Date time;
	public Notice(String id, String content, Date time) {
		super();
		this.id = id;
		this.content = content;
		this.time = time;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String toString() {
		String re ="'"+id+"'"+","+"'"+time.toString()+"'"+",'"+content+"'";
		return re;
	}
	
}
