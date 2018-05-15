package com.compiler;

public class CodeTranslator //takes the user source code and outputs the JavaScript source code.
{
	public static String translate(String userCode,String preload,String extra)
	{
		String newCode="";
		userCode=userCode.trim();
		while(userCode.length()>0)
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
			System.out.println(line);
			userCode=userCode.substring(index+1,userCode.length());
			if(Checker.isSystemCall(line))
			{
				line=LineTranslator.translateSystemCall(line.trim(),preload);		
			}
			/*else if(extra.indexOf("extend")>=0)
			{
				line=LineTranslator.translateExtendBlock(line, preload,extra);
			}*/
			else if(Checker.isCondition(line.trim(), preload))
			{
				line=LineTranslator.translateCondition(line.trim(), preload);
			}
			else if(Checker.isWhile(line.trim()))
			{
				line=LineTranslator.translateWhile(line.trim(), preload);
			}
			else if(Checker.isVarDeclaration(line.trim(),preload))
			{
				line=LineTranslator.translateVarDeclaration(line.trim(),preload);
			}
			else if(Checker.isAssignment(line.trim(),preload))
			{
				line=LineTranslator.translateAssignment(line.trim(), preload);
			}
			else if(Checker.isObjectMethod(line))
			{
				line=LineTranslator.translateObjectMethodCall(line,preload);
			}
			else if(Checker.isKeyDown(line))
			{
				line=LineTranslator.translateKeyDown(line.trim(), preload);
			}
			else if(Checker.isEnd(line))
			{
				line=LineTranslator.translateEnd();
			}
			else if(Checker.isWith(line))
			{
				if(extra.equals("impassable"))
				{
					line=LineTranslator.translateImpassable(line,preload);
				}
				else if(extra.equals("collision"))
				{
					line=LineTranslator.translateCollision(line,preload);
				}
				else if(extra.equals("inradius"))
				{
					line=LineTranslator.translateView(line,preload);
				}
			}
			newCode=newCode+line+"\n";
		}
		return newCode;
	}
}
