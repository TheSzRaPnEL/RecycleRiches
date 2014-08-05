package events
{
	import starling.events.Event;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class ItemEvent extends Event
	{
		public static const SELECTED:String = "itemSelected";
		static public const ALL_ITEMS_PICKED:String = "allItemsPicked";
		
		public function ItemEvent(type:String, bubbles:Boolean = false, data:Object = null)
		{
			super(type, bubbles, data);
		}
	
	}
}