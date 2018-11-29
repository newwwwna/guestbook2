<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록</title>
</head>
<body>
	<form action="add.jsp" method="post">
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
	

<jsp:include page="guest_list.jsp"></jsp:include>


</body>
</html>