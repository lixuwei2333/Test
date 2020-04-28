<%@page import="com.misaka.libmanager.po.User"%>
<%@page import="com.misaka.libmanager.business.UserService"%>
<%@page import="com.misaka.libmanager.dao.UserDao"%>
<%@page import="com.misaka.libmanager.po.Book"%>
<%@page import="java.util.List"%>
<%@page import="com.misaka.libmanager.business.BookService"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<%
	String account = (String) session.getAttribute("account");
	String admin = "";
	if(account==null)  {
		response.sendRedirect("login.jsp");
	}
	UserDao userDao = new UserDao();
	if(userDao.isAdmin(account)==0) response.sendRedirect("index.jsp");
%>

<script>
	function addBook(){
		window.location.href = "addBook.jsp";
	}
	function Cancellation(){
  		window.location.href = "Login?out=1";
	}
</script>

</head>
<body>
	<%
		UserService userService = new UserService();
		List<User> userList = userService.allUsers();
	%>
	<h2 align = "center">借阅/归还</h2>
	<p>
		<a href="index.jsp">图书列表</a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="notice.jsp">公告列表</a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="borrowlist.jsp">借阅列表</a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="userlist.jsp" <%=admin %> >用户列表</a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="borrow.jsp" <%=admin %> >借阅/归还</a>&nbsp;&nbsp;&nbsp;&nbsp;
	</p>
	<tr align = "center">当前登录用户： <%=session.getAttribute("account")%></tr> 
	<input type = "button" value="注销" onclick="Cancellation()"/>
	
	<hr />
	<form action = "Borrow" method = "post" align = "center">
		图书编号:<input type = "text" name = "id" /> <br />
		用户账号:<input type = "account" name = "account" /> <br />
		借阅/归还时间:<input type = "date" name = "date" /> <br />
		<input type = "submit" value = "借阅/归还" />
	</form>
</body>
</html>