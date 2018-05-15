package com.compiler;

public class Checker 
{
	public static boolean isSystemCall(String line)
	{
		if(line.indexOf("loadObject(")>=0)
			return true;
		else if(line.indexOf("reload()")>=0)
			return true;
		else if(line.indexOf("loadAudio(")>=0)
			return true;
		else if(line.indexOf("switchState(")>=0)
			return true;
		else if(line.indexOf("setBgColor(")>=0)
			return true;
		return false;
	}
	public static boolean isWith(String line)
	{
		if(line.indexOf("with ")>=0)
			return true;
		return false;
	}
	public static boolean isAssignment(String line,String preload)
	{
		if(line.indexOf("=")>=0)
			return true;
		return false;
	}
	public static boolean isCondition(String line,String preload)
	{
		if(line.indexOf("if(")>=0)
			return true;
		return false;
	}
	public static boolean isWhile(String line)
	{
		if(line.indexOf("while(")>=0)
			return true;
		return false;
	}
	public static boolean isVarDeclaration(String line,String preload)
	{
		if(line.indexOf("integer ")>=0)
			return true;
		if(line.indexOf("decimal ")>=0)
			return true;
		return false;
	}
	public static boolean isSeperator(char letter)
	{
		switch(letter)
		{
			case '=':
			case '<':
			case '>':
			case ',':
			case '*':
			case '/':
			case '\\':
			case '&':
			case '|':
			case ';':
			case '(':
			case ')':
				return true;
		}
		return false;
	}
	public static boolean isObjectMethod(String line)
	{
		if(line.trim().indexOf(".")>=0 && line.trim().indexOf("(")>=0 && line.trim().indexOf("=")==-1)
			return true;
		return false;
	}
	public static boolean isKeyDown(String line)
	{
		if(line.indexOf("KEY_")>=0)
			return true;
		return false;
	}
	public static boolean isEnd(String line)
	{
		if(line.trim().equals("end"))
			return true;
		return false;
	}
}
