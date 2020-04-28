package com.misaka.libmanager.po;

public class Book {
	private String id;
	private String name;
	int flag;
	public Book(String id, String name,int flag) {
		super();
		this.id = id;
		this.flag = flag;
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
		/*我在这加注释*/
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getFlag() {
		return flag;
	}
	public String toString() {
		return "'"+id+"'"+","+"'"+name+"',"+"'"+flag+"'";
	}
}
