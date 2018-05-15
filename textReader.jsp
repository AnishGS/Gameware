<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.*" import="java.nio.file.*" import="com.compiler.*"%>
<%
	String path=request.getParameter("path");
	File file=new File(path);
	String data=new String(Files.readAllBytes(Paths.get(path)));
	String fileData=FileManipulator.getFileContents(path);
	out.println(fileData.trim());
	//out.println(data.trim());
%>
