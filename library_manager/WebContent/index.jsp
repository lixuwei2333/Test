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

<%-- 	var user = <%=session.getAttribute("account")%>; --%>
<!-- 	if(user==null)  { -->
<!-- 		window.location.href = "login.jsp"; -->
<!-- 	} -->
<!-- </script> -->

<script>
	function addBook(){
		window.location.href = "addBook.jsp";
	}
	function Cancellation(){
  		window.location.href = "Login?out=1";
	}
</script>

<script> 
	var error ='<%=request.getParameter("addbook")%>';
	if(error=='no'){
		alert("插入失败");
	}
	if(error=='yes') alert("插入成功");
</script>

</head>
<body>
	<%
		BookService bookService = new BookService();
		List<Book> bookList = bookService.allBooks();
	%>
	<h2 align = "center">图书列表 </h2>
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
			<th <%=admin %> align = "right"><input type = "button" value="添加" onclick="addBook()"/></th>
		</tr>
	</table>
	
	<table width = "700" border = "1" align = "center">
		<tr>
			<th>编号</th>
			<th>书名</th>
			<th>状态</th>
			<th <%=admin %>>操作</th>
		</tr>
		<%
			for(Book book:bookList) {
				int flag = book.getFlag();
				String sta;
				if(flag==0) sta = "被借出";
				else sta = "在馆";
		%>
				<tr>
					<td><%=book.getId() %></td>
					<td><%=book.getName() %></td>
					<td align = "center"><%=sta %></td>
					<td <%=admin %> align = "center"><a href="#">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="http://localhost:8080/library_manager/DelBook?id=<%=book.getId() %>" <%=admin %> >删除</a></td>
				</tr>
		<%				
			}
		%>
	</table>
</body>
</html>