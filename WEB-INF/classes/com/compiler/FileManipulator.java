package com.compiler;
import java.io.*;
public class FileManipulator 
{
	public static String getFileContents(String file)
	{
		String contents="";
		try
		{
			FileReader fileReader=new FileReader(file);
			BufferedReader bufferedReader=new BufferedReader(fileReader);
			String line="";
			while((line=bufferedReader.readLine())!=null)
				contents+="\n"+line;
			bufferedReader.close();
		}
		catch(Exception e)
		{
			System.out.println("File read error");
		}
		
	//	if(contents.indexOf("/*")>=0 && contents.indexOf("*/")>=0)
		//	return removeComments(contents);
		//else
			return contents;
	}
	public static String getNative(String file,String preloadFileName)
	{
		String userCode=getFileContents(file);
		if(userCode.indexOf("/*")>=0 && userCode.indexOf("*/")>=0)
			userCode=removeComments(userCode);
		String preload=getFileContents(preloadFileName);
		if(preload.indexOf("/*")>=0 && preload.indexOf("*/")>=0)
			preload=removeComments(preload);
		String state=getStateName(file);
		String newCode=Manager.translate(userCode, preload, state);
		return newCode;
	}
	public static String getPreload(String fileName,String stateFileName)
	{
		String preloadCode="";
		String preload=getFileContents(fileName);
		preload=removeComments(preload);
	//	String state=getStateName(stateFileName);
		String state=stateFileName;
		preloadCode=Preload.translate(preload,state);
		return preloadCode;
	}
	public static String getStateName(String path)
	{
		int i=path.length()-1;
		int j=path.length()-1;
		while(i>=0 && path.charAt(i)!='/')
			i--;
		if(path.indexOf(".")>=0)
			j=path.indexOf(".");
		return path.substring(i+1,j);
	}
	public static boolean isProjectFile(String fileName)
	{
		return fileName.indexOf(".txt")>=0 && fileName.indexOf("preload.txt")==-1;
	}
	private static String removeComments(String code)
	{
		while(code.indexOf("/*")>=0)
		{
			int begin=code.indexOf("/*");
			int end=code.indexOf("*/")+2;
			code=code.substring(0, begin)+code.substring(end);
		}
		return code;
	}
}
