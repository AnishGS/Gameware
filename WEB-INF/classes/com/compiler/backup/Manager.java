package com.compiler;

public class Manager 
{
	public static String translate(String userCode,String preload,String state)
	{
		userCode=userCode.trim();
		preload=preload.trim();
		//String preload2=preload.substring(0,preload.indexOf("extend")-1).trim();
		int variablesIndex=userCode.indexOf("global:")+6;
	    String variablesBlock=getBlock(userCode,variablesIndex);
	    String varBlock=CodeTranslator.translate(variablesBlock, preload, "");
		String arrayBlock=translateArrays(preload);
		int viewIndex=userCode.indexOf("inradius:")+9;
		String viewBlock=getKeyBlock(userCode,viewIndex);
		String seenBlock=CodeTranslator.translate(viewBlock, preload, "inradius");
		int startIndex=userCode.indexOf("start:")+6;
		String createBlock="\n "+varBlock+state+".create=function()\n{ Kiwi.State.prototype.create.call(this );\n this.mouse=this.game.input.mouse; this.mouseClick=new Kiwi.GameObjects.Sprite(this,this.textures.mouse,0,0);\n this.addChild(this.mouseClick);\n"+arrayBlock+CodeTranslator.translate(getKeyBlock(userCode,startIndex),preload,"")+"this.AKey=this.game.input.keyboard.addKey(Kiwi.Input.Keycodes.A);this.DKey=this.game.input.keyboard.addKey(Kiwi.Input.Keycodes.D);this.WKey=this.game.input.keyboard.addKey(Kiwi.Input.Keycodes.W);this.upKey=this.game.input.keyboard.addKey(Kiwi.Input.Keycodes.UP);this.rightKey=this.game.input.keyboard.addKey(Kiwi.Input.Keycodes.RIGHT);this.SKey=this.game.input.keyboard.addKey(Kiwi.Input.Keycodes.S);this.leftKey=this.game.input.keyboard.addKey(Kiwi.Input.Keycodes.LEFT);this.downKey=this.game.input.keyboard.addKey(Kiwi.Input.Keycodes.DOWN);\n}";
		int keydownIndex=userCode.indexOf("keydown:")+8;
		String keyDownBlock=getKeyBlock(userCode,keydownIndex);
		String inputBlock=CodeTranslator.translate(keyDownBlock, preload,"");
		int impassableIndex=userCode.indexOf("impassable:")+11;
		String impassableBlock=getBlock(userCode,impassableIndex);
		String overlapsBlock=CodeTranslator.translate(impassableBlock, preload,"impassable");
		int collisionIndex=userCode.indexOf("collision:")+11;
		String collisionBlock=getKeyBlock(userCode,collisionIndex);
		String intersectsBlock=CodeTranslator.translate(collisionBlock,preload, "collision");
		int alwaysIndex=userCode.indexOf("always:")+7;
		String alwaysBlock=getKeyBlock(userCode,alwaysIndex);
        String gameUpdateBlock=CodeTranslator.translate(alwaysBlock, preload,"");
        //variables
		String updateBlock="\n "+state+".update=function()\n{\nKiwi.State.prototype.update.call(this);if(this.mouse.isDown) {this.mouseClick.x=this.mouse.x;this.mouseClick.y=this.mouse.y;}\n"+createMovable2Block(preload)+overlapsBlock+"\n"+intersectsBlock+"\n"+gameUpdateBlock+"\n"+seenBlock+"\n";
		updateBlock+=inputBlock;
		return createBlock+updateBlock+"}";
	}
	private static String createMovable2Block(String code)
	{
		String newCode="";
		while(code.length()>0)
		{
			String line=code.substring(0, code.indexOf(";"));
			if(line.indexOf("movable2")>=0)
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
