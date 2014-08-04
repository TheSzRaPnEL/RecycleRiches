package components
{
	import events.ScreenEvent;
	import model.Item;
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
	public class Popup extends Sprite
	{
		private var container:Sprite;
		private var background:Image;
		private var itemImage:Image;
		private var materialList:ArrowList;
		private var cancelBtn:SimpleButton;
		private var sortBtn:SimpleButton;
		private var headline:TextField;
		
		public function Popup()
		{
			container = new Sprite();
			addChild(container);
			
			background = new Image(Assets.getTexture("popup_Info"));
			container.addChild(background);
			
			cancelBtn = new SimpleButton(Assets.getTexture("button_Anuluj"));
			cancelBtn.pivotX = cancelBtn.width / 2;
			cancelBtn.pivotY = cancelBtn.height / 2;
			cancelBtn.x = 120;
			cancelBtn.y = 270;
			cancelBtn.addEventListener(Event.TRIGGERED, onCancelBtn_handler);
			container.addChild(cancelBtn);
			
			sortBtn = new SimpleButton(Assets.getTexture("button_Segreguj"));
			sortBtn.pivotX = sortBtn.width / 2;
			sortBtn.pivotY = sortBtn.height / 2;
			sortBtn.x = 300;
			sortBtn.y = 270;
			sortBtn.addEventListener(Event.TRIGGERED, onSortBtn_handler);
			container.addChild(sortBtn);
			
			headline = new TextField(340, 40, "");
			headline.vAlign = VAlign.CENTER;
			headline.hAlign = HAlign.CENTER;
			headline.autoScale = true;
			headline.x = 35;
			headline.y = 22;
			container.addChild(headline);
			
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
		
		public function setItem(item:Item):void
		{
			if (itemImage == null)
			{
				itemImage = new Image(item.itemTexture);
				itemImage.x = 160;
				itemImage.y = 160;
				container.addChild(itemImage);
				itemImage.pivotX = itemImage.texture.width / 2;
				itemImage.pivotY = itemImage.texture.height / 2;
			}
			else
			{
				itemImage.texture = item.itemTexture;
				itemImage.width = itemImage.texture.width;
				itemImage.height = itemImage.texture.height;
			}
			
			var textList:Vector.<String> = new Vector.<String>;
			for (var i:int = 0; i < item.materialList.length; i++)
			{
				textList.push(item.materialList[i].name);
			}
			
			if (materialList == null)
			{
				materialList = new ArrowList(textList);
				materialList.x = 310;
				materialList.y = 150;
				container.addChild(materialList);
				materialList.pivotX = materialList.width / 2;
				materialList.pivotY = materialList.height / 2;
			}
			else
			{
				materialList.update(textList);
			}
			
			headline.text = item.name;
		}
		
		public function set swapTexture(value:Boolean):void
		{
			background.scaleX = (value ? -1 : 1);
			background.x = (value ? background.width + 50 : 0);
			container.x = (value ? 170 : 0);
		}
	
	}
}