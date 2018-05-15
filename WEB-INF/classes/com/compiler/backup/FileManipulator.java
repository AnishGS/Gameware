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
		return contents;
	}
	public static String getNative(String file,String preloadFileName)
	{
		String userCode=getFileContents(file);
		String preload=getFileContents(preloadFileName);
		String state=getStateName(file);
		String newCode=Manager.translate(userCode, preload, state);
		return newCode;
	}
	public static String getPreload(String fileName,String stateFileName)
	{
		String preloadCode="";
		String preload=getFileContents(fileName);
		String state=getStateName(stateFileName);
		preloadCode=Preload.translate(preload,state);
		return preloadCode;
	}
	public static String getStateName(String path)
	{
		System.out.println(path);
		int i=path.length()-1;
		int j=path.length()-1;
		while(i>=0 && path.charAt(i)!='/')
			i--;
		if(path.indexOf(".")>=0)
			j=path.indexOf(".");
		System.out.println("i= "+i+" j= "+j);
		return path.substring(i+1,j);
	}
	public static boolean isProjectFile(String fileName)
	{
		return fileName.indexOf(".txt")>=0 && fileName.indexOf("preload.txt")==-1;
	}
}
