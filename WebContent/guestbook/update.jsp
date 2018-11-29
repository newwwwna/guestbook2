<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.javalec.guestbook.vo.GuestBookVO"%>
<%@page import="com.javalec.guestbook.dao.GuestBookDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UPDATE</title>
</head>
<body>
<table>
<form action="update.jsp" method="post">
<tr>
<td>이름</td> <td><input type="text" name="name"></td>
<td>내용</td> <td><input type="text" name="content"></td>
</tr>
<tr>
<td colspan="4">
<input type="submit" value="수정" align=right></td>
</tr>
</table>
</form>

<%String no = request.getParameter("no");
String content = request.getParameter("content");
String name = request.getParameter("name");
String password = request.getParameter("password");
%>

<%
if(password !=null || no!=null || content!=null || name!=null) {
int id = Integer.parseInt(no);
GuestBookDAO dao = new GuestBookDAO();
GuestBookVO vo =new GuestBookVO();

vo.setName(name);
vo.setContent(content);
vo.setNo(id);
vo.setPassword(password);
int result = dao.update(vo);
}
%>



</body>
</html>