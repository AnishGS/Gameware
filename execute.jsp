<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.*" import="java.nio.file.*" import="com.compiler.*"%>
<html>
<head>
<script src="./js/kiwi.js"></script>
<%
	
	String pathLevel0=request.getParameter("run");
	File []root=new File("E://temp_files/newFolder/").listFiles();
	String preloadContents=readFile("E://temp_files/newFolder/preload.txt");
	String path0=pathLevel0.substring(getIndex(pathLevel0));
	String header="\nvar myGame=new Kiwi.Game(); alert('hi1');";
	String footer="myGame.states.addState( loadingState ); \n myGame.states.switchState( 'loadingState');";
	String script="";
	String javaScript="";
	String preloadScript=Preload.translate(preloadContents,path0);
	for(File file:root)
	{
		//add headers, footers and translation
		if(getStateName(file.getName()).equals("preload"))
			continue;
		System.out.println(">>>>"+file.getName());
		header+="\nvar "+getStateName(file.getName())+"=new Kiwi.State('"+getStateName(file.getName())+"');";
		footer+="\nmyGame.states.addState("+getStateName(file.getName())+"');";
		script=readFile("E://temp_files/newFolder/"+getStateName(file.getName())+".txt");
		System.out.println("<br>"+script);
	//	javaScript+=Manager.translate(script,preloadContents,getStateName(file.getName()));
	}
	
	//out.println(Preload.translate(preloadContents,path0));//contains preload js code
	//out.println("<br>"+header+" ");
	out.println("<script>"+header+preloadScript+"\n alert(hi2);\n"+javaScript+footer+"\n alert(hi2);\n"+"</script>");
	
%>
<%!
	public String readFile(String path)
	{
		String fileContents="";
		try
		{
			FileReader filereader=new FileReader(path);
			BufferedReader bufferedReader=new BufferedReader(filereader);
			String templine="";
			while((templine=bufferedReader.readLine())!=null)
			{
				fileContents+=templine;
			}
			bufferedReader.close();
			}
			catch(Exception e)
			{
				
			}
		return fileContents;
	}
	public String getStateName(String file)
	{
		return file.substring(getIndex(file),file.indexOf("."));
	}
	public int getIndex(String path)
	{
		for(int i=path.length()-1;i>=0;i--)
		{
			if(path.charAt(i)=='/')
				return i+1;
		}
		return 0;
	}
	public String returnPreload(JspWriter out,File []files,String root)
	{
		for(File file: files)
		{
			if(file.isDirectory())
			{
				try
				{
					String preload=returnPreload(out,file.listFiles(),root+"/"+file.getName());
					return preload;
				}
				catch(Exception e)
				{
					return "";
				}
			}
			else
			{
				try
				{
					String path=root+"/"+file.getName();
					if(file.getName().trim().indexOf("preload.txt")==0)
						return root+"/"+file.getName().trim();
				}
				catch(Exception e)
				{
					return "";
				}
			}
		}
		return "";
	}
%>
</head>
<body></body>
</html>