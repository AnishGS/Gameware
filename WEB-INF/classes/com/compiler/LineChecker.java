package com.compiler;

public class LineChecker
{
	public static String translateSystemCall(String word,String preload)
	{
		String []arguments;
		String newCode="";
		String objectToLoad;
		switch(getSystemCallName(word))
		{
			case "loadObject":
				arguments=getArgumentList(word);
				if(arguments.length!=3)
					return "loadObject() expects three arguments.";
				objectToLoad=arguments[0];
				String array="";
				
				if(objectToLoad.indexOf("[")>-1  || objectToLoad.indexOf("]")>-1 || objectToLoad.indexOf("[")<=objectToLoad.indexOf("]")-1)
				{
					array=objectToLoad.substring(0,objectToLoad.indexOf("["));
					if(!(objectToLoad.indexOf("[")>-1  && objectToLoad.indexOf("]")>-1 && objectToLoad.indexOf("[")<objectToLoad.indexOf("]")-1))
					{
						return ("The array is not subscripted properly");
					}
				}
				if(getDataType(objectToLoad,preload).equals("platformer"))
				{
					return "";
				}
				else if(getDataType(array,preload).equals("platformer array"))
				{
					return "";
				}
				else if(getDataType(objectToLoad,preload).equals("static"))
				{
					return "";
				}
				else if(getDataType(array,preload).equals("static array"))
				{
					return "";
				}
				else if(getDataType(objectToLoad,preload).equals("gun"))
				{
					return "";
				}
				else if(getDataType(objectToLoad,preload).equals("topdown"))
				{
					return "";
				}
				else if(getDataType(array,preload).equals("topdown array"))
				{
					return "";
				}
				else
				{
					if(getDataType(objectToLoad,preload).length()==0)
					{
						return("The object <b>"+objectToLoad+"</b> has not been declared in file preload.js.");
					}
					return ("Objects of type <b>"+getDataType(objectToLoad,preload)+"</b> cannot be loaded with loadObject().");
				}
				
			case "loadAudio":
				arguments=getArgumentList(word);
				if(arguments.length!=1 || arguments[0].length()==0)
				{
					return("loadAudio() expects only one argument.");
				}
				if(getDataType(arguments[0],preload).trim().length()==0)
				{
					return ("The object <b>"+arguments[0]+"</b> has not been declared in file preload.ps.");
				}
				if(!(getDataType(arguments[0],preload).trim().equals("audio")))
				{
					return ("objects of type <b>"+getDataType(arguments[0],preload).trim()+"</b> cannot be loaded with loadAudio(). Try loadObject() instead.");	
				}
				return "";
			case "switchState":
				arguments=getArgumentList(word);
				if(arguments.length!=1)
				{
					return "switchState() expects only one argument.";
				}
				return newCode;
			case"setBgColor":
				arguments=getArgumentList(word);
				if((arguments.length!=1 || arguments[0].length()==0))
				{
					return "setBgColor() expects only one argument.";
				}
				return "";
		}
		return "";
	}
	public static String translateArrayDeclaration(String word)
	{
		String object=word.substring(word.indexOf("]")+1, word.indexOf("("));
		return "";
	}
	public static String translateImpassable(String word,String preload)
	{
		try
		{
			word=word.trim();
			String object1=word.substring(0, word.indexOf(" ")).trim();
			String object2=word.substring(word.indexOf("with")+4).trim();	
			boolean fo=false;
			boolean so=false;
			//System.out.println(object1+" , "+object2);
			if((!(getDataType(object1.trim(),preload).trim().equals("audio")) && getDataType(object1.trim(),preload).trim().length()>0) || isArray(object1.trim(),preload))
			{
				fo=true;
			}
			if((!(getDataType(object2.trim(),preload).trim().equals("audio")) && getDataType(object2.trim(),preload).trim().length()>0) || isArray(object2.trim(),preload))
			{
			//	System.out.println(object2+"is true");
				so=true;
			}
			//System.out.println(fo+" , "+so);
			if(fo && so)
			{
				return "";
			}
			else
			{
				System.out.println("illegal objects");
				return "Two valid objects must be present on both sides of <b>impassable</b>";
			}
		}
		catch(Exception e)
		{
			return "Unknown error.";
		}
	}
	public static String translateVarDeclaration(String word,String preload)
	{
		try
		{
			String newCode=word.substring(word.trim().indexOf(" ")).trim();
			if(word.indexOf("=")>=0)
			{
				newCode=translateAssignment(newCode,preload);
			}
			return "";
		}
		catch(Exception e)
		{
			return "E";
		}
		
	}
	public static String translateCondition(String word,String preload)
	{
		try
		{
			String code=word.substring(word.indexOf("("));
			String newCode=translateAssignment(code,preload);
			newCode=newCode.substring(0, newCode.length()-1);
			return "";
		}
		catch(Exception e)
		{
			return "Unknown Error";
		}
		
	}
	public static String translateWhile(String word,String preload)
	{
		try
		{
			String code=word.substring(word.indexOf("("));
			String newCode=translateAssignment(code,preload);
			newCode=newCode.substring(0, newCode.length()-1);
			return "";
		}
		catch(Exception e)
		{
			return "Unknown Error";
		}
		
	}
	public static String translateAssignment(String word,String preload)
	{
		try
		{
			int i=0,index=0;
			word+=";";
			word=word.replace("random", "getRandomNum");
			String []token =new String[200];
			while(i<word.length())
			{
				if(Checker.isSeperator(word.charAt(i)))
				{
					token[index]=word.substring(0, i);
					index++;
					token[index]=word.charAt(i)+"";
					index++;
					word=word.substring(i+1);
					i=0;
				}
				else
					i++;
			}
			for(i=0;i<index;i++)
			{
				translateWord(token[i],preload);
			}
			
			return "";
		}
		catch(Exception e)
		{
			return "Unknown Error";
		}
		
	}
	private static String translateWord(String word,String preload)
	{
	
		String object="";
		String subScript="";
		String extra="";
		if(word.indexOf(".")>=0)
		{
			if(word.indexOf("[")>=0)
			{
				object=word.substring(0, word.indexOf("["));
				subScript=word.substring(word.indexOf("[")+1,word.indexOf("]"));
				extra=word.substring(word.indexOf("]")+1);
				return "this."+object+".getChildAt("+subScript+")"+extra;
			}
			return "this."+word;
		}
		return word;
			
	}
	public static String translateView(String word,String preload)
	{
		try
		{
			word=word.trim();
			String object1=word.substring(0, word.indexOf(" ")).trim();
			String object2=word.substring(word.indexOf("with")+4).trim();	
			boolean fo=false;
			boolean so=false;
			//System.out.println(object1+" , "+object2);
			if((!(getDataType(object1.trim(),preload).trim().equals("audio")) && getDataType(object1.trim(),preload).trim().length()>0) || isArray(object1.trim(),preload))
			{
				fo=true;
			}
			if((!(getDataType(object2.trim(),preload).trim().equals("audio")) && getDataType(object2.trim(),preload).trim().length()>0) || isArray(object2.trim(),preload))
			{
			//	System.out.println(object2+"is true");
				so=true;
			}
		//	System.out.println(fo+" , "+so);
			if(fo && so)
			{
				return "";
			}
			else
			{
				System.out.println("illegal objects");
				return "E";
			}
		}
		catch(Exception e)
		{
			return "Unknown Error";
		}
		
	}
	public static String translateCollision(String word,String preload)
	{
		try
		{
			word=word.trim();
			String object1=word.substring(0, word.indexOf(" ")).trim();
			String object2=word.substring(word.indexOf("with")+4).trim();	
			boolean fo=false;
			boolean so=false;
			//System.out.println(object1+" , "+object2);
			if((!(getDataType(object1.trim(),preload).trim().equals("audio")) && getDataType(object1.trim(),preload).trim().length()>0) || isArray(object1.trim(),preload))
			{
				fo=true;
			}
			if((!(getDataType(object2.trim(),preload).trim().equals("audio")) && getDataType(object2.trim(),preload).trim().length()>0) || isArray(object2.trim(),preload))
			{
				System.out.println(object2+"is true");
				so=true;
			}
		//	System.out.println(fo+" , "+so);
			if(fo && so)
			{
				return "";
			}
			else
			{
				System.out.println("illegal objects");
				return "Two valid objects must be present on both sides of <b>with</b>";
			}
		}
		catch(Exception e)
		{
			return "Unknown Error";
		}
		
	}
	 private static boolean isSet(String object,String preload)
	{
		 if(getDataType(object,preload).equals("gun"))
			return true;
		else if(preload.indexOf("]"+object+"(")>=0)
			return true;
		return false;
	}
	 private static boolean isArray(String object,String preload)
	 {
		 if(preload.indexOf("]"+object.trim()+"(")>=0)
			return true;
		 return false;
	 }
	public static String translateKeyDown(String word,String preload)
	{
		word=word.trim();
		String key=word.substring(word.indexOf("_")+1);
			return "if(this."+key+"key.isDown){";
		//return "";
	}
	public static String translateEnd()
	{
		return "}";
	}
	private static String getDataType(String object,String preload)
	{
		object=object.trim();
		if(object.indexOf("mouseClick")>=0)
			return "mouseClick";
		if(object.indexOf("camera")>=0)
			return "camera";
		while(preload.length()>0)
		{
			
			String line=preload.substring(0, preload.indexOf(";"));
			if(line.indexOf("platformer "+object+"(")>=0)
				return "platformer";
			else if(line.indexOf("static "+object+"(")>=0)
				return "static";
			else if(line.indexOf("gun "+object+"(")>=0)
				return "gun";
			else if(line.indexOf("topdown "+object+"(")>=0)
				return "topdown";
			else if(line.indexOf("audio "+object+"(")>=0)
				return "audio";
			else if(line.indexOf("]"+object+"(")>=0)
			{
				if(line.indexOf("topdown ")>=0)
					return "topdown array";
				if(line.indexOf("platformer ")>=0)
					return "platformer array";
				if(line.indexOf("static")>=0)
					return "static array";
			}
			preload=preload.substring(preload.indexOf(";")+1);
		}
		return "";
	}
	public static String translateDeclaration(String word,String root)
	{
		System.out.println("Root= "+root);
		String objectToDeclare=word.substring(word.indexOf(" ")+1,word.indexOf("("));
		if(objectToDeclare.indexOf("]")>=0)
		{
			objectToDeclare=objectToDeclare.substring(objectToDeclare.indexOf("]")+1);
		}
		String objectType=word.trim().substring(0,word.indexOf(" "));
		String []arguments=getArgumentListForDeclaration(word);
		String image=getUserRoot(root)+arguments[0];
		String newCode="";
		if(objectType.indexOf("audio")>=0)
			newCode="this.addAudio('"+objectToDeclare+"','"+image+"');";	
		else
			newCode="this.addImage('"+objectToDeclare+"','"+image+"');";
		return newCode;
	}
	private static String getUserRoot(String root)
	{
		int i=root.length()-1;
		while(root.charAt(i)!='/')
			i--;
		return root.substring(33, i+1);
	}
	public static String translateObjectMethodCall(String word,String preload)
	{
		String object=word.substring(0, word.indexOf("."));
		String method=word.substring(word.indexOf("."),word.indexOf("("));
		String []arguments=getArgumentList(word);
		if(method.indexOf("moveX")>=0)
		{
			if(arguments.length!=1)
			{
				System.out.println("You have not passed correct argument here.");
				return "moveX() expects only one argument.";
			}
			if(object.indexOf("[")>=0)
			{
				object=object.substring(0,object.indexOf("["));
			}
			if(isArray(object.trim(),preload))
			{
				return "";
			}
			else
			{
				String dataType=getDataType(object.trim(),preload);
				if(dataType.equals("topdown") || dataType.equals("platformer"))
					return "";
				else if(dataType.trim().length()==0)
				{
					return ("The object <b>"+object+"</b>has not been declared in preload.ps");
				}
				else
				{
					System.out.println(dataType+ " arguments cannot be passed as a parameter to moveX.");
					return "moveX() can only be invoked from an object of platformer or topdown class.";
				}
			}
		}
		else if(method.indexOf("moveY")>=0)
		{
			if(arguments.length!=1)
			{
				System.out.println("You have not passed correct argument here.");
				return "moveY() expects only one argument.";
			}
			if(object.indexOf("[")>=0)
			{
				object=object.substring(0,object.indexOf("["));
			}
			if(isArray(object.trim(),preload))
			{
				return "";
			}
			else
			{
				String dataType=getDataType(object.trim(),preload);
				if(dataType.equals("topdown") || dataType.equals("platformer"))
					return "";
				else if(dataType.trim().length()==0)
				{
					return ("The object <b>"+object+"</b>has not been declared in preload.ps");
				}
				else
				{
					System.out.println(dataType+ " arguments cannot be passed as a parameter to moveY.");
					return "moveY() can only be invoked from an object of platformer or topdown class.";
				}
			}
		}
		else if(method.indexOf("follow")>=0)
		{
			if(arguments.length!=2)
			{
				System.out.println("You have not passed correct argument here.");
				return "follow() expects two arguments.";
			}
			if(object.indexOf("[")>=0)
			{
				object=object.substring(0,object.indexOf("["));
			}
			if(isArray(object.trim(),preload))
			{
				return "";
			}
			else
			{
				String dataType=getDataType(object.trim(),preload);
				if(dataType.equals("topdown") || dataType.equals("platformer"))
					return "";
				else if(dataType.trim().length()==0)
				{
					return ("The object <b>"+object+"</b>has not been declared in preload.ps");
				}
				else
				{
					System.out.println("follow method cannot be used with objecs of type "+dataType);
					return "follow() can only be invoked from an object of platformer or topdown class.";
				}
			}
		}
		else if(method.indexOf("jump")>=0)
		{
			if(arguments.length!=1)
			{
				System.out.println("You have not passed correct argument here.");
				return "jump() expects only one argument.";
			}
			if(object.indexOf("[")>=0)
			{
				object=object.substring(0,object.indexOf("["));
			}
			if(isArray(object.trim(),preload))
			{
				return "";
			}
			else
			{
				String dataType=getDataType(object.trim(),preload);
				if(dataType.equals("topdown") || dataType.equals("platformer"))
					return "";
				else if(dataType.trim().length()==0)
				{
					return ("The object "+object+"has not been declared in preload.js");
				}
				else
				{
					System.out.println(dataType+ " arguments cannot be passed as a parameter to jump.");
					return "jump() can only be invoked from an object of platformer or topdown class.";
				}
			}
		}
		else if(method.indexOf("scaleX")>=0)
		{
			if(arguments.length!=1)
				return "scaleX() expects only one argument.";
			if(object.indexOf("[")>=0)
			{
				if(isArray(object,preload))
				{
					return "";
				}
				return "Only array objects can use [] signs.";
			}
			else if(isArray(object.trim(),preload))
			{
				return "";
			}
			return "";
		}
		else if(method.indexOf("stick")>=0)
		{
			if(arguments.length!=1)
				return "stick() expects only one argument.";
			if(object.indexOf("[")>=0)
			{
				if(isArray(object,preload))
				{
					return "";
				}
				return "Only array objects can use [] signs.";
			}
			else if(isArray(object.trim(),preload))
			{
				return "";
			}
			return "";
		}
		else if(method.indexOf("setRadius")>=0)
		{
			if(arguments.length!=2)
				return "setRadius() expects two arguments.";
			if(object.indexOf("[")>=0)
			{
				if(isArray(object,preload))
				{
					return "";
				}
				return "Only array objects can use [] signs.";
			}
			else if(isArray(object.trim(),preload))
			{
				return "";
			}
			return "";
		}
		else if(method.indexOf("shootX")>=0)
		{
			if(arguments.length!=1 && arguments[0].trim().length()==0)
			{
				return "shootX() expects no arguments.";
			}
			String dataType=getDataType(object.trim(),preload);
			if(dataType.trim().length()==0)
			{
				System.out.println("The object "+object+" has not been declared in preload.");
				return "The object "+object+" has not been declared in preload.ps.";
			}
			if(!dataType.trim().equals("gun"))
			{
				System.out.println("object of  "+dataType+" is incorrect");
				return "shootX() can only be invoked from an object of gun class.";
				
			}
		}
		else if(method.indexOf("shootY")>=0)
		{
			if(arguments.length!=1 && arguments[0].trim().length()==0)
			{
				return "shootY() expects no arguments.";
				
			}
			String dataType=getDataType(object.trim(),preload);
			if(dataType.trim().length()==0)
			{
				System.out.println("The object "+object+" has not been declared in preload.");
				return "The object "+object+" has not been declared in preload.ps.";
			}
			if(!dataType.trim().equals("gun"))
			{
				System.out.println("object of  "+dataType+" is incorrect");
				return "shootY() can only be invoked from an object of gun class.";
			}
		}
		else if(method.indexOf("playForever")>=0)
		{
			return "";
		}
		else if(method.indexOf("playOnce")>=0)
		{
			if(arguments.length!=1 && arguments[0].trim().length()==0)
			{
				return "playOnce() expects no arguments.";
			}
			if(getDataType(object,preload).trim().equals("audio"))
				return "";
			if(getDataType(object,preload).length()==0)
			{
				System.out.println("The object "+object+" has not been declared in preload.");
				
				return "The object "+object+" has not been declared in preload.ps.";
			}
			System.out.println("The object "+object+" is not audio.");
			
			return "playOnce() can only be invoked from an object of audio class.";
			
		}
		else if(method.indexOf("stop")>=0)
		{
			if(arguments.length!=1 && arguments[0].trim().length()==0)
			{
				return "stop() expects no arguments";
			}
			if(getDataType(object,preload).equals("audio"))
				return "";
			if(getDataType(object,preload).trim().length()==0)
			{
				System.out.println("The object "+object+" has not been declared in preload.");
				
				return "The object "+object+" has not been declared in preload.ps.";
			}
			System.out.println("The object "+object+" is not audio.");
			
			return "stop() can only be invoked from an object of audio class.";
			
		}
		else if(method.indexOf("destroy")>=0)
		{
			if(arguments.length!=1 && arguments[0].length()==0)
			{
				return "destroy() expects no arguments.";
			}
			if(isArray(object.trim(),preload))
			{
				return "";
			}
			if(getDataType(object,preload).trim().length()==0)
			{
				System.out.println("This object"+object+" has not yet been loaded.");
				return "This object"+object+" has not been loaded in preload.ps.";
			}
		}
		else
		{
			System.out.println("The method "+method.substring(1)+" does not belong to any in built class.");
			return "The method "+method.substring(1)+" does not belong to any in built class.";
		}
		return "";
	} 
	private static String getSystemCallName(String word)
	{
		if(word.indexOf("loadObject(")>=0)
			return "loadObject";
		else if(word.indexOf("loadState(")>=0)
			return "loadState";
		else if(word.indexOf("loadAudio(")>=0)
			return "loadAudio";
		else if(word.indexOf("switchState(")>=0)
			return "switchState";
		else if(word.indexOf("setBgColor(")>=0)
			return "setBgColor";
		return "";
	}
	private static String[] getArrayArguments(String word)
	{
		String args=word.substring(word.indexOf("(")+1, word.indexOf(")"));
		String []list=args.split(",");
		String subScript="";
		String extra="";
		for(int i=0;i<list.length;i++)
		{
			if(list[i].indexOf("]")>=0)
			{
				subScript=list[i].substring(list[i].indexOf("[")+1, list[i].indexOf("]"));
				extra=list[i].substring(list[i].indexOf("]")+1);
				list[i]=list[i].substring(0, list[i].indexOf("["));
				list[i]+=".getChildAt("+subScript+")"+extra;
			}
				
		}
		return list;
	}
	private static String[] getArgumentList(String word)
	{
		String args=word.substring(word.indexOf("(")+1, word.indexOf(")"));
		String []list=args.split(",");
		String subScript="";
		String extra="";
		for(int i=0;i<list.length;i++)
		{
			if(list[i].indexOf(".")>=0)
			{
				if(list[i].indexOf("]")>=0)
				{
					subScript=list[i].substring(list[i].indexOf("[")+1, list[i].indexOf("]"));
					extra=list[i].substring(list[i].indexOf("]")+1);
					list[i]=list[i].substring(0, list[i].indexOf("["));
					list[i]+=".getChildAt("+subScript+")"+extra;
				}
				list[i]="this."+list[i];
			}
		}
		return list;
	}
	private static String[] getArgumentListForDeclaration(String word)
	{
		String args=word.substring(word.indexOf("(")+1, word.indexOf(")"));
		String []list=args.split(",");
		return list;
	}
}
