
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.javalec.guestbook.vo.GuestBookVO"%>
<%@page import="com.javalec.guestbook.dao.GuestBookDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INSERT</title>
</head>
<body>
<%
String name =  request.getParameter("name");
String pw = request.getParameter("pw");
String content = request.getParameter("content");

if(name!=null || pw!=null || content!=null) {
GuestBookDAO dao = new GuestBookDAO();
GuestBookVO vo = new GuestBookVO();

vo.setName(name);
vo.setPassword(pw);
vo.setContent(content);
int result = dao.insert(vo);
}
%>

<jsp:forward page="index.jsp"></jsp:forward>

</body>
</html>