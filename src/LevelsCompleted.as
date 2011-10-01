package
{
	import org.flixel.*;
	
	public class LevelsCompleted
	{
		private static var _save:FlxSave; //The FlxSave instance
		private static var _temp:int = 0; //Holds level data if bind() did not work. This is not persitent, and will be deleted when the application ends
		private static var _loaded:Boolean = false; //Did bind() work? Do we have a valid SharedObject?
		
		/**
		 * Returns the number of levels that the player has completed for set1
		 */
		public static function get set1Levels():int
		{
			//We only get data from _save if it was loaded properly. Otherwise, use _temp
			if (_loaded)
			{
				return _save.data.set1Levels;
			}
			else
			{
				return _temp;
			}
		}
		
		/**
		 * Returns the number of levels that the player has completed for set2
		 */
		public static function get set2Levels():int
		{
			//We only get data from _save if it was loaded properly. Otherwise, use _temp
			if (_loaded)
			{
				return _save.data.set2Levels;
			}
			else
			{
				return _temp;
			}
		}
		
		/**
		 * Returns the number of levels that the player has completed for set3
		 */
		public static function get set3Levels():int
		{
			//We only get data from _save if it was loaded properly. Otherwise, use _temp
			if (_loaded)
			{
				return _save.data.set3Levels
			}
			else
			{
				return _temp;
			}
		}
		
		
		/**
		 * Sets the number of levels that the player has completed for set1
		 */
		public static function set set1Levels(value:int):void
		{
			if (_loaded)
			{
				_save.data.set1Levels = value;
			}
			else
			{
				_temp = value;
			}
		}
		
		/**
		 * Sets the number of levels that the player has completed for set2
		 */
		public static function set set2Levels(value:int):void
		{
			if (_loaded)
			{
				_save.data.set2Levels = value;
			}
			else
			{
				_temp = value;
			}
		}
		
		/**
		 * Sets the number of levels that the player has completed for set3
		 */
		public static function set set3Levels(value:int):void
		{
			if (_loaded)
			{
				_save.data.set3Levels = value;
			}
			else
			{
				_temp = value;
			}
		}
		
		/**
		 * Setup LevelsCompleted
		 */
		public static function load():void
		{
			_save = new FlxSave();
			_loaded = _save.bind("myLevelData");
			if (_loaded && _save.data.set1Levels == null) 
			{
				_save.data.set1Levels = 0;
			}
			else if (_loaded && _save.data.set2Levels == null) 
			{
				_save.data.set2Levels = 0;
			}
			else if (_loaded && _save.data.set3Levels == null) 
			{
				_save.data.set3Levels = 0;
			}
		}
	}
}