package events
{
	import starling.events.Event;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class SoundEvent extends Event
	{
		public static const MUTE:String = "mute";
		public static const UNMUTE:String = "unmute";
		static public const PLAY_MUSIC:String = "playMusic";
		
		public function SoundEvent(type:String, bubbles:Boolean = false, data:Object = null)
		{
			super(type, bubbles, data);
		}
	
	}
}