<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.*" %>
<% 
	String fileName=request.getParameter("filename");
	String fileContent=request.getParameter("filecontent");
	fileContent=fileContent.replace("%2B","+");
	String filePath;
	if(fileName.indexOf("C:")>=0)
		filePath=fileName;
	else
		filePath=String.valueOf(session.getAttribute("projectRoot"))+"/"+fileName;
	
	System.out.println(filePath);
	File userFile=new File(filePath);
	if(!userFile.getParentFile().exists())
	{
		userFile.getParentFile().mkdirs();
	}
	boolean fc=userFile.createNewFile();
	Writer writer=new BufferedWriter(new FileWriter(userFile));
	if(fileContent.trim().length()==0)
	{
		fileContent="global:\n\nend;";
		fileContent+="\nstart:\n\nend;";
		fileContent+="\nkeydown:\n\nend;";
		fileContent+="\ncollision:\n\nend;";
		fileContent+="\nimpassable:\n\nend;";
		fileContent+="\ninradius:\n\nend;";
		fileContent+="\nalways:\n\nend;";
	}
	System.out.println("contents=------------------------------------------------- "+fileContent);
	
	writer.write(fileContent);
	writer.flush();
	writer.close();
%>