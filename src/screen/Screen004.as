package screen
{
	import components.ItemImage;
	import components.LifeCyclePopup;
	import components.MaterialList;
	import components.RecycleSystemPopup;
	import components.ReuseCycleBtn;
	import components.ReuseSystemBtn;
	import components.TextFieldList;
	import events.GameEvent;
	import events.ItemEvent;
	import events.MaterialEvent;
	import events.ScreenEvent;
	import events.SoundEvent;
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
		private var reuseCycleBtn:ReuseCycleBtn;
		private var reuseSystemBtn:ReuseSystemBtn;
		private var blackOverlay:Quad;
		private var lifeCyclePopup:LifeCyclePopup;
		private var recycleSystemPopup:RecycleSystemPopup;
		private var botBorder:Image;
		
		public function Screen004()
		{
			allItemsPicked = false;
			
			container = new Sprite();
			addChild(container);
			
			background = new Image(Assets.getTexture("screenCorkBackground"));
			container.addChild(background);
			
			topBorder = new Image(Assets.getTexture("screenTopWhite"));
			container.addChild(topBorder);
			
			botBorder = new Image(Assets.getTexture("screenBotWhite"));
			botBorder.y = 768 - botBorder.height;
			container.addChild(botBorder);
			
			messageArea = new Image(Assets.getTexture("miejsceNaNapis"));
			messageArea.x = 220;
			messageArea.y = 95;
			container.addChild(messageArea);
			
			messageAreaTxtF = new TextField(4 * messageArea.width / 5, 2 * messageArea.height / 3, "Poznaj technologię recyklingu\ni wartość rynkową surowca wtórnego.", "GillSansMTFont", 50, 0xFFFFFF);
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
			container.addChild(quad);
			
			reuseCycleBtn = new ReuseCycleBtn();
			reuseCycleBtn.x = 40;
			reuseCycleBtn.y = 360;
			container.addChild(reuseCycleBtn);
			reuseCycleBtn.addEventListener(TouchEvent.TOUCH, onReuseCycleBtnTouch_handler);
			
			quad = new Quad(300, 400, 0x3e8b21);
			quad.alpha = 0.3;
			quad.x = 360;
			quad.y = 300;
			container.addChild(quad);
			
			reuseSystemBtn = new ReuseSystemBtn();
			reuseSystemBtn.scaleX = 1;
			reuseSystemBtn.scaleY = reuseSystemBtn.scaleX;
			reuseSystemBtn.x = 375;
			reuseSystemBtn.y = 370;
			container.addChild(reuseSystemBtn);
			reuseSystemBtn.addEventListener(TouchEvent.TOUCH, onReuseSystemBtnTouch_handler);
			
			quad = new Quad(300, 100, 0x3e8b21);
			quad.alpha = 0.3;
			quad.x = 680
			quad.y = 300;
			container.addChild(quad);
			
			cenaTxtF = new TextField(2 * quad.width / 3, 2 * quad.height / 3, "CENA SUROWCÓW WTÓRNYCH", "GillSansMTFont", 50, 0xFFFFFF);
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
			container.addChild(quad);
			
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
			
			logo1TxtF = new TextField(logo1.width, 20, "Instytucja finansujaca:", "GillSansMTFont", 50, 0xa0522d);
			logo1TxtF.autoScale = true;
			logo1TxtF.vAlign = VAlign.CENTER;
			logo1TxtF.hAlign = HAlign.LEFT;
			logo1TxtF.x = logo1.x;
			logo1TxtF.y = logo1.y - logo1TxtF.height;
			container.addChild(logo1TxtF);
			
			logo2 = new Image(Assets.getTexture("logoAmest"));
			logo2.scaleX = 0.7;
			logo2.scaleY = logo2.scaleX;
			logo2.x = 740;
			logo2.y = 35;
			container.addChild(logo2);
			
			logo2TxtF = new TextField(logo1.width, 20, "Partner merytoryczny:", "GillSansMTFont", 50, 0xa0522d);
			logo2TxtF.autoScale = true;
			logo2TxtF.vAlign = VAlign.CENTER;
			logo2TxtF.hAlign = HAlign.LEFT;
			logo2TxtF.x = logo2.x - (logo2TxtF.textBounds.width - logo2.width) / 2;
			logo2TxtF.y = logo2.y - logo2TxtF.height;
			container.addChild(logo2TxtF);
			
			blackOverlay = new Quad(1024, 768, 0);
			blackOverlay.alpha = 0.8;
			blackOverlay.visible = false;
			container.addChild(blackOverlay);
			
			Starling.current.stage.addEventListener(ItemEvent.SELECTED, itemSelected_handler);
			Starling.current.stage.addEventListener(ItemEvent.ALL_ITEMS_PICKED, allItemsPicked_handler);
			Starling.current.stage.addEventListener(GameEvent.RESTART_GAME, restartGame_handler);
			Starling.current.stage.addEventListener(ScreenEvent.SHOW_LIFECYCLE_POPUP, showLifeCycle_handler);
			Starling.current.stage.addEventListener(ScreenEvent.HIDE_LIFECYCLE_POPUP, hideLifeCycle_handler);
			Starling.current.stage.addEventListener(ScreenEvent.SHOW_RECYCLESYSTEM_POPUP, showRecycleSystem_handler);
			Starling.current.stage.addEventListener(ScreenEvent.HIDE_RECYCLESYSTEM_POPUP, hideRecycleSystem_handler);
		}
		
		private function showLifeCycle_handler(e:ScreenEvent):void 
		{
			blackOverlay.visible = true;
			
			if (lifeCyclePopup == null)
			{
				lifeCyclePopup = new LifeCyclePopup();
				lifeCyclePopup.x = 35;
				lifeCyclePopup.y = 100;
				addChild(lifeCyclePopup);
			}
			else
			{
				lifeCyclePopup.visible = true;
			}
			
			lifeCyclePopup.lifeCycle = itemImage.itemRef.lifeCycleId;
		}
		
		private function hideLifeCycle_handler(e:ScreenEvent):void 
		{
			blackOverlay.visible = false;
			
			if (lifeCyclePopup)
				lifeCyclePopup.visible = false;
		}
		
		private function showRecycleSystem_handler(e:ScreenEvent):void 
		{
			blackOverlay.visible = true;
			
			if (recycleSystemPopup == null)
			{
				recycleSystemPopup = new RecycleSystemPopup();
				recycleSystemPopup.x = 35;
				recycleSystemPopup.y = 100;
				addChild(recycleSystemPopup);
			}
			else
			{
				recycleSystemPopup.visible = true;
			}
		}
		
		private function hideRecycleSystem_handler(e:ScreenEvent):void 
		{
			blackOverlay.visible = false;
			
			if (recycleSystemPopup)
				recycleSystemPopup.visible = false;
		}
		
		private function onReuseCycleBtnTouch_handler(e:TouchEvent):void 
		{
			if (e.getTouch(stage))
			{
				var touch:Touch = e.getTouch(stage)
				if (touch.phase == TouchPhase.BEGAN)
				{
					Starling.current.stage.dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_LIFECYCLE_POPUP));
					Starling.current.stage.dispatchEvent(new SoundEvent(SoundEvent.PLAY_SOUND, false, "NormalClick"));
				}
			}
		}
		
		private function onReuseSystemBtnTouch_handler(e:TouchEvent):void 
		{
			if (e.getTouch(stage))
			{
				var touch:Touch = e.getTouch(stage)
				if (touch.phase == TouchPhase.BEGAN)
				{
					Starling.current.stage.dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_RECYCLESYSTEM_POPUP));
					Starling.current.stage.dispatchEvent(new SoundEvent(SoundEvent.PLAY_SOUND, false, "NormalClick"));
				}
			}
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
					Starling.current.stage.dispatchEvent(new SoundEvent(SoundEvent.PLAY_SOUND, false, "NormalClick"));
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
				itemImage.itemRef = item;
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