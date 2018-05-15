package com.compiler;

public class CheckManager 
{
	public static String check(String userCode,String preload,String state)
	{
		userCode=userCode.trim();
		preload=preload.trim();
		
		int variablesIndex=userCode.indexOf("global:")+6;
	    String variablesBlock=getBlock(userCode,variablesIndex)+";";
	    String varBlock=CodeChecker.check(variablesBlock, preload, "");
	    
		//String arrayBlock=translateArrays(preload);
		
		int viewIndex=userCode.indexOf("inradius:")+9;
		String viewBlock=getKeyBlock(userCode,viewIndex);
		String seenBlock=CodeChecker.check(viewBlock, preload, "inradius");
		
		int startIndex=userCode.indexOf("start:")+6;
		String createBlock=CodeChecker.check(getKeyBlock(userCode,startIndex),preload,"");
		
		createBlock+="";
		int keydownIndex=userCode.indexOf("keydown:")+8;
		String keyDownBlock=getKeyBlock(userCode,keydownIndex);
		String inputBlock=CodeChecker.check(keyDownBlock, preload,"");
		
		int impassableIndex=userCode.indexOf("impassable:")+11;
		String impassableBlock=getBlock(userCode,impassableIndex);
		String overlapsBlock=CodeChecker.check(impassableBlock, preload,"impassable");
		
		int collisionIndex=userCode.indexOf("collision:")+10;
		String collisionBlock=getKeyBlock(userCode,collisionIndex);
		String intersectsBlock=CodeChecker.check(collisionBlock,preload, "collision");
		
		int alwaysIndex=userCode.indexOf("always:")+7;
		String alwaysBlock=getKeyBlock(userCode,alwaysIndex);
        String gameUpdateBlock=CodeChecker.check(alwaysBlock, preload,"");
        
		String updateBlock=varBlock+overlapsBlock+"\n"+intersectsBlock+"\n"+gameUpdateBlock+"\n"+seenBlock+"\n";
		updateBlock+=inputBlock;
		return createBlock+updateBlock;
	}
	private static String getKeys(String code)
	{
		String keys="";
		while(code.indexOf("KEY_")>=0)
		{
			code=code.substring(code.indexOf("KEY_"));
			String key=code.substring(4, code.indexOf(":"));
			keys+="this."+key+"key=this.game.input.keyboard.addKey(Kiwi.Input.Keycodes."+key+");";
			code=code.substring(code.indexOf(":"));
		}
		return keys;
	}
	private static String createMovable2Block(String code)
	{
		String newCode="";
		while(code.length()>0)
		{
			String line=code.substring(0, code.indexOf(";"));
			if(line.indexOf("topdown")>=0)
			{
				String object="";
				if(line.indexOf("[")>=0)
			    {
				   object=line.substring(line.indexOf("]")+1,line.indexOf("("));
				   newCode+="for(var i=0;i<this."+object+".numChildren();i++){\n if(this."+object+"!=null){ this."+object+".getChildAt(i).physics.velocity.x=0;\n this."+object+".getChildAt(i).physics.velocity.y=0;}}";
			    }
				else
				{
					object=line.substring(line.indexOf(" ")+1,line.indexOf("("));
					newCode+="if (this."+object+"!=null) {this."+object+".physics.velocity.x=0;\n this."+object+".physics.velocity.y=0;}";	
				}
			}
			code=code.substring(code.indexOf(";")+1,code.length());
		}
		return newCode;
	}
	private static String getBlock(String block,int startIndex)
	{
		String tBlock=block.substring(startIndex);
		return tBlock.substring(0, tBlock.indexOf("end;")-1);
	}
	private static String getKeyBlock(String block,int startIndex)
	{
		int noS=1;
		int noE=0;
		int i=startIndex;
		while(noS!=noE)
		{
			if(block.charAt(i)==':')
				noS++;
			else if(block.substring(i,i+4).equals("end;"))
				noE++;
			i++;
		}
		return block.substring(startIndex, i-1);
	}
	private static String translateArrays(String code)
	{
		String newCode="";
		while(code.length()>0)
		{
			String line=code.substring(0, code.indexOf(";"));
			if(line.indexOf("]")>=0)
			{
				newCode+=LineTranslator.translateArrayDeclaration(line);
			}
			code=code.substring(code.indexOf(";")+1,code.length());
		}
		return newCode;
	}
}
