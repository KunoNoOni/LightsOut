package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	public class SetButtonState extends FlxState
	{
		//Variables got here
		private var unlockedColor1:Number = 0xff0000ff;
		private var unlockedColor2:Number = 0xff00ff00
		private var locked:Number = 0xff666666;
		private var locked2:Number = 0xffff0000;
		private var set1:FlxButtonPlus;
		private var set2:FlxButtonPlus;
		private var set3:FlxButtonPlus;
		private var bWidth:Number = 50;
		private var bHeight:Number = 20;
		
		public function SetButtonState()
		{
			super();
		}
		
		override public function create():void
		{
			FlxG.mouse.show();
			set1 = new FlxButtonPlus(FlxG.width*0.5-40,FlxG.height*0.5-80,puzzleSet,[1],"Puzzle Set 1",75,20);
			set2 = new FlxButtonPlus(FlxG.width*0.5-40,FlxG.height*0.5-10,puzzleSet,[2],"Puzzle Set 2",75,20);
			set3 = new FlxButtonPlus(FlxG.width*0.5-40,FlxG.height*0.5+60,puzzleSet,[3],"Puzzle Set 3",75,20);
			set1.updateActiveButtonColors([unlockedColor2,unlockedColor2]);
			set1.updateInactiveButtonColors([unlockedColor1, unlockedColor1]);
			set2.updateActiveButtonColors([unlockedColor2,unlockedColor2]);
			set2.updateInactiveButtonColors([unlockedColor1, unlockedColor1]);
			set3.updateActiveButtonColors([unlockedColor2,unlockedColor2]);
			set3.updateInactiveButtonColors([unlockedColor1, unlockedColor1]);
			add(set1);
			add(set2);
			add(set3);
		}
		
		override public function update():void
		{
			super.update();
		}
		
		private function puzzleSet(set:Number):void
		{
			switch(set)
			{
				case 1:
				{
					Registry.puzzleSet = 1;
					break;
				}
				case 2:
				{
					Registry.puzzleSet = 2;
					break;
				}
				case 3:
				{
					Registry.puzzleSet = 3;
					break;
				}
			}
			FlxG.switchState(new MenuState());	//<--- using new state change code for flixel 2.5
		}
	}
}