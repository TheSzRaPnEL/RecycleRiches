package components
{
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
			
			headlineTxtF = new TextField(780, 80, "system odzysku i recyklingu zużytych źródeł światła\ni lamp fluorescencyjnych", "KarnivatFont", 50, 0xFFFFFF);
			headlineTxtF.color = 0xFFFFFF;
			headlineTxtF.autoScale = true;
			headlineTxtF.vAlign = VAlign.CENTER;
			headlineTxtF.hAlign = HAlign.CENTER;
			headlineTxtF.x = 25;
			headlineTxtF.y = 13;
			container.addChild(headlineTxtF);
			
			content = new Image(Assets.getTexture("systemOdzyskuText"));
			content.x = 70;
			content.y = 125;
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
		}
		
	}
}