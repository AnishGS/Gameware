<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.*" %>
<%
	String root=String.valueOf(session.getAttribute("userroot"));
	String projectName=String.valueOf(request.getParameter("projectname"));
	File project=new File(root+"/"+projectName);
	project.mkdir();
	File preload=new File(root+"/"+projectName+"/preload.txt");
	boolean fc=preload.createNewFile();
	out.println("project_"+root+"/"+projectName);
	/*
	Writer writer=new BufferedWriter(new FileWriter(project));
	writer.write(fileContent);
	writer.flush();
	writer.close();*/
%>