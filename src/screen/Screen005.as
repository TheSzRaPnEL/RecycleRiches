package screen
{
	import components.SimpleButton;
	import events.GameEvent;
	import events.ScreenEvent;
	import services.Assets;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class Screen005 extends Sprite
	{
		private var container:Sprite;
		private var background:Image;
		private var startBtn:SimpleButton;
		
		public function Screen005()
		{
			container = new Sprite();
			addChild(container);
			
			background = new Image(Assets.getTexture("screenCorkBackground"));
			container.addChild(background);
			
			startBtn = new SimpleButton(Assets.getTexture("button_Start"));
			startBtn.pivotX = startBtn.width / 2;
			startBtn.pivotY = startBtn.height / 2;
			startBtn.addEventListener(Event.TRIGGERED, onStartBtn_handler);
			startBtn.x = 515;
			startBtn.y = 600;
			container.addChild(startBtn);
		}
		
		private function onStartBtn_handler(e:Event):void
		{
			Starling.current.stage.dispatchEvent(new GameEvent(GameEvent.RESTART_GAME));
			Starling.current.stage.dispatchEvent(new ScreenEvent(ScreenEvent.HIDE_SCREEN, false, 4));
			Starling.current.stage.dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SCREEN, false, 0));
		}
	
	}
}