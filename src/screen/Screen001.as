package screen
{
	import components.SimpleButton;
	import events.ScreenEvent;
	import services.Assets;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
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
		private var logo1:Image;
		private var logo2:Image;
		private var logo3:Image;
		private var logo1TxtF:TextField;
		private var logo2TxtF:TextField;
		
		public function Screen001()
		{
			container = new Sprite();
			addChild(container);
			
			background = new Image(Assets.getTexture("screenCorkBackground"));
			container.addChild(background);
			
			planeta = new Image(Assets.getTexture("screenPlaneta"));
			planeta.x = 277;
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
			
			logo1 = new Image(Assets.getTexture("logoFundusz"));
			logo1.x = 100;
			logo1.y = 670;
			container.addChild(logo1);
			
			logo1TxtF = new TextField(logo1.width, 15, "Instytucja finansujaca:", "KarnivatFont", 50, 0xa0522d);
			logo1TxtF.autoScale = true;
			logo1TxtF.vAlign = VAlign.CENTER;
			logo1TxtF.hAlign = HAlign.LEFT;
			logo1TxtF.x = logo1.x + 10;
			logo1TxtF.y = logo1.y - logo1TxtF.height;
			container.addChild(logo1TxtF);
			
			logo2 = new Image(Assets.getTexture("logoAmest"));
			logo2.x = 450;
			logo2.y = 700;
			container.addChild(logo2);
			
			logo2TxtF = new TextField(logo2.width, 20, "Partner merytoryczny:", "KarnivatFont", 50, 0xa0522d);
			logo2TxtF.autoScale = true;
			logo2TxtF.vAlign = VAlign.CENTER;
			logo2TxtF.hAlign = HAlign.CENTER;
			logo2TxtF.x = logo2.x;
			logo2TxtF.y = logo2.y - logo2TxtF.height;
			container.addChild(logo2TxtF);
			
			logo3 = new Image(Assets.getTexture("logoChlorofil"));
			logo3.x = 750;
			logo3.y = 695;
			container.addChild(logo3);
			
			startBtn = new SimpleButton(Assets.getTexture("button_Start"));
			startBtn.pivotX = startBtn.width / 2;
			startBtn.pivotY = startBtn.height / 2;
			startBtn.addEventListener(Event.TRIGGERED, onStartBtn_handler);
			startBtn.x = 535;
			startBtn.y = 410;
			container.addChild(startBtn);
		}
		
		private function onStartBtn_handler(e:Event):void
		{
			Starling.current.stage.dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SCREEN, false, 1));
		}
	
	}
}