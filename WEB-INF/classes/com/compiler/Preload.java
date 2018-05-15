package com.compiler;

public class Preload 
{
	public static String translate(String code,String state)
	{
		String root=state;
		state=getStateName(state);
		String newCode="Kiwi.State.prototype.preload.call(this);";
		String bulletMechanics="";
		code=code.trim();
		while(code.length()>0)
		{
			String line=code.substring(0, code.indexOf(";")).trim();
			if(line.indexOf("gun")>=0)
			{
				bulletMechanics+=LineTranslator.createBulletMechanics(line);
			}
			newCode=newCode+LineTranslator.translateDeclaration(line,root);
			code=code.substring(code.indexOf(";")+1,code.length());
		}
		String randomBlock="\nfunction getRandomNum(a,b) { return Math.floor(Math.random()*(b-a+1))+a;}";
		String preloadBlock="";
		preloadBlock= "\n var loadingState=new Kiwi.State('loadingState'); \nloadingState.preload=function(){"+newCode+" this.addSpriteSheet('mouse','bullet.png',1,1); this.addImage('loadingScreen','loadingScreen.png');}\n";
		preloadBlock+=" loadingState.create = function(){Kiwi.State.prototype.create.call( this ); this.loadScreen=new Kiwi.GameObjects.Sprite(this,this.textures.loadingScreen,150,250); this.loadScreen.alpha=0;this.addChild(this.loadScreen);};\n";
		preloadBlock+="var alphaDone=false;loadingState.update=function(){Kiwi.State.prototype.update.call(this);if(!alphaDone) {this.loadScreen.alpha+=0.01; if(this.loadScreen.alpha==1)alphaDone=true;}else {this.loadScreen.alpha-=0.01; if(this.loadScreen.alpha==0)this.game.states.switchState('"+state+"')}}\n"+bulletMechanics+getPhysicsBlock()+randomBlock;
		return preloadBlock;
	}

	private static String getPhysicsBlock()
	{
		return " var SpriteWithPhysics = function(state, texture, x, y) {Kiwi.GameObjects.Sprite.call(this, state, texture, x, y);this.physics = this.components.add(new Kiwi.Components.ArcadePhysics(this, this.box));this.update = function() {Kiwi.GameObjects.Sprite.prototype.update.call(this);this.physics.update();}}\nKiwi.extend(SpriteWithPhysics, Kiwi.GameObjects.Sprite);";
				
	}
	public static String getStateName(String path)
	{
		int i=path.length()-1;
		int j=path.length()-1;
		while(i>=0 && path.charAt(i)!='/')
			i--;
		if(path.indexOf(".")>=0)
			j=path.indexOf(".");
		return path.substring(i+1,j);
	}
}
