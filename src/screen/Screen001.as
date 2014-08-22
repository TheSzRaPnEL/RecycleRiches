package screen
{
	import components.SimpleButton;
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
	public class Screen001 extends Sprite
	{
		private var container:Sprite;
		private var background:Image;
		private var topBorder:Image;
		private var botBorder:Image;
		private var startBtn:SimpleButton;
		private var planeta:Image;
		private var gameLogo:Image;
		
		public function Screen001()
		{
			container = new Sprite();
			addChild(container);
			
			background = new Image(Assets.getTexture("screenCorkBackground"));
			container.addChild(background);
			
			planeta = new Image(Assets.getTexture("screenPlaneta"));
			planeta.x = 260;
			planeta.y = 70;
			container.addChild(planeta);
			
			topBorder = new Image(Assets.getTexture("screenTopWhite"));
			container.addChild(topBorder);
			
			gameLogo = new Image(Assets.getTexture("logoGry"));
			gameLogo.x = 250;
			gameLogo.y = 5;
			container.addChild(gameLogo);
			
			botBorder = new Image(Assets.getTexture("screenBotWhite"));
			botBorder.y = 768 - botBorder.height;
			container.addChild(botBorder);
			
			startBtn = new SimpleButton(Assets.getTexture("button_Start"));
			startBtn.pivotX = startBtn.width / 2;
			startBtn.pivotY = startBtn.height / 2;
			startBtn.addEventListener(Event.TRIGGERED, onStartBtn_handler);
			startBtn.x = 515;
			startBtn.y = 410;
			container.addChild(startBtn);
		}
		
		private function onStartBtn_handler(e:Event):void
		{
			Starling.current.stage.dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SCREEN, false, 1));
		}
	
	}
}