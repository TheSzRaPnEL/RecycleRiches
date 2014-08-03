package screen 
{
	import components.GrassItemOverlay;
	import components.Popup;
	import components.SimpleButton;
	import events.ScreenEvent;
	import model.Item;
	import model.items.Skarpeta;
	import services.Assets;
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class Screen002 extends Sprite
	{
		private static const itemNames:Vector.<String> = new <String>["przedmiot_Karton", "przedmiot_Sloik", "przedmiot_Kurczak", "przedmiot_Ogryzek", "przedmiot_Rura","przedmiot_Skarpeta","przedmiot_Puszka","przedmiot_UkladScalony","przedmiot_BrazoweCos","przedmiot_Butelka","przedmiot_Karton2","przedmiot_Widelec","przedmiot_Karton3","przedmiot_Szalik","przedmiot_Konserwa","przedmiot_Banan","przedmiot_ButelkaPet","przedmiot_Chleb","przedmiot_Siatka","przedmiot_Szklo"];
		
		private var container:Sprite;
		private var background:Image;
		private var items:Vector.<Item>;
		private var popupInfo:Popup;
		private var grassItemOverlay:GrassItemOverlay;
		private var blackOverlay:Quad;
		
		public function Screen002()
		{
			container = new Sprite();
			addChild(container);
			
			items = new Vector.<Item>;
			items.push(new Skarpeta());
			
			background = new Image(Assets.getTexture("screen002"));
			background.x = -2;
			background.y = -2;
			container.addChild(background);
			
			popupInfo = new Popup();
			popupInfo.visible = false;
			addChild(popupInfo);
			
			for (var i:int = 0; i < 20; i++)
			{
				var item:Image = new Image(Assets.getTexture(itemNames[i]));
				//var item:Image = new Image(Assets.getTexture("jasnePoleTrawy"));
				item.pivotX = item.width / 2;
				item.pivotY = item.height / 2;
				item.x = 185 + 162 * (i % 5);
				item.y = 181 + 148 * int(i / 5);
				item.addEventListener(TouchEvent.TOUCH, onItemTouch);
				container.addChild(item);
			}
			
			blackOverlay = new Quad(1024, 768, 0);
			blackOverlay.alpha = 0.8;
			blackOverlay.touchable = false;
			blackOverlay.visible = false;
			container.addChild(blackOverlay);
			
			grassItemOverlay = new GrassItemOverlay();
			grassItemOverlay.visible = false;
			grassItemOverlay.touchable = false;
			container.addChild(grassItemOverlay);
			
			Starling.current.stage.addEventListener(ScreenEvent.POPUP_CANCEL, cancelSelection_handler);
			Starling.current.stage.addEventListener(ScreenEvent.POPUP_SORT, sortSelection_handler);
		}
		
		private function onItemTouch(e:TouchEvent):void 
		{
			var touch:Touch = e.getTouch(stage);
			if (touch.phase == TouchPhase.BEGAN)
			{
				blackOverlay.visible = true;
				
				popupInfo.x = DisplayObject(e.target).x + 60;
				popupInfo.y = DisplayObject(e.target).y;
				popupInfo.visible = true;
				popupInfo.setItem(Image(e.target).texture);
				
				grassItemOverlay.visible = true;
				grassItemOverlay.x = DisplayObject(e.target).x;
				grassItemOverlay.y = DisplayObject(e.target).y;
				grassItemOverlay.setItem(Image(e.target).texture);
			}
		}
		
		private function cancelSelection_handler(e:ScreenEvent):void 
		{
			cancelSelection();
		}
		
		public function cancelSelection():void
		{
			blackOverlay.visible = false;
			popupInfo.visible = false;
			grassItemOverlay.visible = false;
		}
		
		private function sortSelection_handler(e:ScreenEvent):void 
		{
			sortSelection();
		}
		
		public function sortSelection():void
		{
			popupInfo.visible = false;
			grassItemOverlay.visible = false;
			
			Starling.current.stage.dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SCREEN, false, 2));
		}
		
	}
}