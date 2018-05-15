<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="com.compiler.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%="Game"%></title>
<script src="./kiwi.js"></script>
<%
	String state=request.getParameter("state1");	
	String state2=request.getParameter("state2");
	
	String header="var "+state+"=new Kiwi.State('"+state+"');";
	header+="\nvar "+state2+"=new Kiwi.State('"+state2+"');";
	header+="\nvar myGame=new Kiwi.Game(); alert('hi1');";
	
	String footer="\n myGame.states.addState("+state+"); ";
	footer+="\n myGame.states.addState("+state2+"); ";
	footer+="myGame.states.addState( loadingState ); \n myGame.states.switchState( 'loadingState');";
	
	String userCode1=request.getParameter("userCode1");
	String userCode2=request.getParameter("userCode2");
	
	String preLoad=request.getParameter("preload");
	String preLoadjs=Preload.translate(preLoad,state);
	
	String javaScript1=Manager.translate(userCode1,preLoad,state);
	String javaScript2=Manager.translate(userCode2,preLoad,state2);
	
	out.println("<script>"+header+preLoadjs+"\n alert('hi2'); \n"+javaScript1+javaScript2+footer+" \n alert('hi3');</script>");
%>
</head>
<body>
<img src="<% request.getContextPath();%>/player.png">
</body>
</html>