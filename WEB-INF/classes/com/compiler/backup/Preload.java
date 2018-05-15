package com.compiler;

public class Preload 
{
	public static String translate(String code,String state)
	{
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
			newCode=newCode+LineTranslator.translateDeclaration(line);
			code=code.substring(code.indexOf(";")+1,code.length());
		}
		return "\n var loadingState=new Kiwi.State('loadingState'); \nloadingState.preload=function(){"+newCode+" this.addSpriteSheet('mouse','bullet.png',1,1);}\n loadingState.create = function(){Kiwi.State.prototype.create.call( this );this.game.states.switchState( '"+state+"' );};\n" +bulletMechanics+getPhysicsBlock();
	}

	private static String getPhysicsBlock()
	{
		return " var SpriteWithPhysics = function(state, texture, x, y) {Kiwi.GameObjects.Sprite.call(this, state, texture, x, y);this.physics = this.components.add(new Kiwi.Components.ArcadePhysics(this, this.box));this.update = function() {Kiwi.GameObjects.Sprite.prototype.update.call(this);this.physics.update();}}\nKiwi.extend(SpriteWithPhysics, Kiwi.GameObjects.Sprite);";
				
	}
}
