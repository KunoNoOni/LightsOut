package
{
	import org.flixel.*;
	
	public class SolveState extends FlxState
	{
		//Variables go here
		private var tempBoard:FlxTilemap;
		private var tileSize:Number = 32;
		private var boardWidth:Number = 6;
		private var boardHeight:Number = 6;
		private var bottomRow:Number = 5;
		private var currTile:Number;
		private var counter:Number=0;
		private var startX1:int;
		private var startX2:int;
		private var onlyBottomRow:Boolean = true;
		private var solved:Boolean = false;

		override public function create():void
		{	
			tempBoard = new FlxTilemap();
			switch(Registry.puzzleSet)
			{
				case 1:
				{
					tempBoard.loadMap(new Registry[Registry.puzzleSet1[Registry.levelIndex]],Registry._buildTile,tileSize,tileSize);
					break;
				}
				case 2:
				{
					tempBoard.loadMap(new Registry[Registry.puzzleSet2[Registry.levelIndex]],Registry._buildTile,tileSize,tileSize);
					break;
				}
				case 3:
				{
					tempBoard.loadMap(new Registry[Registry.puzzleSet3[Registry.levelIndex]],Registry._buildTile,tileSize,tileSize);
					break;
				}
					
			}
			//printBoard();
			solveBoard();
			//printBoard();
		}	
		
		override public function update():void
		{
				super.update();	
		}
		
		private function getCurrTile(x:Number, y:Number):Number
		{
			return tempBoard.getTile(x,y);
		}
		
		private function setCurrTile(x:Number, y:Number, type:Number):void
		{
			//trace("(X: "+x+" Y: "+y+" TYPE: "+type+")");
			if(type == 1)
				tempBoard.setTile(x,y,2);
			else if(type == 2)
				tempBoard.setTile(x,y,1);
				
			Registry.moves +=1;
			//trace("Updating Registry.moves to: "+Registry.moves);
			checkSurroundingTiles(x,y);
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
				tempBoard.setTile(x,y-1,2);
			else if( tempN == 2)
				tempBoard.setTile(x,y-1,1);
			
			//check east tile
			if(tempE == 1)
				tempBoard.setTile(x+1,y,2);
			else if(tempE == 2)
				tempBoard.setTile(x+1,y,1);
			
			//check south tile
			if(tempS == 1)
				tempBoard.setTile(x,y+1,2);
			else if(tempS == 2)
				tempBoard.setTile(x,y+1,1);
			
			//check west tile
			if(tempW == 1)
				tempBoard.setTile(x-1,y,2);
			else if(tempW == 2)
				tempBoard.setTile(x-1,y,1);
		}
		
		private function solveBoard():void
		{
			firstPass();
			if(solved)
				playBoard();			
		}
		
		private function firstPass():void
		{
			var x:int;
			var y:int;
			
			for(y=2;y<boardHeight;y++)
			{
				for(x=1;x<boardWidth;x++)
				{
					if(getCurrTile(x,(y-1)) == 1)
						setCurrTile(x,y,getCurrTile(x,y));
				}	
			}
			
			if(onlyBottomRow)
				doBottomRow();
		}
		
		private function secondPass():void
		{
			var x:int;
			var y:int;
			
			//load tilemap again
			switch(Registry.puzzleSet)
			{
				case 1:
				{
					tempBoard.loadMap(new Registry[Registry.puzzleSet1[Registry.levelIndex]],Registry._buildTile,tileSize,tileSize);
					break;
				}
				case 2:
				{
					tempBoard.loadMap(new Registry[Registry.puzzleSet2[Registry.levelIndex]],Registry._buildTile,tileSize,tileSize);
					break;
				}
				case 3:
				{
					tempBoard.loadMap(new Registry[Registry.puzzleSet3[Registry.levelIndex]],Registry._buildTile,tileSize,tileSize);
					break;
				}		
			}
			//setup first row
			y = 1;
			if(startX1>0)
				setCurrTile(startX1,y,getCurrTile(startX1,y));
			if(startX2>0)
				setCurrTile(startX2,y,getCurrTile(startX2,y));
			//process the rest of the rows now
			for(y=2;y<boardHeight;y++)
			{
				for(x=1;x<boardWidth;x++)
				{
					if(getCurrTile(x,(y-1)) == 1)
					{
						setCurrTile(x,y,getCurrTile(x,y));
					}
				}	
			}
			//once we are done, the board will be solved!
			solved = true;
		}
		
		private function doBottomRow():void
		{ 
			//Outcome 1
			if(getCurrTile(3,boardHeight-1) == 1 && getCurrTile(4,boardHeight-1) == 1 && getCurrTile(5,boardHeight-1) == 1)
			{
				startX1 = 4;
				startX2 = 0;
			}
			//Outcome 2
			if(getCurrTile(2,boardHeight-1) == 1 && getCurrTile(4,boardHeight-1) == 1)
			{
				startX1 = 2;
				startX2 = 5
			}
			//Outcome 3
			if(getCurrTile(2,boardHeight-1) == 1 && getCurrTile(3,boardHeight-1) == 1 && getCurrTile(5,boardHeight-1) == 1)
			{
				startX1 = 1;
				startX2 = 0;
			}
			//Outcome 4
			if(getCurrTile(1,boardHeight-1) == 1 && getCurrTile(5,boardHeight-1) == 1)
			{
				startX1 = 4;
				startX2 = 5
			}
			//Outcome 5
			if(getCurrTile(1,boardHeight-1) == 1 && getCurrTile(3,boardHeight-1) == 1 && getCurrTile(4,boardHeight-1) == 1)
			{
				startX1 = 5;
				startX2 = 0;
			}
			//Outcome 6
			if(getCurrTile(1,boardHeight-1) == 1 && getCurrTile(2,boardHeight-1) == 1 && getCurrTile(4,boardHeight-1) == 1 && getCurrTile(5,boardHeight-1) == 1)
			{
				startX1 = 3;
				startX2 = 0;
			}
			//Outcome 7
			if(getCurrTile(1,boardHeight-1) == 1 && getCurrTile(2,boardHeight-1) == 1 && getCurrTile(3,boardHeight-1) == 1)
			{
				startX1 = 2;
				startX2 = 0;
			}
			onlyBottomRow = false;
			Registry.moves = 0;
			secondPass();
		}
		
		private function printBoard():void
		{
			var x:int = 0;
			
			trace("##########");
			for(var y:int=0;y<(boardHeight+1);y++)
				trace(tempBoard.getTile(x,y)+""+tempBoard.getTile(x+1,y)+""+tempBoard.getTile(x+2,y)+""+tempBoard.getTile(x+3,y)+""+
					tempBoard.getTile(x+4,y)+""+tempBoard.getTile(x+5,y)+""+tempBoard.getTile(x+6,y));
		}
		
		private function playBoard():void
		{
			Registry.minMoves = Registry.moves; 
			Registry.moves = 0;
			FlxG.switchState(new PlayState());	//<--- using new state change code for flixel 2.5
		}
	}
}
