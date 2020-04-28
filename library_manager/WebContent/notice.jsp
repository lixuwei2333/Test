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
		NoticeService noticeService = new NoticeService();
		List<Notice> noticeList = noticeService.allNotices();
	%>
	<h2 align = "center">公告列表 </h2>
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
			<th width = "100">公告编号</th>
			<th>公告内容</th>
			<th width = "100">发布时间</th>
			<th <%=admin %> >操作</th>
		</tr>
		<tr <%=admin %>>
			<form action = "AddNotice" method = "post">
				<td><input type = "text" name = "id" /></td>
				<td><input type = "text" name = "content" /></td>
				<td ><input type = "date" name = "time" /></td>
				<td><input type = "submit" value = "添加公告" /></td>
			</form>
			
		</tr>
		<%
			for(Notice notice:noticeList) {
		%>
				<tr>
					<td><%=notice.getId() %></td>
					<td><%=notice.getContent() %></td>
					<td  align = "center"><%=notice.getTime() %></td>
					<td align = "center" <%=admin %>> <a href="http://localhost:8080/library_manager/DelNotice?id=<%=notice.getId() %>">删除</a></td>
<%-- 					<%if (user.getAdmin()==1) %>	<td>null</td> --%>
<%-- 					<%if (user.getAdmin()==0) %>	<td> <a href="http://localhost:8080/library_manager/DelUser?account= <%=user.getAccount() %>">删除</a></td> --%>
				</tr>
		<%				
			}
		%>
	</table>
</body>
</html>