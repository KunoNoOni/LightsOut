package
{
	import org.flixel.*;
	
	[SWF(width="224", height="224", backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")]
		
	public class LightsOut extends FlxGame
	{
		public function LightsOut()
		{
			super(224,224,TitleState,1);
			LevelsCompleted.load();
			if(LevelsCompleted.set1Levels == 0)
				LevelsCompleted.set1Levels = 1;
			if(LevelsCompleted.set2Levels == 0)
				LevelsCompleted.set2Levels = 1;
			if(LevelsCompleted.set3Levels == 0)
				LevelsCompleted.set3Levels = 1;
			
			//LevelsCompleted.levels = 24;
			//forceDebugger = true;
			//FlxG.visualDebug = true;
			//FlxG.debug = true;
		}
	}
}