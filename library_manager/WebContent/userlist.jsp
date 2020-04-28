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
	<h2 align = "center">用户列表</h2>
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
	<table width = "700" border = "0" align = "center">
		<tr>
			<th <%=admin %> align = "right" hidden><input type = "button" value="添加" onclick="addBook()"/></th>
		</tr>
	</table>
	
	<table width = "700" border = "1" align = "center">
		<tr>
			<th>用户名</th>
			<th>密码</th>
			<th>权限</th>
			<th>操作</th>
		</tr>
		<%
			for(User user:userList) {
		%>
				<tr>
					<td><%=user.getAccount() %></td>
					<td><%=user.getPassword() %></td>
					<%if (user.getAdmin()==1) %>	<td>管理员</td>
					<%if (user.getAdmin()==0) %>	<td>用户</td>
					<td align = "center" <%=user.getAdmin()==1?"hidden":"" %> > <a href="http://localhost:8080/library_manager/DelUser?account=<%=user.getAccount() %>">删除</a></td>
<%-- 					<%if (user.getAdmin()==1) %>	<td>null</td> --%>
<%-- 					<%if (user.getAdmin()==0) %>	<td> <a href="http://localhost:8080/library_manager/DelUser?account= <%=user.getAccount() %>">删除</a></td> --%>
				</tr>
		<%				
			}
		%>
	</table>
</body>
</html>