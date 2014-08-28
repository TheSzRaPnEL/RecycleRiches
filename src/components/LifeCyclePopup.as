package components
{
	import events.ScreenEvent;
	import events.SoundEvent;
	import model.LifeCycle;
	import model.lifeCycles.LifeCycle001;
	import model.lifeCycles.LifeCycle002;
	import model.lifeCycles.LifeCycle003;
	import model.lifeCycles.LifeCycle004;
	import model.lifeCycles.LifeCycle005;
	import model.lifeCycles.LifeCycle006;
	import model.lifeCycles.LifeCycle007;
	import model.lifeCycles.LifeCycle008;
	import model.lifeCycles.LifeCycle009;
	import model.lifeCycles.LifeCycle010;
	import model.lifeCycles.LifeCycle011;
	import model.lifeCycles.LifeCycle012;
	import model.lifeCycles.LifeCycle013;
	import model.lifeCycles.LifeCycle014;
	import model.lifeCycles.LifeCycle015;
	import model.lifeCycles.LifeCycle016;
	import model.lifeCycles.LifeCycle017;
	import model.lifeCycles.LifeCycle018;
	import model.lifeCycles.LifeCycle019;
	import model.lifeCycles.LifeCycle020;
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
		private var _lifeCycle:LifeCycle;
		private var typeTxtF:TextField;
		private var exitBtn:SimpleButton;
		private var colorCircles:Vector.<ColorCircle>;
		private var itemImages:Vector.<Image>;
		private var lifeCycles:Vector.<LifeCycle>
		private var skladowiskoBtn:SimpleButton;
		
		public function LifeCyclePopup()
		{
			lifeCycles = new Vector.<LifeCycle>;
			lifeCycles.push(new LifeCycle001());
			lifeCycles.push(new LifeCycle002());
			lifeCycles.push(new LifeCycle003());
			lifeCycles.push(new LifeCycle004());
			lifeCycles.push(new LifeCycle005());
			lifeCycles.push(new LifeCycle006());
			lifeCycles.push(new LifeCycle007());
			lifeCycles.push(new LifeCycle008());
			lifeCycles.push(new LifeCycle009());
			lifeCycles.push(new LifeCycle010());
			lifeCycles.push(new LifeCycle011());
			lifeCycles.push(new LifeCycle012());
			lifeCycles.push(new LifeCycle013());
			lifeCycles.push(new LifeCycle014());
			lifeCycles.push(new LifeCycle015());
			lifeCycles.push(new LifeCycle016());
			lifeCycles.push(new LifeCycle017());
			lifeCycles.push(new LifeCycle018());
			lifeCycles.push(new LifeCycle019());
			lifeCycles.push(new LifeCycle020());
			
			itemImages = new Vector.<Image>;
			colorCircles = new Vector.<ColorCircle>;
			
			container = new Sprite();
			addChild(container);
			
			background = new Image(Assets.getTexture("popup_LifeCycle"));
			container.addChild(background);
			
			cycleTxtF = new TextField(200, 60, "CYKL DOTYCZY:", "GillSansMTFont", 50, 0xFFFFFF);
			cycleTxtF.color = 0xFFFFFF;
			cycleTxtF.autoScale = true;
			cycleTxtF.vAlign = VAlign.CENTER;
			cycleTxtF.hAlign = HAlign.CENTER;
			cycleTxtF.x = 25;
			cycleTxtF.y = 25;
			container.addChild(cycleTxtF);
			
			typeTxtF = new TextField(250, 100, "", "GillSansMTFont", 50, 0xFFFFFF);
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
			
			skladowiskoBtn = new SimpleButton(Assets.getTexture("kosz_Odzysk"));
			skladowiskoBtn.alpha = 0;
			skladowiskoBtn.x = 30;
			skladowiskoBtn.y = 170;
			skladowiskoBtn.addEventListener(Event.TRIGGERED, onSkladowiskoBtnTriggered);
			container.addChild(skladowiskoBtn);
		}
		
		private function onSkladowiskoBtnTriggered(e:Event):void
		{
			Starling.current.stage.dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SKLADOWISKO_POPUP));
			Starling.current.stage.dispatchEvent(new SoundEvent(SoundEvent.PLAY_SOUND, false, "CancelClick"));
		}
		
		private function onExitBtnTriggered(e:Event):void
		{
			Starling.current.stage.dispatchEvent(new ScreenEvent(ScreenEvent.HIDE_LIFECYCLE_POPUP));
			Starling.current.stage.dispatchEvent(new SoundEvent(SoundEvent.PLAY_SOUND, false, "CancelClick"));
		}
		
		public function updateType(string:String):void
		{
			//typeTxtF.text = string;
			if (string == "Recykling\nSkładowanie >>" || string == "Odzysk\nSkładowanie >>")
			{
				skladowiskoBtn.removeEventListener(Event.TRIGGERED, onSkladowiskoBtnTriggered);
				skladowiskoBtn.addEventListener(Event.TRIGGERED, onSkladowiskoBtnTriggered);
			}
			else
			{
				skladowiskoBtn.removeEventListener(Event.TRIGGERED, onSkladowiskoBtnTriggered);
			}
		}
		
		public function set lifeCycle(lifeCycleId:int):void
		{
			if (_lifeCycle && _lifeCycle.parent)
			{
				removeChild(_lifeCycle);
				_lifeCycle = null;
			}
			_lifeCycle = lifeCycles[lifeCycleId - 1];
			_lifeCycle.touchable = false;
			_lifeCycle.scaleX = 1;
			_lifeCycle.scaleY = _lifeCycle.scaleX
			addChild(_lifeCycle);
			_lifeCycle.x = -35;
			_lifeCycle.y = 105;
			
			updateType(_lifeCycle.type);
			
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
			
			for (i = 0; i < _lifeCycle.itemImages.length; i++)
			{
				var colorCircle:ColorCircle = new ColorCircle();
				colorCircle.color = Color.GREEN;
				colorCircle.x = 250 + i * 110;
				container.addChild(colorCircle);
				colorCircles.push(colorCircle);
				
				var itemImage:Image = new Image(_lifeCycle.itemImages[i]);
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