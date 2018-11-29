<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.List"%>
<%@page import="com.javalec.guestbook.dao.GuestBookDAO"%>
<%@page import="com.javalec.guestbook.vo.GuestBookVO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guestList</title>
</head>
<body>

<%
GuestBookDAO dao = new GuestBookDAO();
List<GuestBookVO> list  = dao.getGuestBookList();
for(GuestBookVO vo : list) { %>
	<table border='1px' cellspacing='1' cellpadding='2px' width='475'>
		<tr>
			<td> [<%=vo.getNo() %>] </td> 
			<td><%=vo.getName() %></td>
			<td> <%=vo.getReg_date() %> </td>
		
					<th><form action="updateform.jsp" method="post">
				<input type="hidden" name="no" value="<%= vo.getNo() %>">
				<input type="submit" value="수정"></form></th>
				<th><form action="deleteform.jsp" method="post">
				<input type="hidden" name="no" value="<%= vo.getNo() %>">
				<input type="submit" value="삭제"></form></th>
		</tr>
			
		<tr>
			<td colspan="5">
			<%=vo.getContent() %>
			</td>
			
		</tr>
	</table>
		<br/>

<%} %>

</body>
</html>