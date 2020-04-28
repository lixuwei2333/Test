package com.misaka.libmanager.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.misaka.libmanager.business.BorrowService;
import com.misaka.libmanager.business.UserService;

/**
 * Servlet implementation class Borrow
 */
@WebServlet("/Borrow")
public class Borrow extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BorrowService borrowService = new BorrowService();
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String account = request.getParameter("account");
		String x = request.getParameter("date");
		if(id!=""&&account!=""&&x!="") {
			SimpleDateFormat format= new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date d = null;
			try {
				d = format.parse(x);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			java.sql.Date date = new java.sql.Date(d.getTime());
			com.misaka.libmanager.po.Borrow T = new com.misaka.libmanager.po.Borrow (id, account, date);
			borrowService.borrow(T);
		}
		//System.out.println(id);
		response.sendRedirect("borrow.jsp?oper=yes.jsp");
	}
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Borrow() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
