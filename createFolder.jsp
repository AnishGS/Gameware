<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.*" %>
<%
	String root=String.valueOf(session.getAttribute("userroot"));
	String projectName=String.valueOf(request.getParameter("foldername"));
	File project=new File(projectName);
	project.mkdir();
%>