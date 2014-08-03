package components
{
	import events.ScreenEvent;
	import services.Assets;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class Popup extends Sprite
	{
		private var container:Sprite;
		private var background:Image;
		private var item:Image;
		private var materialList:Sprite;
		private var cancelBtn:SimpleButton;
		private var sortBtn:SimpleButton;
		
		public function Popup()
		{
			container = new Sprite();
			addChild(container);
			
			background = new Image(Assets.getTexture("popup_Info"));
			container.addChild(background);
			
			item = new Image(Assets.getTexture("przedmiot_Puszka"));
			item.pivotX = item.width / 2;
			item.pivotY = item.height / 2;
			item.x = 120;
			item.y = 140;
			container.addChild(item);
			
			cancelBtn = new SimpleButton(Assets.getTexture("button_Anuluj"));
			cancelBtn.pivotX = cancelBtn.width / 2;
			cancelBtn.pivotY = cancelBtn.height / 2;
			cancelBtn.x = 120;
			cancelBtn.y = 250;
			cancelBtn.addEventListener(Event.TRIGGERED, onCancelBtn_handler);
			container.addChild(cancelBtn);
			
			sortBtn = new SimpleButton(Assets.getTexture("button_Segreguj"));
			sortBtn.pivotX = sortBtn.width / 2;
			sortBtn.pivotY = sortBtn.height / 2;
			sortBtn.x = 300;
			sortBtn.y = 250;
			sortBtn.addEventListener(Event.TRIGGERED, onSortBtn_handler);
			container.addChild(sortBtn);
			
			container.x = 0;
			container.y = -170;
		}
		
		private function onCancelBtn_handler(e:Event):void
		{
			Starling.current.stage.dispatchEvent(new ScreenEvent(ScreenEvent.POPUP_CANCEL));
		}
		
		private function onSortBtn_handler(e:Event):void
		{
			Starling.current.stage.dispatchEvent(new ScreenEvent(ScreenEvent.POPUP_SORT));
		}
		
		public function setItem(itemTexture:Texture):void
		{
			item.texture = itemTexture;
			item.width = itemTexture.width;
			item.height = itemTexture.height;
		}
	
	}
}