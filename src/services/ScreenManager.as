package services 
{
	import screen.Screen001;
	import screen.Screen002;
	import starling.display.Sprite;
	import starling.events.Event;
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class ScreenManager extends Sprite
	{
		private var screens:Vector.<Sprite>
		
		public function ScreenManager() 
		{
			screens = new Vector.<Sprite>;
			screens.push(new Screen001);
			screens.push(new Screen002);
			
			screens[0].addEventListener(Event.CLOSE, onScreen001StartBtn_handler);
		}
		
		private function onScreen001StartBtn_handler(e:Event):void 
		{
			hideScreen(0);
			showScreen(1);
		}
		
		public function showScreen(screenId:int):void
		{
			if (screens[screenId].parent == null)
				addChild(screens[screenId]);
			screens[screenId].visible = true;
		}
		
		public function hideScreen(screenId:int):void
		{
			if (screens[screenId].parent)
				removeChild(screens[screenId]);
			screens[screenId].visible = false;
		}
		
	}
}