<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="com.javalec.guestbook.dao.GuestBookDAO"%>
<%@page import="com.javalec.guestbook.vo.GuestBookVO"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DELETE</title>
</head>
<body>

<%String no = request.getParameter("no");%>



<%

String password = request.getParameter("pw");

if(password !=null || no!=null ) {
int id = Integer.parseInt(no);
GuestBookDAO dao = new GuestBookDAO();
GuestBookVO vo =new GuestBookVO();

vo.setNo(id);
vo.setPassword(password);

int result = dao.delete(vo);
}
%>

<jsp:forward page="index.jsp"></jsp:forward>
</body>
</html>