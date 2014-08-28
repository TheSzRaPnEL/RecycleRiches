package components
{
	import events.ScreenEvent;
	import events.SoundEvent;
	import services.Assets;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class RecycleSystemPopup extends Sprite
	{
		private var container:Sprite;
		private var background:Image;
		private var headlineTxtF:TextField;
		private var exitBtn:SimpleButton;
		private var content:Image;
		
		public function RecycleSystemPopup()
		{
			container = new Sprite();
			addChild(container);
			
			background = new Image(Assets.getTexture("popup_LifeCycle"));
			container.addChild(background);
			
			headlineTxtF = new TextField(780, 80, "", "GillSansMTFont", 50, 0xFFFFFF);
			headlineTxtF.color = 0xFFFFFF;
			headlineTxtF.autoScale = true;
			headlineTxtF.vAlign = VAlign.CENTER;
			headlineTxtF.hAlign = HAlign.CENTER;
			headlineTxtF.x = 25;
			headlineTxtF.y = 13;
			container.addChild(headlineTxtF);
			
			content = new Image(Assets.getTexture("001"));
			content.x = -50;
			content.y = -110;
			container.addChild(content);
			
			exitBtn = new SimpleButton(Assets.getTexture("button_Exit"));
			exitBtn.x = 915;
			exitBtn.y = 20;
			exitBtn.addEventListener(Event.TRIGGERED, onExitBtnTriggered);
			container.addChild(exitBtn);
		}
		
		private function onExitBtnTriggered(e:Event):void
		{
			Starling.current.stage.dispatchEvent(new ScreenEvent(ScreenEvent.HIDE_RECYCLESYSTEM_POPUP));
			Starling.current.stage.dispatchEvent(new SoundEvent(SoundEvent.PLAY_SOUND, false, "CancelClick"));
		}
		
		public function updateContent(value:int):void
		{
			var name:String;
			if (value < 10)
			{
				name = "00" + value;
			}
			else
			{
				name = "0" + value;
			}
			var txtr:Texture = Assets.getTexture(name);
			content.texture = txtr;
		}
		
	}
}