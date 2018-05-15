<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.*" import="java.nio.file.*" import="com.compiler.*"%>
<%
	String path=request.getParameter("path");
	String projectRoot=String.valueOf(session.getAttribute("projectRoot"));
	out.println("<img src='"+path.substring(33)+"'>");
%>
