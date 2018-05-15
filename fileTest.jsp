<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
	String saveFile=new String();
	String contentType=request.getContentType();
	String projectRoot=String.valueOf(session.getAttribute("projectRoot"));
	String message="Please upload a file";
	if(contentType!=null && contentType.indexOf("multipart/form-data")>=0)
	{
		message="file uploaded.";
		DataInputStream in=new DataInputStream(request.getInputStream());
		int formDataLength=request.getContentLength();
		byte dataBytes[]=new byte[formDataLength];
		int byteRead=0;
		int totalBytesRead=0;
		while(totalBytesRead<formDataLength)
		{
			byteRead=in.read(dataBytes,totalBytesRead,formDataLength);
			totalBytesRead+=byteRead;
		}
		String file=new String(dataBytes);
		saveFile=file.substring(file.indexOf("filename=\"")+10);
		saveFile=saveFile.substring(0,saveFile.indexOf("\n"));
		saveFile=saveFile.substring(saveFile.lastIndexOf("\\")+1,saveFile.indexOf("\""));
		System.out.println(saveFile);
		int lastIndex=contentType.lastIndexOf("=");
		String boundary=contentType.substring(lastIndex+1,contentType.length());
		int pos=file.indexOf("filename=\"");
		pos=file.indexOf("\n",pos)+1;
		pos=file.indexOf("\n",pos)+1;
		pos=file.indexOf("\n",pos)+1;
		int boundaryLocation=file.indexOf(boundary,pos)-4;
		int startPos=((file.substring(0,pos)).getBytes()).length;
		int endPos=((file.substring(0,boundaryLocation)).getBytes()).length;
		saveFile=projectRoot+"/"+saveFile;
		System.out.println(saveFile);
		File ff=new File(saveFile);
		try
		{
			FileOutputStream fileOut=new FileOutputStream(ff);
			fileOut.write(dataBytes,startPos,(endPos-startPos));
			fileOut.flush();
			fileOut.close();
		}
		catch(Exception e)
		{
			
		}
	}
%>
<html>
<head>
	<style>
		.systembuttons {
    background-color: #4885ed; /* Green */
    border-style:solid;
   border-bottom-style:none;
    border-width:thin;
    color: white;
    border-color:white;
    padding: 8px 7px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 12px;
    border-left-style: none;
}

.systembuttons2 {
   // background-color: #4885ed; /* Green */
    border-style:solid;
  // border-bottom-style:none;
    border-width:thin;
    //color: white;
    border-color:#4885ed;
    padding: 8px 7px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 12px;
   // border-left-style: none;
}
	</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<p></p>
	<center>
		<img src="fileicon.png">
	
<form name="frm1" method="POST" enctype="multipart/form-data">
<input type="file" name="file" class="systembuttons2">
<input type="submit" class="systembuttons">
</center>
</form>
</body>
</html>