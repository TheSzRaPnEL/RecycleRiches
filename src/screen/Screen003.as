package screen
{
	import components.ItemImage;
	import events.ItemEvent;
	import events.ScreenEvent;
	import flash.geom.Rectangle;
	import flash.utils.setTimeout;
	import model.Item;
	import model.ItemType;
	import services.Assets;
	import starling.core.Starling;
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
	public class Screen003 extends Sprite
	{
		private var container:Sprite;
		private var background:Quad;
		private var basket1:Image;
		private var basket2:Image;
		private var basket3:Image;
		private var basket4:Image;
		private var itemImage:ItemImage;
		private var popup:Image;
		private var topBorder:Image;
		private var logo1:Image;
		private var logo2:Image;
		private var logoGry:Image;
		private var logo1TxtF:TextField;
		private var logo2TxtF:TextField;
		private var botBorder:Image;
		
		public function Screen003()
		{
			clipRect = new Rectangle(0, 0, 1024, 768);
			
			container = new Sprite();
			addChild(container);
			
			background = new Quad(1024, 768, 0);
			background.alpha = 0.8;
			container.addChild(background);
			
			botBorder = new Image(Assets.getTexture("screenBotWhite"));
			botBorder.y = 768 - botBorder.height;
			container.addChild(botBorder);
			
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
			
			activateDragItemImage();
			
			Starling.current.stage.addEventListener(ItemEvent.SELECTED, itemSelected_handler);
		}
		
		private function itemSelected_handler(e:ItemEvent):void
		{
			updateItemImage(Item(e.data));
			activateDragItemImage();
		}
		
		public function updateItemImage(item:Item):void
		{
			if (itemImage == null)
			{
				itemImage = new ItemImage(item.itemTexture);
				itemImage.touchable = false;
				itemImage.itemRef = item;
				container.addChildAt(itemImage, container.getChildIndex(basket1));
			}
			else
			{
				itemImage.texture = item.itemTexture;
				itemImage.width = itemImage.texture.width;
				itemImage.height = itemImage.texture.height;
				itemImage.itemRef = item;
			}
		}
		
		private function onItemMove_handler(e:TouchEvent):void
		{
			if (e.getTouch(stage))
			{
				var touch:Touch = e.getTouch(stage);
				itemImage.x = touch.globalX - itemImage.width / 2;
				itemImage.y = touch.globalY - itemImage.height / 2;
				if (touch.phase == TouchPhase.HOVER)
				{
					basket1.alpha = 0.5;
					basket2.alpha = 0.5;
					basket3.alpha = 0.5;
					basket4.alpha = 0.5;
					
					if (touch.target == basket1)
					{
						basket1.alpha = 1;
					}
					else if (touch.target == basket2)
					{
						basket2.alpha = 1;
					}
					else if (touch.target == basket3)
					{
						basket3.alpha = 1;
					}
					else if (touch.target == basket4)
					{
						basket4.alpha = 1;
					}
					else
					{
						basket1.alpha = 1;
						basket2.alpha = 1;
						basket3.alpha = 1;
						basket4.alpha = 1;
					}
				}
				else if (touch.phase == TouchPhase.ENDED)
				{
					if (touch.target == basket1)
					{
						onBasket1Selected_handler();
					}
					else if (touch.target == basket2)
					{
						onBasket2Selected_handler();
					}
					else if (touch.target == basket3)
					{
						onBasket3Selected_handler();
					}
					else if (touch.target == basket4)
					{
						onBasket4Selected_handler();
					}
				}
			}
		}
		
		private function onBasket1Selected_handler():void
		{
			deactivateDragItemImage();
			
			if (itemImage.itemRef.type == ItemType.ODZYSK)
			{
				if (popup == null)
				{
					popup = new Image(Assets.getTexture("popup_Brawo"));
					popup.x = 512 - popup.width / 2;
					popup.y = 384 - popup.height / 2;
					container.addChild(popup);
				}
				else
				{
					popup.texture = Assets.getTexture("popup_Brawo");
					popup.width = popup.texture.width;
					popup.height = popup.texture.height;
					popup.visible = true;
				}
				
				setTimeout(gotoScreen4, 2000);
			}
			else
			{
				if (popup == null)
				{
					popup = new Image(Assets.getTexture("popup_Fail"));
					popup.x = 512 - popup.width / 2;
					popup.y = 384 - popup.height / 2;
					container.addChild(popup);
				}
				else
				{
					popup.texture = Assets.getTexture("popup_Fail");
					popup.width = popup.texture.width;
					popup.height = popup.texture.height;
					popup.visible = true;
				}
				
				setTimeout(hidePopup, 2000);
				setTimeout(activateDragItemImage, 2000);
			}
		}
		
		private function onBasket2Selected_handler():void
		{
			deactivateDragItemImage();
			
			if (itemImage.itemRef.type == ItemType.RECYKLING)
			{
				if (popup == null)
				{
					popup = new Image(Assets.getTexture("popup_Brawo"));
					popup.x = 512 - popup.width / 2;
					popup.y = 384 - popup.height / 2;
					container.addChild(popup);
				}
				else
				{
					popup.texture = Assets.getTexture("popup_Brawo");
					popup.width = popup.texture.width;
					popup.height = popup.texture.height;
					popup.visible = true;
				}
				
				setTimeout(gotoScreen4, 2000);
			}
			else
			{
				if (popup == null)
				{
					popup = new Image(Assets.getTexture("popup_Fail"));
					popup.x = 512 - popup.width / 2;
					popup.y = 384 - popup.height / 2;
					container.addChild(popup);
				}
				else
				{
					popup.texture = Assets.getTexture("popup_Fail");
					popup.width = popup.texture.width;
					popup.height = popup.texture.height;
					popup.visible = true;
				}
				
				setTimeout(hidePopup, 2000);
				setTimeout(activateDragItemImage, 2000);
			}
		}
		
		private function onBasket3Selected_handler():void
		{
			deactivateDragItemImage();
			
			if (itemImage.itemRef.type == ItemType.ODZYSK_I_RECYKLING)
			{
				if (popup == null)
				{
					popup = new Image(Assets.getTexture("popup_Brawo"));
					popup.x = 512 - popup.width / 2;
					popup.y = 384 - popup.height / 2;
					container.addChild(popup);
				}
				else
				{
					popup.texture = Assets.getTexture("popup_Brawo");
					popup.width = popup.texture.width;
					popup.height = popup.texture.height;
					popup.visible = true;
				}
				
				setTimeout(gotoScreen4, 2000);
			}
			else
			{
				if (popup == null)
				{
					popup = new Image(Assets.getTexture("popup_Fail"));
					popup.x = 512 - popup.width / 2;
					popup.y = 384 - popup.height / 2;
					container.addChild(popup);
				}
				else
				{
					popup.texture = Assets.getTexture("popup_Fail");
					popup.width = popup.texture.width;
					popup.height = popup.texture.height;
					popup.visible = true;
				}
				
				setTimeout(hidePopup, 2000);
				setTimeout(activateDragItemImage, 2000);
			}
		}
		
		private function onBasket4Selected_handler():void
		{
			deactivateDragItemImage();
			
			if (itemImage.itemRef.type == ItemType.SKLADOWISKO)
			{
				if (popup == null)
				{
					popup = new Image(Assets.getTexture("popup_Brawo"));
					popup.x = 512 - popup.width / 2;
					popup.y = 384 - popup.height / 2;
					container.addChild(popup);
				}
				else
				{
					popup.texture = Assets.getTexture("popup_Brawo");
					popup.width = popup.texture.width;
					popup.height = popup.texture.height;
					popup.visible = true;
				}
				
				setTimeout(gotoScreen4, 2000);
			}
			else
			{
				if (popup == null)
				{
					popup = new Image(Assets.getTexture("popup_Fail"));
					popup.x = 512 - popup.width / 2;
					popup.y = 384 - popup.height / 2;
					container.addChild(popup);
				}
				else
				{
					popup.texture = Assets.getTexture("popup_Fail");
					popup.width = popup.texture.width;
					popup.height = popup.texture.height;
					popup.visible = true;
				}
				
				setTimeout(hidePopup, 2000);
				setTimeout(activateDragItemImage, 2000);
			}
		}
		
		private function hidePopup():void
		{
			popup.visible = false;
		}
		
		private function activateDragItemImage():void
		{
			removeEventListener(TouchEvent.TOUCH, onItemMove_handler);
			addEventListener(TouchEvent.TOUCH, onItemMove_handler);
		}
		
		private function deactivateDragItemImage():void
		{
			removeEventListener(TouchEvent.TOUCH, onItemMove_handler);
		}
		
		private function gotoScreen4():void
		{
			deactivateDragItemImage();
			Starling.current.stage.dispatchEvent(new ScreenEvent(ScreenEvent.HIDE_SCREEN, false, 2));
			Starling.current.stage.dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SCREEN, false, 3));
			hidePopup();
		}
	
	}
}