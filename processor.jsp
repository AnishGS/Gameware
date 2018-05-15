<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.HashMap" import="com.compiler.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%!
	//seperate lines
	//check if line is a system call. if yes, the process the line as a system call.
	//else seperate the lines
	//seperate the words
	//call word recognizer and then send the word for translation to appropirate translator.
	String []allObjects=new String[200];
	int objectIterator=0;
	
	public boolean isSystemCall(String line)
	{
		return false;
	}
	public boolean isDeclaration(String line)
	{
		return false;
	}
	public String translateLine(String line)//takes a line as input and produces a complete translated js version of the line 
	{
		HashMap<String,String>store=new HashMap<String,String>();
		char counter='a';
		int i=0,tokenCount=0;
		String newWord="";
		String newCode="";
		if(isSystemCall(line))
		{
			return translateSystemAPI(line);
		}
		if(isDeclaration(line))
		{
			return translateDeclarationAPI(line);
		}
		while(i<line.length())
		{
			if(isSeperator(line.charAt(i)))
			{
				newWord=line.substring(0,i);
				newWord=newWord+" ";
				store.put(counter+"",newWord);
				counter++;
				store.put(counter+"",line.charAt(i)+"");
				line=line.substring(i+1,line.length());
				i=0;
				tokenCount+=2;
				System.out.println(i);
				counter++;
			}
			else
				i++;
		}
		//call word translator on hashmap objects
		char k='a';
		for(int j=0;j<tokenCount;j++)
		{
			newCode+="**"+store.get(k+"");
			k++;
		}
		return newCode;
		/*
		TestClass cl=new TestClass();
		System.out.println("Returning1 string");
		return cl.returnString();
		*/
		
	}
	public String translateWord(String word)
	{
		String newCode="";//will need a structure to hold objects.
		//check for the category of the given word and pass it to its converter function
		return newCode;
	}
	public String translateObjectAPI(String word)
	{
		String newCode="";
		int dotIndex=word.indexOf(".");
		String object=word.substring(0,dotIndex);
		if(word.contains("move"))
		{
			int opIndex=word.indexOf("(");
			int clIndex=word.indexOf(")");
			String argumentList=word.substring(opIndex+1,clIndex);
			String[] arguments=seperateArguments(argumentList);
			if(word.contains("X"))
			{
				newCode="interpolateHuman("+object+","+arguments[1]+","+arguments[0]+")";
			}
			else if(word.contains("Y"))
			{
				newCode="interpolateHumanY("+object+","+arguments[1]+","+arguments[0]+")";
			}
		}
		return newCode;
	}
	public boolean isSeperator(char letter)
	{
		switch(letter)
		{
			case '=':
			case '+':
			case '<':
			case '>':
			case ',':
			case '*':
			case '/':
			case '\\':
			case '&':
			case '|':
			case ';':
				return true;
		}
		return false;
	}
	public String translateSystemAPI(String word)//translate system functions
	{
		return "";
	}
	public String translateDeclarationAPI(String word)//translate system functions
	{
		return "";
	}
	public String[] seperateArguments(String args)
	{
		String []arguments=args.split(",");
		return arguments;
	}
	public int countArguments(String args)
	{
		int count=1;
		if(args.length()==0)
			return 0;
		for(int i=0;i<args.length();i++)
			if(args.charAt(i)==',')
				count+=1;
		return count;
	}
%>
<% 
	String a=request.getParameter("text1");
	out.println(translateLine(a));
%>
</body>
</html>