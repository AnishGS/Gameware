<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.*" %>
<% 
	//File folder=new File("E://temp_files/newFolder");
	File []root=new File(String.valueOf(session.getAttribute("userroot"))).listFiles();
	printFile2(out,root,String.valueOf(session.getAttribute("userroot")),"&nbsp;&nbsp;&nbsp;&nbsp;");
%>
<%!
	
%>


<%!
	public void printFile2(JspWriter out,File []files,String root,String space)
	{
		space+="&nbsp;&nbsp;&nbsp;&nbsp;";
		for(File file: files)
		{
			if(file.isDirectory())
			{
				try
				{
					String path=root+"/"+file.getName();
					int fileLength=file.listFiles().length;
					out.println("<div class='projectName'>");
					out.println("<b><p id='project_"+path+"' onClick='showExplorer(this.id)' >"+space+file.getName()+"</p></b>");
					out.println("</div>");
				}
				catch(Exception e)
				{
				
				}
			}
		}
	}
%>