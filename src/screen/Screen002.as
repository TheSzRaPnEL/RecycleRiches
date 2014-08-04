package screen
{
	import components.GrassItemOverlay;
	import components.ItemImage;
	import components.Popup;
	import events.ItemEvent;
	import events.ScreenEvent;
	import flash.geom.Rectangle;
	import model.Item;
	import model.items.Banan;
	import model.items.BrazoweCos;
	import model.items.Butelka;
	import model.items.ButelkaPet;
	import model.items.Chleb;
	import model.items.Karton;
	import model.items.Karton2;
	import model.items.Karton3;
	import model.items.Konserwa;
	import model.items.Kurczak;
	import model.items.Ogryzek;
	import model.items.Puszka;
	import model.items.Rura;
	import model.items.Siatka;
	import model.items.Skarpeta;
	import model.items.Sloik;
	import model.items.Szalik;
	import model.items.Szklo;
	import model.items.UkladScalony;
	import model.items.Widelec;
	import services.Assets;
	import starling.core.Starling;
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
		private var container:Sprite;
		private var background:Image;
		private var items:Vector.<Item>;
		private var popupInfo:Popup;
		private var grassItemOverlay:GrassItemOverlay;
		private var blackOverlay:Quad;
		
		public function Screen002()
		{
			this.clipRect = new Rectangle(0, 0, 1024, 768);
			
			container = new Sprite();
			addChild(container);
			
			items = new Vector.<Item>;
			items.push(new Karton());
			items.push(new Sloik());
			items.push(new Kurczak());
			items.push(new Ogryzek());
			items.push(new Rura());
			items.push(new Skarpeta());
			items.push(new Puszka());
			items.push(new UkladScalony());
			items.push(new BrazoweCos());
			items.push(new Butelka());
			items.push(new Karton2());
			items.push(new Widelec());
			items.push(new Karton3());
			items.push(new Szalik());
			items.push(new Konserwa());
			items.push(new Banan());
			items.push(new ButelkaPet());
			items.push(new Chleb());
			items.push(new Siatka());
			items.push(new Szklo());
			
			background = new Image(Assets.getTexture("screen002"));
			background.x = -2;
			background.y = -2;
			container.addChild(background);
			
			popupInfo = new Popup();
			popupInfo.visible = false;
			addChild(popupInfo);
			
			for (var i:int = 0; i < items.length; i++)
			{
				var item:ItemImage = new ItemImage(items[i].itemTexture);
				item.itemRef = items[i];
				item.pivotX = item.width / 2;
				item.pivotY = item.height / 2;
				item.x = 185 + 162 * (i % 5);
				item.y = 181 + 148 * int(i / 5);
				item.addEventListener(TouchEvent.TOUCH, onItemImageTouch);
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
		
		private function onItemImageTouch(e:TouchEvent):void
		{
			var touch:Touch = e.getTouch(stage);
			if (touch.phase == TouchPhase.BEGAN)
			{
				blackOverlay.visible = true;
				
				popupInfo.x = DisplayObject(e.target).x + 60;
				popupInfo.y = DisplayObject(e.target).y;
				popupInfo.visible = true;
				popupInfo.swapTexture = false;
				if (popupInfo.x > width - popupInfo.width)
				{
					popupInfo.x -= popupInfo.width + grassItemOverlay.width + 100;
					popupInfo.swapTexture = true;
				}
				popupInfo.setItem(ItemImage(e.target).itemRef);
				
				grassItemOverlay.visible = true;
				grassItemOverlay.x = DisplayObject(e.target).x;
				grassItemOverlay.y = DisplayObject(e.target).y;
				grassItemOverlay.setItem(Image(e.target).texture);
				
				Starling.current.stage.dispatchEvent(new ItemEvent(ItemEvent.SELECTED, false, ItemImage(e.target).itemRef));
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
			blackOverlay.visible = false;
			popupInfo.visible = false;
			grassItemOverlay.visible = false;
			
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