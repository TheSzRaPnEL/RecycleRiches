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
	import model.items.Komorka;
	import model.items.Krzeslo;
	import model.items.Leki;
	import model.items.Mis;
	import model.items.Ogryzek;
	import model.items.Opona;
	import model.items.Patyki;
	import model.items.Puszka;
	import model.items.Rower;
	import model.items.Siatka;
	import model.items.Spryskiwacz;
	import services.Assets;
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.text.TextField;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
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
		private var logo1:Image;
		private var logo2:Image;
		private var logo1TxtF:TextField;
		private var logo2TxtF:TextField;
		private var logoGry:Image;
		private var basket1:Image;
		private var basket2:Image;
		private var basket3:Image;
		private var basket4:Image;
		private var botBorder:Image;
		
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
			
			botBorder = new Image(Assets.getTexture("screenBotWhite"));
			botBorder.y = 768 - botBorder.height;
			container.addChild(botBorder);
			
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
			
			logoGry = new Image(Assets.getTexture("logoGry"));
			logoGry.scaleX = 0.7;
			logoGry.scaleY = logoGry.scaleX;
			logoGry.x = 20;
			logoGry.y = 10;
			container.addChild(logoGry);
			
			logo1 = new Image(Assets.getTexture("logoFundusz"));
			logo1.scaleX = 0.7;
			logo1.scaleY = logo1.scaleX;
			logo1.x = 500;
			logo1.y = 20;
			container.addChild(logo1);
			
			logo1TxtF = new TextField(logo1.width, 15, "Instytucja finansujaca:", "KarnivatFont", 50, 0xa0522d);
			logo1TxtF.autoScale = true;
			logo1TxtF.vAlign = VAlign.CENTER;
			logo1TxtF.hAlign = HAlign.LEFT;
			logo1TxtF.x = logo1.x + 5;
			logo1TxtF.y = logo1.y - logo1TxtF.height;
			container.addChild(logo1TxtF);
			
			logo2 = new Image(Assets.getTexture("logoAmest"));
			logo2.scaleX = 0.7;
			logo2.scaleY = logo2.scaleX;
			logo2.x = 760;
			logo2.y = 35;
			container.addChild(logo2);
			
			logo2TxtF = new TextField(logo1.width, 15, "Partner merytoryczny:", "KarnivatFont", 50, 0xa0522d);
			logo2TxtF.autoScale = true;
			logo2TxtF.vAlign = VAlign.CENTER;
			logo2TxtF.hAlign = HAlign.LEFT;
			logo2TxtF.x = logo2.x + 5 - (logo2TxtF.textBounds.width - logo2.width) / 2;
			logo2TxtF.y = logo2.y - logo2TxtF.height;
			container.addChild(logo2TxtF);
			
			basket1 = new Image(Assets.getTexture("kosz_Odzysk"));
			basket1.pivotX = basket1.width / 2;
			basket1.pivotY = basket1.height;
			basket1.x = 1 * 1024 / 8;
			basket1.y = 768;
			container.addChild(basket1);
			
			basket2 = new Image(Assets.getTexture("kosz_Recykling"));
			basket2.pivotX = basket2.width / 2;
			basket2.pivotY = basket2.height;
			basket2.x = 3 * 1024 / 8;
			basket2.y = 768;
			container.addChild(basket2);
			
			basket3 = new Image(Assets.getTexture("kosz_Skladowisko"));
			basket3.pivotX = basket3.width / 2;
			basket3.pivotY = basket3.height;
			basket3.x = 5 * 1024 / 8;
			basket3.y = 768;
			container.addChild(basket3);
			
			basket4 = new Image(Assets.getTexture("kosz_Unieszkodliwienie"));
			basket4.pivotX = basket4.width / 2;
			basket4.pivotY = basket4.height;
			basket4.x = 7 * 1024 / 8;
			basket4.y = 768;
			container.addChild(basket4);
			
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
				itemImages[i].removeEventListener(TouchEvent.TOUCH, onItemImageTouch);
				itemImages[i].addEventListener(TouchEvent.TOUCH, onItemImageTouch);
				itemImages[i].itemRef.available = true;
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