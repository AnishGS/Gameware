<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form name="textEditor" method="GET" action="game.jsp">
<table>
<tr>
<td></td>
<td><input type="text" name="state1"></td>
<td><input type="text" name="state2"></td>
</tr>
<tr>
<td><textarea name="preload" cols=40 rows=20></textarea></td>
<td><textarea name="userCode1" cols=40 rows=20></textarea></td>
<td><textarea name="userCode2" cols=40 rows=20></textarea>
</td>
</tr>
</table>
<br>
<input type="submit">
</form>
<img src="<%=request.getContextPath()%>/player.png">
<%=request.getContextPath()%>
</body>
</html>