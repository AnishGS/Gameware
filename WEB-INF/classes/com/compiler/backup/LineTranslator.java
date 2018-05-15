package com.compiler;

public class LineTranslator
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
				objectToLoad=arguments[0];
				String array="";
				if(objectToLoad.indexOf("[")>-1)
				{
					array=objectToLoad.substring(0,objectToLoad.indexOf("["));
				}
				String x=arguments[1];
				String y=arguments[2];
				if(getDataType(objectToLoad,preload).equals("movable"))
				{
					newCode+="this."+objectToLoad+"=new Kiwi.GameObjects.Sprite(this,this.textures."+objectToLoad+","+x+","+y+")"+";";
					newCode+="\n this."+objectToLoad+".physics=this."+objectToLoad+".components.add(new Kiwi.Components.ArcadePhysics(this."+objectToLoad+",this."+objectToLoad+".box));";
				    newCode+="this."+objectToLoad+".physics.acceleration.y = 200;";
				    newCode+="this."+objectToLoad+".physics.maxVelocity = 200;";
					newCode+="this."+objectToLoad+".physics.drag.x = 200;";
					newCode+="this.addChild(this."+objectToLoad+");";
				}
				else if(getDataType(array,preload).equals("movableArray"))
				{
					String subScript=objectToLoad.substring(objectToLoad.indexOf("[")+1, objectToLoad.indexOf("]"));
					objectToLoad=objectToLoad.substring(0,objectToLoad.indexOf("["));
					String child=objectToLoad+"_child_"+subScript;
					newCode+="var "+child+"= new Kiwi.GameObjects.Sprite(this,this.textures."+objectToLoad+","+x+","+y+")";
					newCode+="\n "+child+".physics="+child+".components.add(new Kiwi.Components.ArcadePhysics("+child+","+child+".box));";
				    newCode+=child+".physics.acceleration.y = 200;";
				    newCode+=child+".physics.maxVelocity = 200;";
					newCode+=child+".physics.drag.x = 200;";
					newCode+="this."+objectToLoad+".addChild("+child+")";
				}
				else if(getDataType(objectToLoad,preload).equals("static"))
				{
					newCode+="this."+objectToLoad+"=new Kiwi.GameObjects.Sprite(this,this.textures."+objectToLoad+","+x+","+y+")"+";";
					newCode+="\n this."+objectToLoad+".physics=this."+objectToLoad+".components.add(new Kiwi.Components.ArcadePhysics(this."+objectToLoad+",this."+objectToLoad+".box));";
					newCode+="this."+objectToLoad+".physics.immovable=true;";
					newCode+="this.addChild(this."+objectToLoad+");";
				}
				else if(getDataType(array,preload).equals("staticArray"))
				{
					String subScript=objectToLoad.substring(objectToLoad.indexOf("[")+1, objectToLoad.indexOf("]"));
					objectToLoad=objectToLoad.substring(0,objectToLoad.indexOf("["));
					String child=objectToLoad+"_child_"+subScript;
					newCode+="var "+child+"= new Kiwi.GameObjects.Sprite(this,this.textures."+objectToLoad+","+x+","+y+")";
					newCode+="\n "+child+".physics="+child+".components.add(new Kiwi.Components.ArcadePhysics("+child+","+child+".box));";
					newCode+="\n "+child+".physics.immovable=true;";
					newCode+="this."+objectToLoad+".addChild("+child+")";					
				}
				else if(getDataType(objectToLoad,preload).equals("gun"))
				{
					newCode+="this."+objectToLoad+"=new Kiwi.Group(this);\n this.addChild(this."+objectToLoad+");\n";
				}
				else if(getDataType(objectToLoad,preload).equals("movable2"))
				{
					newCode+="\nthis."+objectToLoad+"=new SpriteWithPhysics(this,this.textures."+objectToLoad+","+x+","+y+")"+";";
					newCode+="this.addChild(this."+objectToLoad+");";
						
				}
				else if(getDataType(array,preload).equals("movable2Array"))
				{
					String subScript=objectToLoad.substring(objectToLoad.indexOf("[")+1, objectToLoad.indexOf("]"));
					objectToLoad=objectToLoad.substring(0,objectToLoad.indexOf("["));
					String child=objectToLoad+"_child_"+subScript;
					newCode+="var "+child+"= new SpriteWithPhysics(this,this.textures."+objectToLoad+","+x+","+y+");";
					newCode+="this."+objectToLoad+".addChild("+child+")";	
				}
				
				return newCode;
			case "loadAudio":
				arguments=getArgumentList(word);
				objectToLoad=arguments[0];
				newCode="this."+objectToLoad+"_forever=new Kiwi.Sound.Audio(this.game,'"+objectToLoad+"',1,true);";
				newCode+="this."+objectToLoad+"_once=new Kiwi.Sound.Audio(this.game,'"+objectToLoad+"',1,false);";
				return newCode;
			case "switchState":
				arguments=getArgumentList(word);
				newCode="this.game.states.switchState('"+arguments[0]+"');";
				return newCode;
			case"setBgColor":
				arguments=getArgumentList(word);
				newCode="this.game.stage.color= '"+arguments[0]+"';";
				return newCode;
		}
		return "";
	}
	public static String translateArrayDeclaration(String word)
	{
		String object=word.substring(word.indexOf("]")+1, word.indexOf("("));
		return "this."+object+"=new Kiwi.Group(this); this.addChild(this."+object+");";
	}
	public static String translateImpassable(String word,String preload)
	{
		word=word.trim();
		String object1=word.substring(0, word.indexOf(" "));
		String object2=word.substring(word.indexOf("with")+4);		
		if(isArray(object1,preload) && isArray(object2,preload))
		{
			String code="for(var i=0;i<this."+object1+".numChildren();i++) for(var j=0;j<this."+object2+".numChildren();j++)\n";
			code+="this."+object1.trim()+".getChildAt(i).physics.overlaps("+"this."+object2.trim()+".getChildAt(j),true)";
			return code;
		}
		else if(!isArray(object1,preload) && !isArray(object2,preload))
		{
			return "this."+object1.trim()+".physics.overlaps("+"this."+object2.trim()+",true);";

		}
		else
		{
			if(isArray(object1.trim(),preload))
			{
				String temp=object1;
				object1=object2;
				object2=temp;
			}
			String code="for(i=0;i<this."+object2+".numChildren();i++){ this."+object2.trim()+".getChildAt(i).physics.overlaps(this."+object1.trim()+",true);}";
			return code;
		}
	}
	public static String translateVarDeclaration(String word,String preload)
	{
		String newCode=word.substring(word.trim().indexOf(" ")).trim();
		if(word.indexOf("=")>=0)
		{
			newCode=translateAssignment(newCode,preload);
		}
		return "var "+newCode+";";
	}
	public static String translateCondition(String word,String preload)
	{
		String code=word.substring(word.indexOf("("));
		String newCode=translateAssignment(code,preload);
		newCode=newCode.substring(0, newCode.length()-1);
		return "if"+newCode+"\n{\n";
	}
	public static String translateWhile(String word,String preload)
	{
		String code=word.substring(word.indexOf("("));
		String newCode=translateAssignment(code,preload);
		newCode=newCode.substring(0, newCode.length()-1);
		return "while"+newCode+"\n{\n";
	}
	public static String translateExtendBlock(String word, String object)
	{
		String data="";
		String code="";
		String line="";
		while(word.length()>0)
		{
			line=word.substring(0, word.indexOf(";"));
			
			data=line.substring(line.trim().indexOf(" "));
			code+="this."+object.trim()+"."+data.trim()+";\n";
			word=word.substring(word.indexOf(";"));
		}
		//String data=word.substring(word.indexOf(" "));
		/*String preload=extra.substring(extra.indexOf("%")+1);
		if(isArray(object.trim(),preload))
		{
			return "for(var i=0;i<100;i++)\n this."+object.trim()+".getChildAt(i)."+data.trim()+";";
		}*/
		//return "this."+object.trim()+"."+data.trim()+";";
		return code;
	}
	public static String translateAssignment(String word,String preload)
	{
		int i=0,index=0;
		word+=";";
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
		String newCode="";
		for(i=0;i<index;i++)
		{
			newCode+=translateWord(token[i],preload);
		}
		
		return newCode;
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
		/*
		else if(word.trim().length()>0 && Checker.isSeperator(word.charAt(0)))
		{
			return word;
		}
		else if(word.trim().length()>0)
		{
			
			try 
			{
				Double.parseDouble(word);
				return word;
			}
			catch(NumberFormatException e)
			{
				return "this."+word;
			}
		}*/
		return word;
			
	}
	public static String translateView(String word,String preload)
	{
		word=word.trim();
		String object1=word.substring(0, word.indexOf(" "));
		String object2=word.substring(word.indexOf("with")+4);
		if(!isSet(object1.trim(),preload) && !isSet(object2.trim(),preload))
		{
			String code="if(Math.abs(this."+object1.trim()+".x-this."+object2.trim()+".x)<100 &&";
			code+="Math.abs(this."+object1.trim()+".y-this."+object2.trim()+".y)<100){\n";
			return code;
		}
		else if(isSet(object1.trim(),preload) && isSet(object2.trim(),preload))
		{
			/*
			if(getDataType(object1.trim(),preload).equals("gun"))
			{
				String newCode="for(var i=0;i<this."+object2.trim()+".numChildren();i++)";
				newCode+="if(this."+object2.trim()+".getChildAt(i).physics.overlapsGroup(this."+object1.trim()+"))\n{ var primary='"+object2.trim()+"';this."+object1.trim()+".getChildAt(0).x=-10000; this."+object1.trim()+".getChildAt(0).y=-10000;";
				return newCode;
			}
			else if(getDataType(object2.trim(),preload).equals("gun"))
			{
				String newCode="for(var i=0;i<this."+object1.trim()+".numChildren();i++)";
				newCode+="if(this."+object1.trim()+".getChildAt(i).physics.overlapsGroup(this."+object2.trim()+"))\n{ var primary='"+object1.trim()+"'; this."+object2.trim()+".getChildAt(0).x=-10000; this."+object2.trim()+".getChildAt(0).y=-10000";
				return newCode;
			}*/
			String code="for(var i=0;i<this."+object1.trim()+".numChildren();i++)for(var j=0;j<this."+object2.trim()+".numChildren();j++)";
			code+="if(Math.abs(this."+object1.trim()+".getChildAt(i).x-this."+object2.trim()+".getChildAt(j).x)<100 &&";
			code+="Math.abs(this."+object1.trim()+".getChildAt(i).y-this."+object2.trim()+".getChildAt(j).y)<100){var primary='"+object1.trim()+"';\n var primaryIndex=i;\n var secondary='"+object2.trim()+"'\n var secondaryIndex=j;\nvar index;\n";
			return code;
		}
		else
		{
			if(isSet(object1.trim(),preload))
			{
				String temp=object1;
				object1=object2;
				object2=temp;
			}
			/*
			if(getDataType(object2.trim(),preload).equals("gun"))
			{
				return "if(this."+object1.trim()+".physics.overlapsGroup(this."+object2.trim()+"))\n{ this."+object2.trim()+".getChildAt(0).x=-1000; this."+object2.trim()+".getChildAt(0).y=-10000;";		
			}*/
			String code="for(var i=0;i<this."+object2+".numChildren();i++)";
			code+="if(Math.abs(this."+object1.trim()+".x-this."+object2.trim()+".getChildAt(i).x)<100 &&";
			code+="Math.abs(this."+object1.trim()+".y-this."+object2.trim()+".getChildAt(i).y)<100){\n var primary='"+object2.trim()+"';";	
			return code;
		}
	}
	public static String translateCollision(String word,String preload)
	{
		word=word.trim();
		String object1=word.substring(0, word.indexOf(" "));
		String object2=word.substring(word.indexOf("with")+4);
		if(!isSet(object1.trim(),preload) && !isSet(object2.trim(),preload))
			return "if(this."+object1+".box.bounds.intersects(this."+object2+".box.bounds))\n{";
		else if(isSet(object1.trim(),preload) && isSet(object2.trim(),preload))
		{
			if(getDataType(object1.trim(),preload).equals("gun"))
			{
				String newCode="for(var i=0;i<this."+object2.trim()+".numChildren();i++)";
				newCode+="if(this."+object2.trim()+".getChildAt(i).physics.overlapsGroup(this."+object1.trim()+"))\n{ var primary='"+object2.trim()+"';this."+object1.trim()+".getChildAt(0).x=-10000; this."+object1.trim()+".getChildAt(0).y=-10000;";
				return newCode;
			}
			else if(getDataType(object2.trim(),preload).equals("gun"))
			{
				String newCode="for(var i=0;i<this."+object1.trim()+".numChildren();i++)";
				newCode+="if(this."+object1.trim()+".getChildAt(i).physics.overlapsGroup(this."+object2.trim()+"))\n{ var primary='"+object1.trim()+"'; this."+object2.trim()+".getChildAt(0).x=-10000; this."+object2.trim()+".getChildAt(0).y=-10000";
				return newCode;
			}
			String code="for(var i=0;i<this."+object1.trim()+".numChildren();i++)for(var j=0;j<this."+object2.trim()+".numChildren();j++)";
			code+="if(this."+object1.trim()+".getChildAt(i).box.bounds.intersects(this."+object2.trim()+".getChildAt(j).box.bounds)){var primary='"+object1.trim()+"';\n var primaryIndex=i;\n var secondary='"+object2.trim()+"'\n var secondaryIndex=j;\nvar index;";
			return code;
		}
		else
		{
			if(isSet(object1.trim(),preload))
			{
				String temp=object1;
				object1=object2;
				object2=temp;
			}
			if(getDataType(object2.trim(),preload).equals("gun"))
			{
				return "if(this."+object1.trim()+".physics.overlapsGroup(this."+object2.trim()+"))\n{ this."+object2.trim()+".getChildAt(0).x=-1000; this."+object2.trim()+".getChildAt(0).y=-10000;";		
			}
			String code="for(var i=0;i<this."+object2+".numChildren();i++)if(this."+object2.trim()+".getChildAt(i).box.bounds.intersects(this."+object1.trim()+".box.bounds)){\n var primary='"+object2.trim()+"';";
			return code;
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
		switch(word.trim())
		{
		case "KEY_UP":
			return "if(this.upKey.isDown){";
		case "KEY_DOWN":
			return "if(this.downKey.isDown){";
		case "KEY_RIGHT":
			return "if(this.rightKey.isDown){";
		case "KEY_LEFT":
			return "if(this.leftKey.isDown){";
		case "KEY_A":
			return "if(this.AKey.isDown){";
		case "KEY_W":
			return "if(this.WKey.isDown){";
		case "KEY_D":
			return "if(this.DKey.isDown){";
		case "KEY_S":
			return "if(this.SKey.isDown){";
		}
		return "";
	}
	public static String translateEnd()
	{
		return "}";
	}
	private static String getDataType(String object,String preload)
	{
		while(preload.length()>0)
		{
			String line=preload.substring(0, preload.indexOf(";"));
			if(line.indexOf("movable "+object+"(")>=0)
				return "movable";
			else if(line.indexOf("static "+object+"(")>=0)
				return "static";
			else if(line.indexOf("gun "+object+"(")>=0)
				return "gun";
			else if(line.indexOf("movable2 "+object+"(")>=0)
				return "movable2";
			else if(line.indexOf("]"+object+"(")>=0)
			{
				if(line.indexOf("movable2 ")>=0)
					return "movable2Array";
				if(line.indexOf("movable ")>=0)
					return "movableArray";
				if(line.indexOf("static")>=0)
					return "staticArray";
			}
			preload=preload.substring(preload.indexOf(";")+1);
		}
		return "";
	}
	public static String translateDeclaration(String word)
	{
		String objectToDeclare=word.substring(word.indexOf(" ")+1,word.indexOf("("));
		if(objectToDeclare.indexOf("]")>=0)
		{
			objectToDeclare=objectToDeclare.substring(objectToDeclare.indexOf("]")+1);
		}
		String objectType=word.trim().substring(0,word.indexOf(" "));
		String []arguments=getArgumentListForDeclaration(word);
		String image=arguments[0];
		String newCode="";
		//String x=arguments[1];
		//String y=arguments[2];
		//String newCode="this.addSpriteSheet('"+objectToDeclare+"','"+image+"',"+x+","+y+");";
		if(objectType.indexOf("audio")>=0)
			newCode="this.addAudio('"+objectToDeclare+"','"+image+"');";	
		else
			newCode="this.addImage('"+objectToDeclare+"','"+image+"');";
		return newCode;
	}
	public static String createBulletMechanics(String line)
	{
		String object=line.substring(line.indexOf(" ")+1,line.indexOf("("));
		return "var "+object+"_shot=false;var "+object+"_bulletIndex=0;function "+object+"_delayBullet(){"+object+"_shot=false;}";
	}
	public static String translateObjectMethodCall(String word,String preload)
	{
		String object=word.substring(0, word.indexOf("."));
		String method=word.substring(word.indexOf("."),word.indexOf("("));
		String []arguments=getArgumentList(word);
		if(method.indexOf("moveX")>=0)
		{
			if(object.indexOf("[")>=0)
			{
				String subScript=object.substring(object.indexOf("[")+1,object.indexOf("]"));
				object=object.substring(0,object.indexOf("["));
				return "this."+object+".getChildAt("+subScript+").physics.velocity.x="+arguments[0]+";";
			}
			else if(isArray(object.trim(),preload))
			{
				String check="if(primary=='"+object.trim()+"')\n{index=i;}else { index=j;} ";
				return check+"\nthis."+object+".getChildAt(index).physics.velocity.x="+arguments[0]+";";
			}
			return "this."+object+".physics.velocity.x="+arguments[0]+";";
		}
		else if(method.indexOf("moveY")>=0)
		{
			if(object.indexOf("[")>=0)
			{
				String subScript=object.substring(object.indexOf("[")+1,object.indexOf("]"));
				object=object.substring(0,object.indexOf("["));
				return "this."+object+".getChildAt("+subScript+").physics.velocity.y="+arguments[0]+";";
			}
			else if(isArray(object.trim(),preload))
			{
				String check="if(primary=='"+object.trim()+"')\n{index=i;}else { index=j;} ";
				return check+"\nthis."+object+".getChildAt(index).physics.velocity.y="+arguments[0]+";";
			}
			return "this."+object+".physics.velocity.y="+arguments[0]+";";
		}
		else if(method.indexOf("follow")>=0)
		{
			arguments=getArrayArguments(word);
			if(object.indexOf("[")>=0)
			{
				String subScript=object.substring(object.indexOf("[")+1,object.indexOf("]"));
				object=object.substring(0,object.indexOf("["));
				object=object+".getChildAt("+subScript+")";
			}
			String rotation="Kiwi.Utils.GameMath.angleBetween(this."+object+".x,this."+object+".y,this."+arguments[0]+".x,this."+arguments[0]+".y)";
			String code="this."+object+".physics.velocity.x=Math.cos("+rotation+")*"+arguments[1]+";\n";
			code+="this."+object+".physics.velocity.y=Math.sin("+rotation+")*"+arguments[1]+";\n";
			return code;
		}
		else if(method.indexOf("jump")>=0)
		{
			if(object.indexOf("[")>=0)
			{
				String subScript=object.substring(object.indexOf("[")+1,object.indexOf("]"));
				object=object.substring(0,object.indexOf("["));
				return "if(this."+object+".getChildAt("+subScript+").physics.isTouching(Kiwi.Components.ArcadePhysics.DOWN)){this."+object+".getChildAt("+subScript+").physics.velocity.y-="+arguments[0]+"}";
			}
			else if(isArray(object.trim(),preload))
			{
				String check="if(primary=='"+object.trim()+"')\n{index=i;}else { index=j;} ";
				return check+"\nif(this."+object+".getChildAt(index).physics.isTouching(Kiwi.Components.ArcadePhysics.DOWN)){this."+object+".getChildAt(index).physics.velocity.y-="+arguments[0]+"}";
			}
			return "if(this."+object+".physics.isTouching(Kiwi.Components.ArcadePhysics.DOWN)){this."+object+".physics.velocity.y=-"+arguments[0]+"};";
		}
		else if(method.indexOf("stick")>=0)
		{
			return "this."+arguments[0]+".x= this."+object+".x-this."+object+".width/2;\n this."+arguments[0]+".y= this."+object+".y-this."+object+".height/2;";
		}
		else if(method.indexOf("shoot")>=0)
		{
			String code="if(!"+object+"_shot){";
			String child=object+"_child";
			code+="var "+child+"= new Kiwi.GameObjects.Sprite(this,this.textures."+object+","+0+","+0+");";
			code+="\n"+child+".physics="+child+".components.add(new Kiwi.Components.ArcadePhysics("+child+","+child+".box));";
			code+=child+".physics.immovable=true;";
			code+="this."+object+".addChildAt("+child+",0);\n var blt=this."+object+".getChildAt(0);";
			code+="blt.physics.velocity.x="+arguments[0]+";"+object+"_shot=true;setTimeout("+object+"_delayBullet,100);}";
			return code;
		}
		else if(method.indexOf("playForever")>=0)
		{
			return "this."+object+"_forever.play();";
		}
		else if(method.indexOf("playOnce")>=0)
		{
			return "this."+object+"_once.play();";
		}
		else if(method.indexOf("destroy")>=0)
		{
			if(object.indexOf("[")>=0)
			{
				String subScript=object.substring(object.indexOf("[")+1,object.indexOf("]"));
				object=object.substring(0,object.indexOf("["));
				return "this."+object+".getChildAt("+subScript+").x=-100000; \n this."+object+".getChildAt("+subScript+").y=-10000";
			}
			else if(isArray(object.trim(),preload))
			{
				String check="if(primary=='"+object.trim()+"')\n{index=i;}else { index=j;} ";
				return check+"\nthis."+object+".getChildAt(index).x=-100000; \n this."+object+".getChildAt(index).y=-10000";
			}
			return "this."+object+".x=-10000;\n this."+object+".y=-10000";
		}
		else if(method.indexOf("translateX")>=0)
		{
			return "this."+object+".transform.x+="+arguments[0]+";";
		}
		else if(method.indexOf("translateY")>=0)
		{
			return "this."+object+".transform.y+="+arguments[0]+";";
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
