package components 
{
	import events.ScreenEvent;
	import model.LifeCycle;
	import services.Assets;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.utils.Color;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class LifeCyclePopup extends Sprite
	{
		private var container:Sprite;
		private var background:Image;
		private var cycleTxtF:TextField;
		private var _lifeCycle:Sprite;
		private var typeTxtF:TextField;
		private var exitBtn:SimpleButton;
		private var colorCircles:Vector.<ColorCircle>;
		private var itemImages:Vector.<Image>;
		
		public function LifeCyclePopup() 
		{
			itemImages = new Vector.<Image>;
			colorCircles = new Vector.<ColorCircle>;
			
			container = new Sprite();
			addChild(container);
			
			background = new Image(Assets.getTexture("popup_LifeCycle"));
			container.addChild(background);
			
			cycleTxtF = new TextField(200, 60, "CYKL DOTYCZY:", "KarnivatFont", 50, 0xFFFFFF);
			cycleTxtF.color = 0xFFFFFF;
			cycleTxtF.autoScale = true;
			cycleTxtF.vAlign = VAlign.CENTER;
			cycleTxtF.hAlign = HAlign.CENTER;
			cycleTxtF.x = 25;
			cycleTxtF.y = 25;
			container.addChild(cycleTxtF);
			
			typeTxtF = new TextField(250, 100, "", "KarnivatFont", 50, 0xFFFFFF);
			typeTxtF.color = 0x2e6519;
			typeTxtF.autoScale = true;
			typeTxtF.vAlign = VAlign.CENTER;
			typeTxtF.hAlign = HAlign.CENTER;
			typeTxtF.x = 20;
			typeTxtF.y = 80;
			container.addChild(typeTxtF);
			
			exitBtn = new SimpleButton(Assets.getTexture("button_Exit"));
			exitBtn.x = 915;
			exitBtn.y = 20;
			exitBtn.addEventListener(Event.TRIGGERED, onExitBtnTriggered);
			container.addChild(exitBtn);
		}
		
		private function onExitBtnTriggered(e:Event):void 
		{
			Starling.current.stage.dispatchEvent(new ScreenEvent(ScreenEvent.HIDE_LIFECYCLE_POPUP));
		}
		
		public function updateType(string:String):void
		{
			typeTxtF.text = string;
		}
		
		public function set lifeCycle(lifeCycle:LifeCycle):void
		{
			if (_lifeCycle && _lifeCycle.parent)
			{
				removeChild(_lifeCycle);
				_lifeCycle = null;
			}
			_lifeCycle = lifeCycle;
			_lifeCycle.scaleX = 1.2;
			_lifeCycle.scaleY = _lifeCycle.scaleX
			addChild(_lifeCycle);
			lifeCycle.x = 300;
			lifeCycle.y = 200;
			
			if (colorCircles.length)
			{
				for (var i:int = 0; i < colorCircles.length; i++)
				{
					container.removeChild(colorCircles[i]);
					colorCircles[i] = null;
				}
				colorCircles.length = 0;
			}
			
			if (itemImages.length)
			{
				for (i = 0; i < itemImages.length; i++)
				{
					container.removeChild(itemImages[i]);
					itemImages[i] = null;
				}
				itemImages.length = 0;
			}
			
			for (i = 0; i < lifeCycle.itemImages.length; i++)
			{
				var colorCircle:ColorCircle = new ColorCircle();
				colorCircle.color = Color.GREEN;
				colorCircle.x = 250 + i * 110;
				container.addChild(colorCircle);
				colorCircles.push(colorCircle);
				
				var itemImage:Image = new Image(lifeCycle.itemImages[i]);
				itemImage.pivotX = itemImage.width / 2;
				itemImage.pivotY = itemImage.height / 2;
				itemImage.x = colorCircle.x + colorCircle.width / 2;
				itemImage.y = colorCircle.y + colorCircle.height / 2;
				container.addChild(itemImage);
				itemImages.push(itemImage);
			}
		}
		
	}
}