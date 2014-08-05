package events
{
	import starling.events.Event;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class MaterialEvent extends Event
	{
		public static const SELECTED:String = "materialSelected";
		
		public function MaterialEvent(type:String, bubbles:Boolean = false, data:Object = null)
		{
			super(type, bubbles, data);
		}
	
	}
}