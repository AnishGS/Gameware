<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="com.compiler.*" import="java.io.*"%>
<%
		//out.println("Semantic error log:<br>");
	try{
		String loadingStateName=request.getParameter("run");
		String projectRootName=request.getParameter("projectroot");
		File projectRoot=new File(projectRootName);
		String header="\n var myGame=new Kiwi.Game();";
		String footer="\n myGame.states.addState(loadingState); \n";
		String fileScript="";
		String gameScript="";
		String preloadScript=CheckFileManipulator.getPreload(projectRootName+"preload.txt", loadingStateName);
		for(File projectFile:projectRoot.listFiles())
		{
			if(CheckFileManipulator.isProjectFile(projectFile.getName()))
			{
				fileScript+=CheckFileManipulator.getNative(projectRootName+projectFile.getName(),projectRootName+"preload.txt");
				header+="\n var "+CheckFileManipulator.getStateName(projectFile.getName())+"=new Kiwi.State('"+CheckFileManipulator.getStateName(projectFile.getName())+"');";
				if(fileScript.trim().length()>=0 && !fileScript.trim().equals(""))
				{
					//out.println("<b>File "+CheckFileManipulator.getStateName(projectFile.getName())+" contains the following errors.</b><br>");
					out.println(fileScript);
				}
				gameScript+=fileScript+"\n";
			}
		}
	}
	catch(Exception e)
	{
		out.println("<br>.");
	}
%>
