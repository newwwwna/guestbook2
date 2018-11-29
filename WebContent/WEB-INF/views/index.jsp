<%@page import="com.javalec.guestbook.vo.GuestBookVO"%>
<%@page import="java.util.List"%>
<%@page import="com.javalec.guestbook.dao.GuestBookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록</title>
</head>
<body>
<form action="/guestbook2/gb" method="post">
<input type="hidden" name = "a" value="add">
	<table border='1px' cellspacing='1' cellpadding='2px'>
		<tr>
			<td> 이름 </td> <td><input type="text" name="name" ></td>
			<td> 비밀번호 </td> <td><input type = "password" name="pw"></td>
		</tr>
		<tr>
			<td colspan="4">
			<textarea name = "content" rows="10" cols="50"></textarea>	
			</td>
		</tr>
		<tr>
			<td colspan="4" align=right>
			<input type="submit" value="확인">
		</td>
		</tr>
	</table> <br/>

	</form>
	

<%

List<GuestBookVO> list = (List)request.getAttribute("list");
for(GuestBookVO vo : list) { %>
	<table border='1px' cellspacing='1' cellpadding='2px' width='475'>
		<tr>
			<td> [<%=vo.getNo() %>] </td> 
			<td><%=vo.getName() %></td>
			<td> <%=vo.getReg_date() %> </td>
					
				<th><form action="/guestbook2/gb" method="post">
				<input type="hidden" name="no" value="<%= vo.getNo() %>">
				<input type="hidden" name="a" value="deleteform">
				<input type="submit" value="삭제"></form></th>
				
				<th><form action="/guestbook2/gb" method="post">
				<input type="hidden" name="no" value="<%= vo.getNo() %>">
				<input type="hidden" name="name" value="<%= vo.getName() %>">
				<input type="hidden" name="password" value="<%= vo.getPassword() %>">
				<input type="hidden" name="content" value="<%= vo.getContent() %>">
				<input type="hidden" name="a" value="updateform">
				<input type="submit" value="수정"></form></th>
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