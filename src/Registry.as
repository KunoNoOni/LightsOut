package
{
	import org.flixel.*;

	public class Registry
	{
		public static var levelIndex:int = 0;
		public static var currLevel:int = 1;
		public static var moves:int = 0;
		public static var minMoves:int = 0;
		public static var puzzleSet:Number = 0;
		public static var puzzleSet1:Array = ["set1P1","set1P2","set1P3","set1P4","set1P5","set1P6",
			"set1P7","set1P8","set1P9","set1P10","set1P11","set1P12","set1P13","set1P14","set1P15","set1P16",
			"set1P17","set1P18","set1P19","set1P20","set1P21","set1P22","set1P23","set1P24","set1P25"];
		public static var puzzleSet2:Array = ["set2P1","set2P2","set2P3","set2P4","set2P5","set2P6",
			"set2P7","set2P8","set2P9","set2P10","set2P11","set2P12","set2P13","set2P14","set2P15","set2P16",
			"set2P17","set2P18","set2P19","set2P20","set2P21","set2P22","set2P23","set2P24","set2P25"];
		public static var puzzleSet3:Array = ["set3P1","set3P2","set3P3","set3P4","set3P5","set3P6",
			"set3P7","set3P8","set3P9","set3P10","set3P11","set3P12","set3P13","set3P14","set3P15","set3P16",
			"set3P17","set3P18","set3P19","set3P20","set3P21","set3P22","set3P23","set3P24","set3P25"];
	
		
		[Embed(source = 'Sprites/buildTile.png')] static public var _buildTile:Class;
		[Embed(source = 'Sprites/check.png')] static public var _check:Class;
		
	
		[Embed(source = 'Maps/mapCSV_Group1_set1P1.csv', mimeType = 'application/octet-stream')] static public var set1P1:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set1P2.csv', mimeType = 'application/octet-stream')] static public var set1P2:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set1P3.csv', mimeType = 'application/octet-stream')] static public var set1P3:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set1P4.csv', mimeType = 'application/octet-stream')] static public var set1P4:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set1P5.csv', mimeType = 'application/octet-stream')] static public var set1P5:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set1P6.csv', mimeType = 'application/octet-stream')] static public var set1P6:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set1P7.csv', mimeType = 'application/octet-stream')] static public var set1P7:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set1P8.csv', mimeType = 'application/octet-stream')] static public var set1P8:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set1P9.csv', mimeType = 'application/octet-stream')] static public var set1P9:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set1P10.csv', mimeType = 'application/octet-stream')] static public var set1P10:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set1P11.csv', mimeType = 'application/octet-stream')] static public var set1P11:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set1P12.csv', mimeType = 'application/octet-stream')] static public var set1P12:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set1P13.csv', mimeType = 'application/octet-stream')] static public var set1P13:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set1P14.csv', mimeType = 'application/octet-stream')] static public var set1P14:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set1P15.csv', mimeType = 'application/octet-stream')] static public var set1P15:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set1P16.csv', mimeType = 'application/octet-stream')] static public var set1P16:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set1P17.csv', mimeType = 'application/octet-stream')] static public var set1P17:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set1P18.csv', mimeType = 'application/octet-stream')] static public var set1P18:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set1P19.csv', mimeType = 'application/octet-stream')] static public var set1P19:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set1P20.csv', mimeType = 'application/octet-stream')] static public var set1P20:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set1P21.csv', mimeType = 'application/octet-stream')] static public var set1P21:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set1P22.csv', mimeType = 'application/octet-stream')] static public var set1P22:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set1P23.csv', mimeType = 'application/octet-stream')] static public var set1P23:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set1P24.csv', mimeType = 'application/octet-stream')] static public var set1P24:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set1P25.csv', mimeType = 'application/octet-stream')] static public var set1P25:Class;
		
		[Embed(source = 'Maps/mapCSV_Group1_set2P1.csv', mimeType = 'application/octet-stream')] static public var set2P1:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set2P2.csv', mimeType = 'application/octet-stream')] static public var set2P2:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set2P3.csv', mimeType = 'application/octet-stream')] static public var set2P3:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set2P4.csv', mimeType = 'application/octet-stream')] static public var set2P4:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set2P5.csv', mimeType = 'application/octet-stream')] static public var set2P5:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set2P6.csv', mimeType = 'application/octet-stream')] static public var set2P6:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set2P7.csv', mimeType = 'application/octet-stream')] static public var set2P7:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set2P8.csv', mimeType = 'application/octet-stream')] static public var set2P8:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set2P9.csv', mimeType = 'application/octet-stream')] static public var set2P9:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set2P10.csv', mimeType = 'application/octet-stream')] static public var set2P10:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set2P11.csv', mimeType = 'application/octet-stream')] static public var set2P11:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set2P12.csv', mimeType = 'application/octet-stream')] static public var set2P12:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set2P13.csv', mimeType = 'application/octet-stream')] static public var set2P13:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set2P14.csv', mimeType = 'application/octet-stream')] static public var set2P14:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set2P15.csv', mimeType = 'application/octet-stream')] static public var set2P15:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set2P16.csv', mimeType = 'application/octet-stream')] static public var set2P16:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set2P17.csv', mimeType = 'application/octet-stream')] static public var set2P17:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set2P18.csv', mimeType = 'application/octet-stream')] static public var set2P18:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set2P19.csv', mimeType = 'application/octet-stream')] static public var set2P19:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set2P20.csv', mimeType = 'application/octet-stream')] static public var set2P20:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set2P21.csv', mimeType = 'application/octet-stream')] static public var set2P21:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set2P22.csv', mimeType = 'application/octet-stream')] static public var set2P22:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set2P23.csv', mimeType = 'application/octet-stream')] static public var set2P23:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set2P24.csv', mimeType = 'application/octet-stream')] static public var set2P24:Class;
		[Embed(source = 'Maps/mapCSV_Group1_set2P25.csv', mimeType = 'application/octet-stream')] static public var set2P25:Class;
	
		[Embed(source = 'Maps/mapCSV_Group1_Map1.csv', mimeType = 'application/octet-stream')] static public var set3P1:Class;
		[Embed(source = 'Maps/mapCSV_Group1_Map2.csv', mimeType = 'application/octet-stream')] static public var set3P2:Class;
		[Embed(source = 'Maps/mapCSV_Group1_Map3.csv', mimeType = 'application/octet-stream')] static public var set3P3:Class;
		[Embed(source = 'Maps/mapCSV_Group1_Map4.csv', mimeType = 'application/octet-stream')] static public var set3P4:Class;
		[Embed(source = 'Maps/mapCSV_Group1_Map5.csv', mimeType = 'application/octet-stream')] static public var set3P5:Class;
		[Embed(source = 'Maps/mapCSV_Group1_Map6.csv', mimeType = 'application/octet-stream')] static public var set3P6:Class;
		[Embed(source = 'Maps/mapCSV_Group1_Map7.csv', mimeType = 'application/octet-stream')] static public var set3P7:Class;
		[Embed(source = 'Maps/mapCSV_Group1_Map8.csv', mimeType = 'application/octet-stream')] static public var set3P8:Class;
		[Embed(source = 'Maps/mapCSV_Group1_Map9.csv', mimeType = 'application/octet-stream')] static public var set3P9:Class;
		[Embed(source = 'Maps/mapCSV_Group1_Map10.csv', mimeType = 'application/octet-stream')] static public var set3P10:Class;
		[Embed(source = 'Maps/mapCSV_Group1_Map11.csv', mimeType = 'application/octet-stream')] static public var set3P11:Class;
		[Embed(source = 'Maps/mapCSV_Group1_Map12.csv', mimeType = 'application/octet-stream')] static public var set3P12:Class;
		[Embed(source = 'Maps/mapCSV_Group1_Map13.csv', mimeType = 'application/octet-stream')] static public var set3P13:Class;
		[Embed(source = 'Maps/mapCSV_Group1_Map14.csv', mimeType = 'application/octet-stream')] static public var set3P14:Class;
		[Embed(source = 'Maps/mapCSV_Group1_Map15.csv', mimeType = 'application/octet-stream')] static public var set3P15:Class;
		[Embed(source = 'Maps/mapCSV_Group1_Map16.csv', mimeType = 'application/octet-stream')] static public var set3P16:Class;
		[Embed(source = 'Maps/mapCSV_Group1_Map17.csv', mimeType = 'application/octet-stream')] static public var set3P17:Class;
		[Embed(source = 'Maps/mapCSV_Group1_Map18.csv', mimeType = 'application/octet-stream')] static public var set3P18:Class;
		[Embed(source = 'Maps/mapCSV_Group1_Map19.csv', mimeType = 'application/octet-stream')] static public var set3P19:Class;
		[Embed(source = 'Maps/mapCSV_Group1_Map20.csv', mimeType = 'application/octet-stream')] static public var set3P20:Class;
		[Embed(source = 'Maps/mapCSV_Group1_Map21.csv', mimeType = 'application/octet-stream')] static public var set3P21:Class;
		[Embed(source = 'Maps/mapCSV_Group1_Map22.csv', mimeType = 'application/octet-stream')] static public var set3P22:Class;
		[Embed(source = 'Maps/mapCSV_Group1_Map23.csv', mimeType = 'application/octet-stream')] static public var set3P23:Class;
		[Embed(source = 'Maps/mapCSV_Group1_Map24.csv', mimeType = 'application/octet-stream')] static public var set3P24:Class;
		[Embed(source = 'Maps/mapCSV_Group1_Map25.csv', mimeType = 'application/octet-stream')] static public var set3P25:Class;
		//[Embed(source = 'sounds/jump.mp3')] static public var _jump:Class;
		
		
		public function Registry()
		{
		}
	}
}