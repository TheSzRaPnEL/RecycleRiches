package events 
{
	import starling.events.Event;
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class GameEvent extends Event
	{
		public static const RESTART_GAME:String = "restartGame";
		
		public function GameEvent(type:String, bubbles:Boolean = false, data:Object = null)
		{
			super(type, bubbles, data);
		}
		
	}
}