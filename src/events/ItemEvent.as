package events 
{
	import starling.events.Event;
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class ItemEvent extends Event
	{
		public static const SELECTED:String = "selected";
		
		public function ItemEvent(type:String, bubbles:Boolean = false, data:Object = null)
		{
			super(type, bubbles, data);
		}
		
	}
}