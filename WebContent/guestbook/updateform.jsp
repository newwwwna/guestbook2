<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UPDATE</title>
</head>
<body>
<%String no = request.getParameter("no");%>

<form action="update.jsp" method="post">
<input type="hidden" name="no" value="<%= no %>">

<table>
<tr><td> 비밀번호 </td>
<td> <input type = "password" name ="pw" > </td>
<td> <input type="submit" value="수정"> </td><br/>
<td> <a href ="index.jsp"> 메인으로 돌아가기</a></td>
</tr>
</table>

</form>


</body>
</html>