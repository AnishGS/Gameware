<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<style>
.start
{
    background-color: #4885ed; /* Green */
    border-style:solid;
   border-bottom-style:none;
    border-width:thin;
    width:300px;
    height:120px;
    color: white;
    border-color:white;
    padding: 8px 7px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 20px;
    border-left-style: none;
    margin-top:200px;
    margin-left:500px;
}
</style>
<title>Playware</title>
</head>
<body>
<form method="GET" action="playware.jsp" name="form1">
<input type="hidden" name="username"  value="anish">
<input type="submit" value="Start the demonstration" class="start">
</form>
</body>
</html>