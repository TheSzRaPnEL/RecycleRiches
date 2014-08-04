package screen 
{
	import components.ItemImage;
	import components.Map;
	import events.ItemEvent;
	import model.Item;
	import model.maps.MazowszeMap;
	import services.Assets;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class Screen004 extends Sprite
	{
		private var container:Sprite;
		private var background:Image;
		private var map:Map;
		private var itemImage:ItemImage;
		
		public function Screen004() 
		{
			container = new Sprite();
			addChild(container);
			
			background = new Image(Assets.getTexture("screen005"));
			container.addChild(background);
			
			map = new MazowszeMap();
			container.addChild(map);
			
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
				itemImage.pivotX = itemImage.width / 2;
				itemImage.pivotY = itemImage.height / 2;
			}
		}
		
	}

}