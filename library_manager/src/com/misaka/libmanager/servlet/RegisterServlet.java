package com.misaka.libmanager.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.misaka.libmanager.business.UserService;
import com.misaka.libmanager.po.User;

public class RegisterServlet extends HttpServlet {

	private UserService userService = new UserService();
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		
		User user = new User(account,password);
		//ÅÐ¶ÏµÇÂ¼ÊÇ·ñºÏ·¨
		boolean legal = userService.register(user);
		if(legal) {
			response.sendRedirect("login.jsp?register=yes");
		}
		else {
			response.sendRedirect("login.jsp?register=no");
		}
	}
}
