package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	public class PlayState extends FlxState
	{
		//Variables go here
		private var mouseX:Number;
		private var mouseY:Number;
		private var board:FlxTilemap; 
		private var tileSize:Number = 32;
		private var boardWidth:Number = 6;
		private var boardHeight:Number = 6;
		private var currTile:Number;
		private var counter:Number=0;
		private var lightsOut:Boolean = false;
		private var d:FlxDelay;
		private var moves:FlxText;
		private var yourmoves:FlxText;
		private var minmoves:FlxText;
		private var pSet:FlxText;
		private var pLevel:FlxText;
		private var backButton:FlxButtonPlus;
				
		override public function create():void
		{	
			FlxG.mouse.show();
			board = new FlxTilemap();
			switch(Registry.puzzleSet)
			{
				case 1:
				{
					board.loadMap(new Registry[Registry.puzzleSet1[Registry.levelIndex]],Registry._buildTile,tileSize,tileSize);
					break;
				}
				case 2:
				{
					board.loadMap(new Registry[Registry.puzzleSet2[Registry.levelIndex]],Registry._buildTile,tileSize,tileSize);
					break;
				}
				case 3:
				{
					board.loadMap(new Registry[Registry.puzzleSet3[Registry.levelIndex]],Registry._buildTile,tileSize,tileSize);
					break;
				}

			}
			add(board);
			minmoves = new FlxText(0,0,100, "Min Moves: "+Registry.minMoves);
			minmoves.setFormat(null,11,0x000000, "center");
			add(minmoves);
			yourmoves = new FlxText(100,0, 110, "Your Moves: "+Registry.moves);
			yourmoves.setFormat(null,11,0x000000, "center");
			add(yourmoves);
			pSet = new FlxText(0,15,100, "Puzzle Set: "+Registry.puzzleSet);
			pSet.setFormat(null,11,0x000000, "center");
			add(pSet);
			pLevel = new FlxText(100,15,100, "Puzzle: "+Registry.currLevel);
			pLevel.setFormat(null,11,0x000000, "center");
			add(pLevel);
			//create back button
			backButton = new FlxButtonPlus(FlxG.width*0.5-25,200,levelButtons,[],"Back",50,20);
			backButton.updateActiveButtonColors([0xff00ff00,0xff00ff00]);
			backButton.updateInactiveButtonColors([0xff0000ff, 0xff0000ff]);
			add(backButton);

		}	
		
		override public function update():void
		{
						
			mouseX = FlxU.floor(FlxG.mouse.screenX/32);
			mouseY = FlxU.floor(FlxG.mouse.screenY/32);
			currTile = getCurrTile(mouseX,mouseY);
			
			if(FlxG.mouse.justReleased())
				setCurrTile(mouseX,mouseY,currTile);
			
			if(lightsOut)
				winBoard();

			super.update();
			
			if(d != null)
			{			
				if (d.hasExpired)
				{
					moves.kill();
					d.abort();
					//trace("Registry.currLevel: "+Registry.currLevel+" LevelsCompleted.levels: "+LevelsCompleted.levels);
					switch(Registry.puzzleSet)
					{
						case 1:
						{
							if(Registry.currLevel >= LevelsCompleted.set1Levels && Registry.currLevel != Registry.puzzleSet1.length)
								LevelsCompleted.set1Levels += 1;
							if(Registry.currLevel < Registry.puzzleSet3.length || Registry.currLevel < LevelsCompleted.set1Levels)
							{
								Registry.currLevel +=1;
								Registry.levelIndex +=1;
								Registry.moves = 0;
								Registry.minMoves = 0;
								FlxG.switchState(new SolveState());	//<--- using new state change code for flixel 2.5
							}
							else 
							{
								Registry.moves = 0;
								Registry.minMoves = 0;
								FlxG.switchState(new MenuState());	//<--- using new state change code for flixel 2.5
								
							}
							
							break;
						}
						case 2:
						{
							if(Registry.currLevel >= LevelsCompleted.set2Levels && Registry.currLevel != Registry.puzzleSet2.length)
								LevelsCompleted.set2Levels += 1;
							if(Registry.currLevel < Registry.puzzleSet3.length || Registry.currLevel < LevelsCompleted.set2Levels)
							{
								Registry.currLevel +=1;
								Registry.levelIndex +=1;
								Registry.moves = 0;
								Registry.minMoves = 0;
								FlxG.switchState(new SolveState());	//<--- using new state change code for flixel 2.5
							}
							else 
							{
								Registry.moves = 0;
								Registry.minMoves = 0;
								FlxG.switchState(new MenuState());	//<--- using new state change code for flixel 2.5
								
							}
							
							break;
						}
						case 3:
						{
							if(Registry.currLevel >= LevelsCompleted.set3Levels && Registry.currLevel != Registry.puzzleSet3.length)
								LevelsCompleted.set3Levels += 1;
							if(Registry.currLevel < Registry.puzzleSet3.length || Registry.currLevel < LevelsCompleted.set3Levels)
							{
								Registry.currLevel +=1;
								Registry.levelIndex +=1;
								Registry.moves = 0;
								Registry.minMoves = 0;
								FlxG.switchState(new SolveState());	//<--- using new state change code for flixel 2.5
							}
							else 
							{
								Registry.moves = 0;
								Registry.minMoves = 0;
								FlxG.switchState(new MenuState());	//<--- using new state change code for flixel 2.5
								
							}
							
							break;
						}
					}
				}
			}
		}
		
		private function getCurrTile(x:Number, y:Number):Number
		{
			return board.getTile(x,y);
		}
		
		private function setCurrTile(x:Number, y:Number, type:Number):void
		{
			if(type == 1)
			{	
				Registry.moves +=1;
				//trace("Updating Registry.moves to: "+Registry.moves);
				yourmoves.text = "Your Moves: "+Registry.moves;
				board.setTile(x,y,2);
				checkSurroundingTiles(x,y);
			}
			else if(type == 2)
			{
				Registry.moves +=1;
				//trace("Updating Registry.moves to: "+Registry.moves);
				yourmoves.text = "Your Moves: "+Registry.moves;
				board.setTile(x,y,1);
				checkSurroundingTiles(x,y);
			}
		}
		
		private function checkSurroundingTiles(x:Number, y:Number):void
		{
			var tempN:Number;
			var tempE:Number;
			var tempS:Number;
			var tempW:Number;
			
			tempN=getCurrTile(x,y-1);
			tempE=getCurrTile(x+1,y);
			tempS=getCurrTile(x,y+1);
			tempW=getCurrTile(x-1,y);
						
			//check north tile
			if( tempN == 1)
				board.setTile(x,y-1,2);
			else if( tempN == 2)
				board.setTile(x,y-1,1);
	
			//check east tile
			if(tempE == 1)
				board.setTile(x+1,y,2);
			else if(tempE == 2)
				board.setTile(x+1,y,1);
			
			//check south tile
			if(tempS == 1)
				board.setTile(x,y+1,2);
			else if(tempS == 2)
				board.setTile(x,y+1,1);

			//check west tile
			if(tempW == 1)
				board.setTile(x-1,y,2);
			else if(tempW == 2)
				board.setTile(x-1,y,1);
			
			//Check to see if all the lights are out
			checkBoard();
		}
		
		private function checkBoard():void
		{
			for(var i:int=1;i<boardWidth;i++)
				for(var ii:int=1;ii<boardHeight;ii++)
				{
					if(board.getTile(i,ii) == 2)
						counter +=1;
				}
			if(counter == 25)
				lightsOut = true;
			else
				counter = 0;	
		}
		
		private function winBoard():void
		{
			lightsOut = false;
			moves = new FlxText(FlxG.width*0.5-110,FlxG.height*0.5-70, 220, "Board Solved! Congradulations!");
			moves.setFormat(null,20,0x000000, "center");
			add(moves);
			
			d = new FlxDelay(2000);
			d.start();
		}
		
		private function levelButtons():void
		{
			FlxG.switchState(new MenuState());	//<--- using new state change code for flixel 2.5
		}
	}
}
