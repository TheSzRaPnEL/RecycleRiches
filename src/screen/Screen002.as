package screen
{
	import components.GrassItemOverlay;
	import components.ItemImage;
	import components.Popup;
	import events.GameEvent;
	import events.ItemEvent;
	import events.ScreenEvent;
	import flash.geom.Rectangle;
	import model.Item;
	import model.items.Akumulator;
	import model.items.Baterie;
	import model.items.Butelka;
	import model.items.ButelkaPet;
	import model.items.Cd;
	import model.items.Garnek;
	import model.items.Gazeta;
	import model.items.Jarzeniowka;
	import model.items.Jogurt;
	import model.items.Spryskiwacz;
	import model.items.Ogryzek;
	import model.items.Puszka;
	import model.items.Komorka;
	import model.items.Siatka;
	import model.items.Krzeslo;
	import model.items.Opona;
	import model.items.Leki;
	import model.items.Mis;
	import model.items.Patyki;
	import model.items.Rower;
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
		private var itemImages:Vector.<ItemImage>;
		private var grassImages:Vector.<Image>;
		private var popupInfo:Popup;
		private var grassItemOverlay:GrassItemOverlay;
		private var blackOverlay:Quad;
		private var selectedItemImage:ItemImage;
		private var topBorder:Image;
		
		public function Screen002()
		{
			this.clipRect = new Rectangle(0, 0, 1024, 768);
			
			container = new Sprite();
			addChild(container);
			
			items = new Vector.<Item>;
			items.push(new Garnek());
			items.push(new Opona());
			items.push(new Spryskiwacz());
			items.push(new Ogryzek());
			items.push(new Komorka());
			items.push(new Krzeslo());
			items.push(new Puszka());
			items.push(new Patyki());
			items.push(new Baterie());
			items.push(new Butelka());
			items.push(new Gazeta());
			items.push(new Rower());
			items.push(new Jarzeniowka());
			items.push(new Leki());
			items.push(new Jogurt());
			items.push(new Akumulator());
			items.push(new ButelkaPet());
			items.push(new Cd());
			items.push(new Siatka());
			items.push(new Mis());
			
			background = new Image(Assets.getTexture("screenCorkBackground"));
			container.addChild(background);
			
			popupInfo = new Popup();
			popupInfo.visible = false;
			addChild(popupInfo);
			
			itemImages = new Vector.<ItemImage>;
			grassImages = new Vector.<Image>;
			for (var i:int = 0; i < items.length; i++)
			{
				var grass:Image = new Image(Assets.getTexture("jasnePoleTrawy"));
				grass.x = 60 + 162 * (i % 5);
				grass.y = 100 + 148 * int(i / 5);
				grassImages.push(grass);
				container.addChild(grass);
				
				items[i].available = true;
				var item:ItemImage = new ItemImage(items[i].itemTexture);
				item.itemRef = items[i];
				item.pivotX = item.width / 2;
				item.pivotY = item.height / 2;
				item.x = grass.x + 133;
				item.y = grass.y + 81;
				item.addEventListener(TouchEvent.TOUCH, onItemImageTouch);
				itemImages.push(item);
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
			
			topBorder = new Image(Assets.getTexture("screenTopWhite"));
			container.addChild(topBorder);
			
			Starling.current.stage.addEventListener(ScreenEvent.POPUP_CANCEL, cancelSelection_handler);
			Starling.current.stage.addEventListener(ScreenEvent.POPUP_SORT, sortSelection_handler);
			Starling.current.stage.addEventListener(GameEvent.RESTART_GAME, restartGame_handler);
		}
		
		private function restartGame_handler(e:GameEvent):void
		{
			for (var i:int = 0; i < items.length; i++)
			{
				items[i].available = true;
				itemImages[i].visible = true;
			}
		}
		
		private function onItemImageTouch(e:TouchEvent):void
		{
			var touch:Touch = e.getTouch(stage);
			if (touch.phase == TouchPhase.BEGAN)
			{
				selectedItemImage = ItemImage(e.target);
				
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
				grassItemOverlay.x = grassImages[itemImages.indexOf(e.target)].x;
				grassItemOverlay.y = grassImages[itemImages.indexOf(e.target)].y;
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
			
			selectedItemImage.itemRef.available = false;
			selectedItemImage.removeEventListener(TouchEvent.TOUCH, onItemImageTouch);
			selectedItemImage.visible = false;
			
			sortSelection();
		}
		
		public function sortSelection():void
		{
			popupInfo.visible = false;
			grassItemOverlay.visible = false;
			
			var allItemsPicked:Boolean = true;
			for (var i:int = 0; i < items.length; i++)
			{
				if (items[i].available)
				{
					allItemsPicked = false;
					break;
				}
			}
			
			if (allItemsPicked)
				Starling.current.stage.dispatchEvent(new ItemEvent(ItemEvent.ALL_ITEMS_PICKED));
			
			Starling.current.stage.dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SCREEN, false, 2));
		}
	
	}
}