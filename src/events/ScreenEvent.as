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
		static public const HIDE_SCREEN:String = "hideScreen";
		static public const SHOW_LIFECYCLE_POPUP:String = "showLifecyclePopup";
		static public const HIDE_LIFECYCLE_POPUP:String = "hideLifecyclePopup";
		static public const SHOW_RECYCLESYSTEM_POPUP:String = "showRecyclesystemPopup";
		static public const HIDE_RECYCLESYSTEM_POPUP:String = "hideRecyclesystemPopup";
		static public const UPDATE_VISITOR_NUM:String = "updateVisitorNum";
		static public const SHOW_SKLADOWISKO_POPUP:String = "showSkladowiskoPopup";
		static public const HIDE_SKLADOWISKO_POPUP:String = "hideSkladowiskoPopup";
		
		public function ScreenEvent(type:String, bubbles:Boolean = false, data:Object = null)
		{
			super(type, bubbles, data);
		}
		
	}
}