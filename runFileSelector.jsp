<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.*" %>
<% 
	/*File []root=new File("E://temp_files/newFolder/").listFiles();
	out.println("<div class='selectDiv'><select id='runSelection' class='runSelect'>");
	printFile(out,root,"E://temp_files/newFolder");
	out.println("</select></div>");
	*/
	String projectRoot=request.getParameter("projectroot")+"/";
	String prRoot=request.getParameter("projectroot");
	File []root=new File(projectRoot).listFiles();
	out.println("<div class='selectDiv'><select id='runSelection' class='runSelect'>");
	printFile(out,root,prRoot);
	out.println("</select></div>");
	
	
%>
<%!
	public void printFile(JspWriter out,File []files,String root)
	{
		for(File file: files)
		{
			if(file.isDirectory())
			{
				try
				{
					printFile(out,file.listFiles(),root+"/"+file.getName());
				}
				catch(Exception e)
				{
				
				}
			}
			else
			{
				try
				{
					String path=root+"/"+file.getName();
					if(file.getName().trim().indexOf("preload.txt")!=0 && file.getName().trim().indexOf(".txt")>=0)
						out.println("<option value='"+path+"'>"+file.getName().substring(0,file.getName().indexOf('.'))+"</option>");
				}
				catch(Exception e)
				{
				
				}
			}
		}
	}
%>