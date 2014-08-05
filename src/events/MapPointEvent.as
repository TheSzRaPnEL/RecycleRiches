package events
{
	import starling.events.Event;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class MapPointEvent extends Event
	{
		public static const MOUSE_OVER:String = "mouseOverMapPoint";
		static public const MOUSE_OUT:String = "mouseOutMapPoint";
		
		public function MapPointEvent(type:String, bubbles:Boolean = false, data:Object = null)
		{
			super(type, bubbles, data);
		}
	
	}
}