package com.misaka.libmanager.business;

import java.util.List;

import com.misaka.libmanager.dao.UserDao;
import com.misaka.libmanager.po.User;

public class UserService {
	private UserDao userDao = new UserDao();
	//判断用户是否合法
	public boolean legal(User user) {
		return userDao.isExists(user.getAccount(), user.getPassword());
	}
	//用户注册
	public boolean register(User user) {
		if(user.getAccount()=="") return false;
		if(user.getPassword()=="") return false;
		boolean flag = userDao.isExists(user.getAccount());
		if(!flag) userDao.insertUser(user.getAccount(), user.getPassword());
		return !flag;
	}
	public List<User> allUsers() {
		return userDao.allUsers();
	}
	public void deluser(String id) {
		userDao.delUser(id);
		return;
	}
}
