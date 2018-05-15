package com.compiler;

public class LineTranslator
{
	public static String translateSystemCall(String word)
	{
		switch(getSystemCallName(word))
		{
			case "loadObject":
				String []arguments=getArgumentList(word);
				String objectToLoad=arguments[0];
				String x=arguments[1];
				String y=arguments[2];
				String newCode="this."+objectToLoad+"=new Kiwi.GameObjects.Sprite(this,this.textures."+objectToLoad+","+x+","+y+")"+";this.addChild(this."+objectToLoad+");";
				return newCode;
		}
		return "";
	}
	public static String translateDeclaration(String word)
	{
		String objectToDeclare=word.substring(word.indexOf(" ")+1,word.indexOf("("));
		String []arguments=getArgumentList(word);
		String image=arguments[0];
		String x=arguments[1];
		String y=arguments[2];
		String newCode="this.addSpriteSheet('"+objectToDeclare+"','"+image+"',"+x+","+y+");";
		System.out.print("image = "+image);
		return newCode;
	}
	public static String translateObjectMethodCall(String word)
	{
		return "";
	} 
	private static String getSystemCallName(String word)
	{
		if(word.indexOf("loadObject(")>=0)
			return "loadObject";
		else if(word.indexOf("loadState(")>=0)
			return "loadState";
		return "";
	}
	private static String[] getArgumentList(String word)
	{
		String args=word.substring(word.indexOf("(")+1, word.indexOf(")"));
		return args.split(",");
	}
}
