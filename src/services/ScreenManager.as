package services
{
	import screen.Screen001;
	import screen.Screen002;
	import screen.Screen003;
	import screen.Screen004;
	import screen.Screen005;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class ScreenManager extends Sprite
	{
		private var screens:Vector.<Sprite>;
		private var currentScreenId:int = -1;
		
		public function ScreenManager()
		{
			screens = new Vector.<Sprite>;
			screens.push(new Screen001());
			screens.push(new Screen002());
			screens.push(new Screen003());
			screens.push(new Screen004());
			screens.push(new Screen005());
		}
		
		public function showScreen(screenId:int):void
		{
			if (screens[screenId].parent == null)
				addChild(screens[screenId]);
			
			screens[screenId].visible = true;
			
			currentScreenId = screenId;
		}
		
		public function hideScreen(screenId:int):void
		{
			screens[screenId].visible = false;
			if (screens[screenId].parent)
				removeChild(screens[screenId]);
		}
	
	}
}