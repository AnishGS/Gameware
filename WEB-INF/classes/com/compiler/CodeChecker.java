package com.compiler;

public class CodeChecker //takes the user source code and outputs the JavaScript source code.
{
	public static String check(String userCode,String preload,String extra)
	{
		
		String newCode="";
		userCode=userCode.trim();
		while(userCode.length()>0)
		{
			try
			{
			int index;
			int indexSc=userCode.indexOf(";");
			int indexC=userCode.indexOf(":");
			if(indexSc!=-1 && indexC!=-1)
			{
				if(indexSc<indexC)
					index=indexSc;
				else
					index=indexC;
			}
			else if(indexSc==-1 && indexC==-1)
				break;
			else if(indexSc>indexC)
				index=indexSc;
			else
				index=indexC;
			String line=userCode.substring(0,index);
			String newLine="";
			userCode=userCode.substring(index+1,userCode.length());
			if(Checker.isSystemCall(line))
			{
				if(LineChecker.translateSystemCall(line.trim(),preload).length()>0)
				{
					newLine+=line+"&"+LineChecker.translateSystemCall(line.trim(),preload);
				}
			}
			else if(Checker.isCondition(line.trim(), preload))
			{
				if(LineChecker.translateCondition(line.trim(), preload).length()>0)
				{
					//newLine+="<br>Error during condiiton check.<br>An error occured in the followng line.<br>&nbsp;&nbsp;&nbsp;&nbsp;"+line+"<br>"+LineChecker.translateCondition(line.trim(),preload);
					
				}
			}
			else if(Checker.isWhile(line.trim()))
			{
				if(LineChecker.translateWhile(line.trim(), preload).length()>0)
				{
					//System.out.println(line);
					//System.out.println("Error during while loop");
				}
			}
			else if(Checker.isVarDeclaration(line.trim(),preload))
			{
				if(LineChecker.translateVarDeclaration(line.trim(),preload).length()>0)
				{
					System.out.println(line);
					System.out.println("Error during variable declaration");
				}
			}
			else if(Checker.isAssignment(line.trim(),preload))
			{
				if(LineChecker.translateAssignment(line.trim(), preload).length()>0)
				{
					System.out.println(line);
					System.out.println("Error during assignment");
				}
			}
			else if(Checker.isObjectMethod(line))
			{
				if(LineChecker.translateObjectMethodCall(line,preload).length()>0)
				{
					newLine+=line+"&"+LineChecker.translateObjectMethodCall(line.trim(),preload);
					
				}
			}
			else if(Checker.isKeyDown(line))
			{
				if(LineChecker.translateKeyDown(line.trim(), preload).length()>0)
				{
					System.out.println(line);
					
					System.out.println("Error during key down");
				}
			}
			else if(Checker.isEnd(line))
			{
				
			}
			else if(Checker.isWith(line))
			{
				if(extra.equals("impassable"))
				{
					if(LineChecker.translateImpassable(line,preload).length()>0)
					{
						newLine+=line+"&"+LineChecker.translateImpassable(line.trim(),preload);
						
					}
				}
				else if(extra.equals("collision"))
				{
					if(LineChecker.translateCollision(line,preload).length()>0)
					{
						newLine+=line+"&"+LineChecker.translateCollision(line.trim(),preload);
						
					}
				}
				else if(extra.equals("inradius"))
				{
					if(LineChecker.translateView(line,preload).length()>0)
					{
						newLine+=line+"&"+LineChecker.translateView(line.trim(),preload);
						
					}
				}
			}
			else
			{
				System.out.println(line);
				if(line.trim().length()!=0)
				{
					newLine+=(line +"&The line could not be resolved.");
				}
			}
				
				newCode=newCode+newLine;
				if(!newLine.trim().equals(""))
					newCode+="#";
			}
			catch(Exception e)
			{
				newCode=newCode+"unknown error:<br>";
			}
		}
		return newCode;
	}
	
}
