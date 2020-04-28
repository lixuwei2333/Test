package com.misaka.libmanager.po;

public class User {
	private String account;
	private String password;
	private int admin;
	public User(String account, String password, int admin) {
		super();
		this.account = account;
		this.password = password;
		this.admin = admin;
	}
	public User(String account, String password) {
		super();
		this.account = account;
		this.password = password;
	}


	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getAdmin() {
		return admin;
	}
	public void setAdmin(int admin) {
		this.admin = admin;
	}
	public String toString() {
		String re ="'"+account+"'"+","+"'"+password+"'"+",0";
		return re;
	}
}
