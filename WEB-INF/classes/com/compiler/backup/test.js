var mystate=new Kiwi.State('mystate');var myGame=new Kiwi.Game(); alert('hi1');
 mystate.preload=function(){Kiwi.State.prototype.preload.call(this);this.addSpriteSheet('player','player.png',20,20);}
 alert('hi2'); 

 mystate.create=function()
{ Kiwi.State.prototype.create.call(this );this.player=new Kiwi.GameObjects.Sprite(this,this.textures.player,20,20);

}
 mystate.update=function(){Kiwi.State.prototype.update.call( this );}
 myGame.states.addState( mystate );
 myGame.states.switchState( 'mystate'); 
 alert('hi3');