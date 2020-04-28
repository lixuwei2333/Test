package com.misaka.libmanager.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.misaka.libmanager.business.BookService;
import com.misaka.libmanager.po.Book;

public class AddBookServlet extends HttpServlet{
	private BookService bookService = new BookService();
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		Book book = new Book(id,name,1);
		//判断登录是否合法
		boolean legal = bookService.addbook(book);
		if(legal) {
			//重定向到index.jsp
			response.sendRedirect("index.jsp?addbook=yes");
		}
		else {
			response.sendRedirect("index.jsp?addbook=no");
		}
	}
	
}
