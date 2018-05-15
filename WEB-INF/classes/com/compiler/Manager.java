package com.compiler;

public class Manager 
{
	public static String translate(String userCode,String preload,String state)
	{
		userCode=userCode.trim();
		preload=preload.trim();
		
		int variablesIndex=userCode.indexOf("global:")+6;
		String varBlock="";
		if(userCode.indexOf("global:")==-1)
		{
			varBlock="";
		}
		else
		{
			String variablesBlock=getBlock(userCode,variablesIndex)+";";
		    varBlock=CodeTranslator.translate(variablesBlock, preload, "");
		}
	    
	    
		String arrayBlock=translateArrays(preload);
		
		int viewIndex=userCode.indexOf("inradius:")+9;
		String seenBlock="";
		if(userCode.indexOf("inradius:")==-1)
		{
			seenBlock="";
		}
		else
		{
			String viewBlock=getKeyBlock(userCode,viewIndex);
			seenBlock=CodeTranslator.translate(viewBlock, preload, "inradius");
		}
		
		
		int startIndex=userCode.indexOf("start:")+6;
		String createBlock="\n "+varBlock+state+".create=function()\n{";
		createBlock+=" Kiwi.State.prototype.create.call(this );\n this.mouse=this.game.input.mouse;";
		createBlock+="this.mouseClick=new Kiwi.GameObjects.Sprite(this,this.textures.mouse,0,0);\n ";
		createBlock+="this.addChild(this.mouseClick);\n"+arrayBlock+CodeTranslator.translate(getKeyBlock(userCode,startIndex),preload,"");
		System.out.println("------"+getKeys(userCode));
		createBlock+="\n"+getKeys(userCode)+"\n}";
		
		int keydownIndex=userCode.indexOf("keydown:")+8;
		String inputBlock="";
		if(userCode.indexOf("keydown:")==-1)
		{
			inputBlock="";
		}
		else
		{
			String keyDownBlock=getKeyBlock(userCode,keydownIndex);
			inputBlock=CodeTranslator.translate(keyDownBlock, preload,"");
		}
		int impassableIndex=userCode.indexOf("impassable:")+11;
		String overlapsBlock="";
		if(userCode.indexOf("impassable:")==-1)
		{
			overlapsBlock="";
		}
		else
		{
			String impassableBlock=getBlock(userCode,impassableIndex);
			overlapsBlock=CodeTranslator.translate(impassableBlock, preload,"impassable");
		}
		
		int collisionIndex=userCode.indexOf("collision:")+10;
		String intersectsBlock="";
		if(userCode.indexOf("collision:")==-1)
		{
			intersectsBlock="";
		}
		else
		{
			String collisionBlock=getKeyBlock(userCode,collisionIndex);
			intersectsBlock=CodeTranslator.translate(collisionBlock,preload, "collision");
		}
		
		int alwaysIndex=userCode.indexOf("always:")+7;
		String gameUpdateBlock="";
		if(userCode.indexOf("always:")==-1)
		{
			gameUpdateBlock="";
		}
		else
		{
			String alwaysBlock=getKeyBlock(userCode,alwaysIndex);
			gameUpdateBlock=CodeTranslator.translate(alwaysBlock, preload,"");
		}
		String updateBlock="\n "+state+".update=function()\n{\nKiwi.State.prototype.update.call(this);if(this.mouse.isDown) {this.mouseClick.x=this.mouse.x;this.mouseClick.y=this.mouse.y;}\n"+createMovable2Block(preload)+overlapsBlock+"\n"+intersectsBlock+"\n"+gameUpdateBlock+"\n"+seenBlock+"\n";
		updateBlock+=inputBlock;
		return createBlock+updateBlock+"}";
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
