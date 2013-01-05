package
{
	import org.flixel.*;
	
	public class Checkmark extends FlxSprite
	{	
		public function Checkmark(X:Number=0,Y:Number=0)
		{
			super(X,Y);
			loadGraphic(Registry._check,false,false,25,20);
		}
		
		override public function update():void
		{
			
			super.update();
		}
	}
}