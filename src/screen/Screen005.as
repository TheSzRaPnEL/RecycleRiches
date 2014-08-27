package screen
{
	import components.SimpleButton;
	import events.GameEvent;
	import events.ScreenEvent;
	import events.SoundEvent;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	import services.Assets;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.text.TextField;
	import starling.utils.Color;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class Screen005 extends Sprite
	{
		private var container:Sprite;
		private var background:Image;
		private var topBorder:Image;
		private var botBorder:Image;
		private var endBtn:SimpleButton;
		private var planeta:Image;
		private var gameLogo:Image;
		private var logo1:Image;
		private var logo2:Image;
		private var logo3:Image;
		private var logo1TxtF:TextField;
		private var logo2TxtF:TextField;
		private var endSpeach:TextField;
		private var link:TextField;
		
		public function Screen005()
		{
			container = new Sprite();
			addChild(container);
			
			background = new Image(Assets.getTexture("screenCorkBackground"));
			container.addChild(background);
			
			planeta = new Image(Assets.getTexture("screenPlaneta"));
			planeta.scaleX = 0.7;
			planeta.scaleY = planeta.scaleX;
			planeta.x = 345;
			planeta.y = 100;
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
			
			endBtn = new SimpleButton(Assets.getTexture("button_Koniec"));
			endBtn.pivotX = endBtn.width / 2;
			endBtn.pivotY = endBtn.height / 2;
			endBtn.addEventListener(Event.TRIGGERED, onKoniecBtn_handler);
			endBtn.x = 530;
			endBtn.y = 340;
			container.addChild(endBtn);
			
			endSpeach = new TextField(750, 130, "Kampania dofinansowana przez Wojewódzki Fundusz\nOchrony Środowiska i Gospodarki Wodnej w Warszawie\nw formie dotacji, w kwocie 24 366 zł.", "GillSansMTFont", 24, 0xFFFFFF);
			endSpeach.color = Color.GREEN;
			endSpeach.autoScale = true;
			endSpeach.vAlign = VAlign.CENTER;
			endSpeach.hAlign = HAlign.CENTER;
			endSpeach.x = 135;
			endSpeach.y = 450;
			container.addChild(endSpeach);
			
			link = new TextField(600, 35, "wfosigw.pl", "GillSansMTFont", 30, 0xFFFFFF, true);
			link.underline = true;
			link.color = Color.GREEN;
			link.autoScale = true;
			link.vAlign = VAlign.CENTER;
			link.hAlign = HAlign.CENTER;
			link.x = 220;
			link.y = 590;
			container.addChild(link);
			link.addEventListener(TouchEvent.TOUCH, onLinkTouch);
		}
		
		private function onLinkTouch(e:TouchEvent):void 
		{
			if (e.getTouch(stage))
			{
				var touch:Touch = e.getTouch(stage)
				if (touch.phase == TouchPhase.BEGAN)
				{
					navigateToURL(new URLRequest("http://wfosigw.pl"), "_self");
				}
			}
		}
		
		private function onKoniecBtn_handler(e:Event):void
		{
			Starling.current.stage.dispatchEvent(new GameEvent(GameEvent.RESTART_GAME));
			Starling.current.stage.dispatchEvent(new ScreenEvent(ScreenEvent.HIDE_SCREEN, false, 1));
			Starling.current.stage.dispatchEvent(new ScreenEvent(ScreenEvent.HIDE_SCREEN, false, 2));
			Starling.current.stage.dispatchEvent(new ScreenEvent(ScreenEvent.HIDE_SCREEN, false, 3));
			Starling.current.stage.dispatchEvent(new ScreenEvent(ScreenEvent.HIDE_SCREEN, false, 4));
			Starling.current.stage.dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SCREEN, false, 0));
			Starling.current.stage.dispatchEvent(new SoundEvent(SoundEvent.PLAY_SOUND, false, "NormalClick"));
		}
	
	}
}