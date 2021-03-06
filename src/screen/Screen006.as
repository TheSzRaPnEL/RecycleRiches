package screen
{
	import events.ScreenEvent;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	import services.Assets;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.text.TextField;
	import starling.text.TextFieldAutoSize;
	import starling.utils.Color;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class Screen006 extends Sprite
	{
		private var container:Sprite;
		private var background:Image;
		private var topBorder:Image;
		private var botBorder:Image;
		private var planeta:Image;
		private var gameLogo:Image;
		private var logo1:Image;
		private var logo2:Image;
		private var logo3:Image;
		private var logo1TxtF:TextField;
		private var logo2TxtF:TextField;
		private var endSpeach:TextField;
		private var link:TextField;
		private var logo3TxtF:TextField;
		
		public function Screen006()
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
			
			logo1TxtF = new TextField(logo1.width, 20, "Instytucja finansujaca:", "GillSansMTFont", 50, 0xa0522d);
			logo1TxtF.autoScale = true;
			logo1TxtF.vAlign = VAlign.CENTER;
			logo1TxtF.hAlign = HAlign.LEFT;
			logo1TxtF.x = logo1.x;
			logo1TxtF.y = logo1.y - logo1TxtF.height;
			container.addChild(logo1TxtF);
			
			logo2 = new Image(Assets.getTexture("logoAmest"));
			logo2.x = 450;
			logo2.y = 700;
			container.addChild(logo2);
			
			logo2TxtF = new TextField(logo2.width, 20, "Partner merytoryczny:", "GillSansMTFont", 50, 0xa0522d);
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
			
			logo3TxtF = new TextField(logo3.width, 60, "Licznik odwiedzin: 0", "GillSansMTFont", 20, 0xa0522d);
			logo3TxtF.autoSize = TextFieldAutoSize.HORIZONTAL;
			logo3TxtF.vAlign = VAlign.CENTER;
			logo3TxtF.hAlign = HAlign.CENTER;
			logo3TxtF.x = 1024 - logo3TxtF.width - 20;
			logo3TxtF.y = logo3.y - logo3TxtF.height - 25;
			container.addChild(logo3TxtF);
			
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
			
			Starling.current.stage.addEventListener(ScreenEvent.UPDATE_VISITOR_NUM, updateVisitorNum_handler);
		}
		
		private function updateVisitorNum_handler(e:ScreenEvent):void 
		{
			logo3TxtF.text = "Licznik odwiedzin: " + e.data;
			logo3TxtF.x = 1024 - logo3TxtF.width - 20;
			logo3TxtF.y = logo3.y - logo3TxtF.height - 25;
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
		
	}
}