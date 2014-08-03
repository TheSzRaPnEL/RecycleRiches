package events 
{
	import starling.events.Event;
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class ScreenEvent extends Event
	{
		public static const POPUP_CANCEL:String = "popupCancel";
		public static const POPUP_SORT:String = "popupSort";
		static public const SHOW_SCREEN:String = "showScreen";
		
		public function ScreenEvent(type:String, bubbles:Boolean = false, data:Object = null)
		{
			super(type, bubbles, data);
		}
		
	}
}