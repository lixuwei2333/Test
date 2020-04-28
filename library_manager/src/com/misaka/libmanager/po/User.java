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
}
