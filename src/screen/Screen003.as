package screen 
{
	import components.ItemImage;
	import components.RobotArm;
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
	import starling.textures.Texture;
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class Screen003 extends Sprite
	{
		private var container:Sprite;
		private var background:Quad;
		private var robotArm:RobotArm;
		private var basket1:Image;
		private var basket2:Image;
		private var basket3:Image;
		private var basket4:Image;
		private var itemImage:ItemImage;
		private var popup:Image;
		
		public function Screen003()
		{
			clipRect = new Rectangle(0, 0, 1024, 768);
			
			container = new Sprite();
			addChild(container);
			
			background = new Quad(1024, 768, 0);
			background.alpha = 0.8;
			container.addChild(background);
			
			robotArm = new RobotArm;
			container.addChild(robotArm);
			
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
			
			addEventListener(TouchEvent.TOUCH, onBasketsTouch_handler);
			
			Starling.current.stage.addEventListener(ItemEvent.SELECTED, itemSelected_handler);
		}
		
		private function itemSelected_handler(e:ItemEvent):void 
		{
			updateItemImage(Item(e.data));
		}
		
		public function updateItemImage(item:Item):void
		{
			if (itemImage == null)
			{
				itemImage = new ItemImage(item.itemTexture);
				itemImage.itemRef = item;
				itemImage.x = robotArm.handlingPoint.x;
				itemImage.y = robotArm.handlingPoint.y;
				container.addChild(itemImage);
			}
			else
			{
				itemImage.texture = item.itemTexture;
				itemImage.width = itemImage.texture.width;
				itemImage.height = itemImage.texture.height;
			}
		}
		
		private function onBasketsTouch_handler(e:TouchEvent):void 
		{
			if (e.getTouch(stage))
			{
				var touch:Touch = e.getTouch(stage);
				if (touch.phase == TouchPhase.HOVER)
				{
					basket1.alpha = 0.5;
					basket2.alpha = 0.5;
					basket3.alpha = 0.5;
					basket4.alpha = 0.5;
					
					if (touch.target == basket1)
					{	basket1.alpha = 1; }
					else
					if (touch.target == basket2)
					{	basket2.alpha = 1; }
					else
					if (touch.target == basket3)
					{	basket3.alpha = 1; }
					else
					if (touch.target == basket4)
					{	basket4.alpha = 1; }
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
					{	onBasket1Selected_handler(); }
					else
					if (touch.target == basket2)
					{	onBasket2Selected_handler(); }
					else
					if (touch.target == basket3)
					{	onBasket3Selected_handler(); }
					else
					if (touch.target == basket4)
					{	onBasket4Selected_handler(); }
				}
			}
		}
		
		private function onBasket1Selected_handler():void
		{
			if (itemImage.itemRef.type == ItemType.ODZYSK)
			{
				if (popup == null)
				{
					popup = new Image(Assets.getTexture("popup_Brawo"));
					popup.x = 512 - popup.width;
					popup.y = 384 - popup.height;
					container.addChild(popup);
				}
				else
				{
					popup.texture = Assets.getTexture("popup_Brawo");
					popup.width = popup.texture.width;
					popup.height = popup.texture.height;
					popup.visible = true;
				}
				
				setTimeout(gotoScreen4, 3000);
			}
			else
			{
				if (popup == null)
				{
					popup = new Image(Assets.getTexture("popup_Fail"));
					popup.x = 512 - popup.width;
					popup.y = 384 - popup.height;
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
			}
		}
		
		private function onBasket2Selected_handler():void
		{
			if (itemImage.itemRef.type == ItemType.RECYKLING)
			{
				if (popup == null)
				{
					popup = new Image(Assets.getTexture("popup_Brawo"));
					popup.x = 512 - popup.width;
					popup.y = 384 - popup.height;
					container.addChild(popup);
				}
				else
				{
					popup.texture = Assets.getTexture("popup_Brawo");
					popup.width = popup.texture.width;
					popup.height = popup.texture.height;
					popup.visible = true;
				}
				
				setTimeout(gotoScreen4, 3000);
			}
			else
			{
				if (popup == null)
				{
					popup = new Image(Assets.getTexture("popup_Fail"));
					popup.x = 512 - popup.width;
					popup.y = 384 - popup.height;
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
			}
		}
		
		private function onBasket3Selected_handler():void
		{
			if (itemImage.itemRef.type == ItemType.ODZYSK_I_RECYKLING)
			{
				if (popup == null)
				{
					popup = new Image(Assets.getTexture("popup_Brawo"));
					popup.x = 512 - popup.width;
					popup.y = 384 - popup.height;
					container.addChild(popup);
				}
				else
				{
					popup.texture = Assets.getTexture("popup_Brawo");
					popup.width = popup.texture.width;
					popup.height = popup.texture.height;
					popup.visible = true;
				}
				
				setTimeout(gotoScreen4, 3000);
			}
			else
			{
				if (popup == null)
				{
					popup = new Image(Assets.getTexture("popup_Fail"));
					popup.x = 512 - popup.width;
					popup.y = 384 - popup.height;
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
			}
		}
		
		private function onBasket4Selected_handler():void
		{
			if (itemImage.itemRef.type == ItemType.SKLADOWISKO)
			{
				if (popup == null)
				{
					popup = new Image(Assets.getTexture("popup_Brawo"));
					popup.x = 512 - popup.width;
					popup.y = 384 - popup.height;
					container.addChild(popup);
				}
				else
				{
					popup.texture = Assets.getTexture("popup_Brawo");
					popup.width = popup.texture.width;
					popup.height = popup.texture.height;
					popup.visible = true;
				}
				
				setTimeout(gotoScreen4, 3000);
			}
			else
			{
				if (popup == null)
				{
					popup = new Image(Assets.getTexture("popup_Fail"));
					popup.x = 512 - popup.width;
					popup.y = 384 - popup.height;
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
			}
		}
		
		private function hidePopup():void
		{
			popup.visible = false;
		}
		
		private function gotoScreen4():void
		{
			Starling.current.stage.dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SCREEN, false, 3));
			hidePopup();
		}
		
	}
}