<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.*" %>
<% 
	File folder=new File("E://temp_files/newFolder");
//	File []root=new File("E://temp_files/newFolder/").listFiles();
	String projectFolder=request.getParameter("projectroot");
	session.setAttribute("projectRoot", request.getParameter("projectroot"));
	//File []root=new File(String.valueOf(session.getAttribute("userroot"))).listFiles();
	File []root=new File(String.valueOf(session.getAttribute("projectRoot"))).listFiles();
	String projectRoot=String.valueOf(session.getAttribute("projectRoot"));
	String userRoot=String.valueOf(session.getAttribute("userroot"));
	String tempRoot=projectRoot.substring(userRoot.length()+1);
	out.println("<div id='div_"+projectRoot+"' style='overflow:hidden;'><p class='folder' style='margin:0;padding:0;font-size:20px;' id='"+projectRoot+"' style='margin:0;padding:0;' onclick=toggle(this.id)>"+tempRoot+"</p>");
	printFile2(out,root,String.valueOf(session.getAttribute("projectRoot")),"");
	out.println("</div>");
%>
<%!
	public void printFile(JspWriter out,File []files,String root,String space)
	{
		space+="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
		for(File file: files)
		{
			if(file.isDirectory())
			{
				try
				{
					String path=root+"/"+file.getName();
					int fileLength=file.listFiles().length;
					out.println("<div id='div_"+path+"' style='overflow:hidden; background-color:coral' class='"+fileLength+"'>");
					out.println("<b><p class='folder' id='"+path+"' style='margin:0;padding:0;' onclick=restoreDiv(this.id)>"+space+file.getName()+"</p></b>");
					printFile(out,file.listFiles(),root+"/"+file.getName(),space);
					out.println("</div>");
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
					out.println("<p class='file' id='"+path+"' onclick=getFileContents(this) style='margin:0;padding:0;'>"+space+file.getName()+"</p>");
				}
				catch(Exception e)
				{
				
				}
			}
		}
	}
%>


<%!
	public void printFile2(JspWriter out,File []files,String root,String space)
	{
		space+="&nbsp;&nbsp;&nbsp;&nbsp;";
		try
		{
			out.println("<hr width='90%' style='margin:5px'>Scripts");
		}
		catch(Exception e)
		{
	
		}
		for(File file: files)
		{
			if(!file.isDirectory())
			{
				try
				{

					if(file.getName().indexOf(".txt")>=0)
					{
						String path=root+"/"+file.getName();
						String temp=file.getName().substring(0,file.getName().indexOf("."));
						temp+=".ps";
						out.println("<table><tr><td>&nbsp;</td><td><img src='pslogo.png'></td><td><p class='file' id='"+path+"' onclick=getFileContents(this) style='margin:0;padding:0;'>"+temp+"</p></td><td></td></tr></table>");
					}
				}
				catch(Exception e)
				{
				
				}
			}
		}
		try
		{
			out.println("Assets");
		}
		catch(Exception e)
		{
	
		}
		for(File file: files)
		{
			if(!file.isDirectory())
			{
				try
				{

					if(file.getName().indexOf(".txt")==-1 && file.getName().indexOf("mp3")==-1)
					{
						String path=root+"/"+file.getName();
						out.println("<table><tr><td>&nbsp;</td><td><img src='imagelogo6.png'></td><td><p class='file' id='"+path+"' onclick=getImage(this) style='margin:0;padding:0;'>"+file.getName()+"</p></td><td></td></tr></table>");
					}
					else if(file.getName().indexOf("mp3")>=0)
					{
						String path=root+"/"+file.getName();
						out.println("<table><tr><td>&nbsp;</td><td><img src='musicicon2.png'></td><td><p class='file' id='"+path+"' onclick=getImage(this) style='margin:0;padding:0;'>"+file.getName()+"</p></td><td></td></tr></table>");
				
					}
				}
				catch(Exception e)
				{
				
				}
			}
		}
		for(File file: files)
		{
			if(file.isDirectory())
			{
				try
				{
					String path=root+"/"+file.getName();
					int fileLength=file.listFiles().length;
					out.println("<div id='div_"+path+"' class='"+fileLength+"' style='overflow:visible;'>");
					out.println("<b><table><tr><td style='width:200px;' ><p class='folder' id='"+path+"' style='margin:0;padding:0;' onClick=toggle(this.id)>"+space+file.getName()+"</p></td><td style='height:20px;'><p id='folder_"+path+"' style='margin:0;padding:0;' onClick=openChildWindow4(this.id)>+</p></td></tr></table></b>");
					printFile2(out,file.listFiles(),root+"/"+file.getName(),space);
					out.println("</div>");
					
				}
				catch(Exception e)
				{
				
				}
			}
		}
	}
%>