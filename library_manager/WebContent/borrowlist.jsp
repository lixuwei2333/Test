<%@page import="com.misaka.libmanager.dao.BookDao"%>
<%@page import="com.misaka.libmanager.po.Borrow"%>
<%@page import="com.misaka.libmanager.business.BorrowService"%>
<%@page import="com.misaka.libmanager.business.NoticeService"%>
<%@page import="com.misaka.libmanager.po.Notice"%>
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
	String user = (String) session.getAttribute("account");
	String admin = "";
	if(user==null)  {
		response.sendRedirect("login.jsp");
	}
	UserDao userDao = new UserDao();
	if(userDao.isAdmin(user)==0) admin = "hidden";
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
		BorrowService borrowService = new BorrowService();
		List<Borrow> borrowList = borrowService.allBorrows();
		BookDao bookDao = new BookDao();
	%>
	<h2 align = "center">借阅列表</h2>
	<p>
		<a href="index.jsp">图书列表</a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="notice.jsp">公告列表</a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="borrowlist.jsp">借阅列表</a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="userlist.jsp" <%=admin %> >用户列表</a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="borrow.jsp" <%=admin %> >借阅/归还</a>&nbsp;&nbsp;&nbsp;&nbsp;
	</p>
	
	<tr align = "center">当前登录用户： <%=session.getAttribute("account")%></tr> 
	<input type = "button" value="注销" onclick="Cancellation()"/>
	
	<hr>
	
	<table width = "700" border = "1" align = "center">
		<tr>
			<th width = "100">图书编号</th>
			<th width = "100">用户账号</th>
			<th>图书名称</th>
			<th width = "100">借阅时间</th>
		</tr>
		<%
			for(Borrow borrow:borrowList) {
				String bookname = bookDao.qName(borrow.getId());
				if(userDao.isAdmin(user)==0&&!borrow.getAccount().equals(user)) continue;
		%>
				<tr>
					<td><%=borrow.getId() %></td>
					<td><%=borrow.getAccount() %></td>
					<td><%=bookname %></td>
					<td  align = "center"><%=borrow.getTime() %></td>
				</tr>
		<%				
			}
		%>
	</table>
</body>
</html>