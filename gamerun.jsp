<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="com.compiler.*" import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%="Game"%></title>
<link rel="shortcut icon" href="logo16.png">
<script src="./kiwi.js"></script>
<%
	String loadingStateName=request.getParameter("run");
	//File projectRoot=new File("E://temp_files/newFolder/");
	String projectRootName=request.getParameter("projectroot");
//	System.out.println("Then1=E://temp_files/newFolder/");
	//System.out.println("Now1="+request.getParameter("projectroot"));
	File projectRoot=new File(projectRootName);
	String header="\n var myGame=new Kiwi.Game();";
	String footer="\n myGame.states.addState(loadingState); \n";
	String fileScript="";
	String gameScript="";
//	String preloadScript=FileManipulator.getPreload("E://temp_files/newFolder/preload.txt", loadingStateName);
	String preloadScript=FileManipulator.getPreload(projectRootName+"preload.txt", loadingStateName);
//	System.out.println("Then2=E://temp_files/newFolder/preload.txt");
	//System.out.println("Now2="+projectRootName+"preload.txt");
	for(File projectFile:projectRoot.listFiles())
	{
		if(FileManipulator.isProjectFile(projectFile.getName()))
		{

		//	System.out.println("Then3=E://temp_files/newFolder/");
			//System.out.println("Now3="+projectRootName);
			
	//		System.out.println("Then4=E://temp_files/newFolder/preload.txt");
		//	System.out.println("Now4="+projectRootName+"preload.txt");
			
			//	fileScript=FileManipulator.getNative("E://temp_files/newFolder/"+projectFile.getName(),"E://temp_files/newFolder/preload.txt");
			fileScript=FileManipulator.getNative(projectRootName+projectFile.getName(),projectRootName+"preload.txt");
			
			
			
			
			header+="\n var "+FileManipulator.getStateName(projectFile.getName())+"=new Kiwi.State('"+FileManipulator.getStateName(projectFile.getName())+"');";
			gameScript+=fileScript+"\n";
			footer+="\n myGame.states.addState("+FileManipulator.getStateName(projectFile.getName())+");";
		}
	}
	footer+="myGame.states.switchState('loadingState');";
	out.println("<script>");
	out.println(header);
	out.println(preloadScript);
	out.println(gameScript);
	out.println(footer);
	out.println("</script>");
%>
</head>
<body></body>
</html>