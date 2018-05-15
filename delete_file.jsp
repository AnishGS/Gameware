<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.*" %>
<%
	String filePath=request.getParameter("filename"); 
	File file=new File(filePath);
	file.delete();
%>