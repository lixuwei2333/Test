package com.misaka.libmanager.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.misaka.libmanager.business.UserService;
import com.misaka.libmanager.po.User;

public class LoginServlet extends HttpServlet {

	private UserService userService = new UserService();
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		String oper = request.getParameter("out");
		HttpSession session = request.getSession();
		//System.out.println(account);
		session.removeAttribute("account");
		if(oper==null) {
			User user = new User(account,password);
			//判断登录是否合法
			boolean legal = userService.legal(user);
			if(legal) {
				//重定向到index.jsp
				session.setAttribute("account", account);
				response.sendRedirect("index.jsp");
			}
			else {
				response.sendRedirect("login.jsp?login=no");
			}
		}
		else response.sendRedirect("login.jsp");
	}
}
