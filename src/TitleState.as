package
{
	import org.flixel.*;
		
	public class TitleState extends FlxState
	{
		//Variables got here
		private var board:FlxTilemap;
		
		public function TitleState()
		{
			super();
		}
		
		override public function create():void
		{
			board = new FlxTilemap();
			board.loadMap(new Registry[Registry.puzzleSet3[0]],Registry._buildTile,32,32);
			add(board);
			
			var logo:FlxText = new FlxText(FlxG.width*0.5-100,FlxG.height*0.5-110, 200, "Lights Out");
			logo.setFormat(null,20,0xFFFFFF, "center");
			add(logo);
			
			var instruct:FlxText = new FlxText(FlxG.width*0.5-100,FlxG.height-30, 200, "PRESS [x] TO START");
			instruct.setFormat(null,12,0xFFFFFF, "center");
			add(instruct);
			
			var instruct2:FlxText = new FlxText(FlxG.width*0.5-100,FlxG.height-15, 200, "PRESS [r] TO RESET LEVELS");
			instruct2.setFormat(null,10,0xFFFFFF, "center");
			add(instruct2);
		}
		
		override public function update():void
		{
			if(FlxG.keys.X)
				FlxG.switchState(new SetButtonState());	//<--- using new state change code for flixel 2.5	
			if(FlxG.keys.R)
			{
				LevelsCompleted.set1Levels = 1;
				LevelsCompleted.set2Levels = 1;
				LevelsCompleted.set3Levels = 1;
				FlxG.switchState(new SetButtonState());	//<--- using new state change code for flixel 2.5
			}
			super.update();
		}
	}
}