package events
{
	import starling.events.Event;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class InfoBtnEvent extends Event
	{
		public static const SHOW:String = "showInfoBtn";
		public static const HIDE:String = "hideInfoBtn";
		
		public function InfoBtnEvent(type:String, bubbles:Boolean = false, data:Object = null)
		{
			super(type, bubbles, data);
		}
	
	}
}