package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
		
	public class MenuState extends FlxState
	{
		//Variables got here
		private var unlockedColor1:Number = 0xff0000ff;
		private var unlockedColor2:Number = 0xff00ff00;
		private var locked:Number = 0xff666666;
		private var locked2:Number = 0xffff0000;
		private var totalLevels:Number = 25;
		private var button:Array = new Array;
		private var backButton:FlxButtonPlus;
		private var bWidth:Number = 50;
		private var bHeight:Number = 20;
		private var x:Number;
		private var counterX:Number = 5;
		private var counterY:Number = 25;
		private var lvl:Number = 0;
		private var lc:Number = 0;

		public function MenuState()
		{
			super();
		}
		
		override public function create():void
		{
			FlxG.mouse.show();
			puzzleSet();
		}
		
		override public function update():void
		{
			super.update();
		}
		
		private function setButtons():void
		{	
			FlxG.switchState(new SetButtonState());	//<--- using new state change code for flixel 2.5
		}
				
		private function puzzleSet():void
		{
			var logo:FlxText = new FlxText(FlxG.width*0.5-100,FlxG.height*0.5-110, 200, "Choose a Level");
			logo.setFormat(null,10,0xFFFFFF, "center");
			add(logo);

			switch(Registry.puzzleSet)
			{
				case 1:
				{
					lc = LevelsCompleted.set1Levels;
					break;
				}
				case 2:
				{
					lc = LevelsCompleted.set2Levels;
					break;
				}
				case 3:
				{
					lc = LevelsCompleted.set3Levels;
					break;
				}
			}
			
			//Create the buttons, Color them according to which ones are completed then Add them to the screen
			for(x = 0;x<totalLevels;x++)
			{
				//Creates a new button
				button[x] = new FlxButtonPlus(counterX,counterY,playLevel,[lvl],"Level "+(x+1),bWidth,bHeight);
				
				//increment level variable
				lvl++;
				
				//check X to make sure we haven't reached the right edge of the screen. If we have
				//reset X to left edge
				if(counterX == 170)
				{
					counterX = 5;
					counterY += 25;
				}
				else
					counterX += 55;
				
				
				//Check x (has nothing to do with the X above) to see if its less than the number of levels completed
				//if it is color it to show this. if not its colored gray to show locked
				if(x<lc)
				{
					button[x].updateActiveButtonColors([unlockedColor2,unlockedColor2]);
					button[x].updateInactiveButtonColors([unlockedColor1, unlockedColor1]);
				}
				else
				{
					button[x].updateActiveButtonColors([locked2, locked2]);
					button[x].updateInactiveButtonColors([locked, locked]);
				}
				
				//create back button
				backButton = new FlxButtonPlus(170,175,setButtons,[],"Back",bWidth,bHeight);
				backButton.updateActiveButtonColors([unlockedColor2,unlockedColor2]);
				backButton.updateInactiveButtonColors([unlockedColor1, unlockedColor1]);
				
				//Display the button!
				add(button[x]);
				add(backButton);
			}
		}
		
		//This is the callback function for the FlxButtonPlus
		private function playLevel(level:Number):void
		{
			if(level<lc)
			{				
				Registry.levelIndex = level;
				Registry.currLevel = level + 1;
				FlxG.switchState(new SolveState());	//<--- using new state change code for flixel 2.5
			}
			
		}
		
	}
}