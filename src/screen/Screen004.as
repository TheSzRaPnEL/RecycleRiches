package screen
{
	import components.ItemImage;
	import components.MaterialList;
	import components.TextFieldList;
	import events.GameEvent;
	import events.ItemEvent;
	import events.MaterialEvent;
	import events.ScreenEvent;
	import model.Item;
	import model.Material;
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
	public class Screen004 extends Sprite
	{
		private var container:Sprite;
		private var background:Image;
		private var messageArea:Image;
		private var grassSpot:Image;
		private var itemImage:ItemImage;
		private var textFieldList:TextFieldList;
		private var materialList:MaterialList;
		private var materialLifeCycle:Image;
		private var nextArrow:Image;
		private var allItemsPicked:Boolean;
		private var topBorder:Image;
		private var logo1:Image;
		private var logo2:Image;
		private var logoGry:Image;
		private var logo1TxtF:TextField;
		private var logo2TxtF:TextField;
		private var messageAreaTxtF:TextField;
		private var cenaTxtF:TextField;
		
		public function Screen004()
		{
			allItemsPicked = false;
			
			container = new Sprite();
			addChild(container);
			
			background = new Image(Assets.getTexture("screenCorkBackground"));
			container.addChild(background);
			
			topBorder = new Image(Assets.getTexture("screenTopWhite"));
			container.addChild(topBorder);
			
			messageArea = new Image(Assets.getTexture("miejsceNaNapis"));
			messageArea.x = 220;
			messageArea.y = 95;
			container.addChild(messageArea);
			
			messageAreaTxtF = new TextField(4 * messageArea.width / 5, 2 * messageArea.height / 3, "Poznaj technologię recyklingu\ni wartosc rynkowa surowca wtórnego.", "KarnivatFont", 50, 0xFFFFFF);
			messageAreaTxtF.autoScale = true;
			messageAreaTxtF.vAlign = VAlign.CENTER;
			messageAreaTxtF.hAlign = HAlign.LEFT;
			messageAreaTxtF.x = messageArea.x + messageArea.height / 5;
			messageAreaTxtF.y = messageArea.y + messageArea.height / 3;
			container.addChild(messageAreaTxtF);
			
			grassSpot = new Image(Assets.getTexture("jasnePoleTrawy"));
			grassSpot.x = 0;
			grassSpot.y = 120;
			container.addChild(grassSpot);
			
			var quad:Quad;
			
			quad = new Quad(300, 400, 0x3e8b21);
			quad.alpha = 0.3;
			quad.x = 40;
			quad.y = 300;
			container.addChild(quad)
			
			quad = new Quad(300, 400, 0x3e8b21);
			quad.alpha = 0.3;
			quad.x = 360;
			quad.y = 300;
			container.addChild(quad)
			
			quad = new Quad(300, 100, 0x3e8b21);
			quad.alpha = 0.3;
			quad.x = 680
			quad.y = 300;
			container.addChild(quad)
			
			cenaTxtF = new TextField(2 * quad.width / 3, 2 * quad.height / 3, "CENA SUROWCÓW WTÓRNYCH", "KarnivatFont", 50, 0xFFFFFF);
			cenaTxtF.color = 0x2e6519;
			cenaTxtF.autoScale = true;
			cenaTxtF.vAlign = VAlign.CENTER;
			cenaTxtF.hAlign = HAlign.CENTER;
			cenaTxtF.x = quad.x + quad.width / 6;
			cenaTxtF.y = quad.y + quad.height / 6;
			container.addChild(cenaTxtF);
			
			quad = new Quad(300, 280, 0x3e8b21);
			quad.alpha = 0.3;
			quad.x = 680
			quad.y = 420;
			container.addChild(quad)
			
			nextArrow = new Image(Assets.getTexture("strzalka3"));
			nextArrow.x = 930;
			nextArrow.y = 710;
			nextArrow.addEventListener(TouchEvent.TOUCH, onNextArrowTouch_handler);
			container.addChild(nextArrow);
			
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
			
			Starling.current.stage.addEventListener(ItemEvent.SELECTED, itemSelected_handler);
			Starling.current.stage.addEventListener(ItemEvent.ALL_ITEMS_PICKED, allItemsPicked_handler);
			Starling.current.stage.addEventListener(GameEvent.RESTART_GAME, restartGame_handler);
		}
		
		private function restartGame_handler(e:GameEvent):void
		{
			allItemsPicked = false;
		}
		
		private function allItemsPicked_handler(e:ItemEvent):void
		{
			allItemsPicked = true;
		}
		
		private function onNextArrowTouch_handler(e:TouchEvent):void
		{
			if (e.getTouch(stage))
			{
				var touch:Touch = e.getTouch(stage)
				if (touch.phase == TouchPhase.BEGAN)
				{
					if (allItemsPicked)
					{
						Starling.current.stage.dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SCREEN, false, 4));
					}
					else
					{
						Starling.current.stage.dispatchEvent(new ScreenEvent(ScreenEvent.HIDE_SCREEN, false, 3));
						Starling.current.stage.dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SCREEN, false, 1));
					}
				}
			}
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
				itemImage.pivotX = itemImage.width / 2;
				itemImage.pivotY = itemImage.height / 2;
				itemImage.x = 125;
				itemImage.y = 200;
				container.addChild(itemImage);
			}
			else
			{
				itemImage.texture = item.itemTexture;
				itemImage.width = itemImage.texture.width;
				itemImage.height = itemImage.texture.height;
			}
			
			if (materialList == null)
			{
				materialList = new MaterialList(item.materialList);
				materialList.x = 680;
				materialList.y = 430;
				container.addChild(materialList);
			}
			else
			{
				materialList.update(item.materialList);
			}
		}
		
	}
}