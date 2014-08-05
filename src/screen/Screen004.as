package screen
{
	import components.ItemImage;
	import components.Map;
	import components.MapPopup;
	import components.MaterialList;
	import components.TextFieldList;
	import events.ItemEvent;
	import events.MapPointEvent;
	import events.MaterialEvent;
	import model.Item;
	import model.MapPoint;
	import model.maps.MazowszeMap;
	import model.Material;
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
		private var mapPopup:MapPopup;
		private var itemImage:ItemImage;
		private var textFieldList:TextFieldList;
		private var materialList:MaterialList;
		private var materialLifeCycle:Image;
		;
		
		public function Screen004()
		{
			container = new Sprite();
			addChild(container);
			
			background = new Image(Assets.getTexture("screen005"));
			container.addChild(background);
			
			Starling.current.stage.addEventListener(ItemEvent.SELECTED, itemSelected_handler);
			Starling.current.stage.addEventListener(MaterialEvent.SELECTED, materialSelected_handler);
			Starling.current.stage.addEventListener(MapPointEvent.MOUSE_OVER, mouseOverMapPoint_handler);
			Starling.current.stage.addEventListener(MapPointEvent.MOUSE_OUT, mouseOutMapPoint_handler);
		}
		
		private function mouseOutMapPoint_handler(e:MapPointEvent):void
		{
			if (mapPopup != null)
				mapPopup.visible = false;
		}
		
		private function mouseOverMapPoint_handler(e:MapPointEvent):void
		{
			if (mapPopup == null)
			{
				mapPopup = new MapPopup();
				mapPopup.touchable = false;
				container.addChild(mapPopup);
			}
			
			mapPopup.x = map.x + MapPoint(e.data).position.x;
			mapPopup.y = map.y + MapPoint(e.data).position.y;
			mapPopup.text = MapPoint(e.data).info;
			mapPopup.visible = true;
		}
		
		private function materialSelected_handler(e:MaterialEvent):void
		{
			updateMaterialLifeCycle(Material(e.data));
			updateMaterialInfo(Material(e.data));
			updateMaterialMap(Material(e.data));
		}
		
		private function updateMaterialMap(material:Material):void
		{
			if (map == null)
			{
				map = new MazowszeMap();
				map.x = 477;
				map.y = 388;
				container.addChild(map);
			}
			
			map.hideMapPoints();
			for (var i:int = 0; i < material.mapPointIdList.length; i++)
			{
				map.showMapPoint(material.mapPointIdList[i]);
			}
		}
		
		private function updateMaterialLifeCycle(material:Material):void
		{
			if (materialLifeCycle == null)
			{
				materialLifeCycle = new Image(Assets.getTexture("lifeCycle" + material.lifeCycleId));
				materialLifeCycle.pivotX = materialLifeCycle.width / 2;
				materialLifeCycle.pivotY = materialLifeCycle.height / 2;
				materialLifeCycle.x = 335;
				materialLifeCycle.y = 540;
				container.addChild(materialLifeCycle);
			}
			else
			{
				materialLifeCycle.texture = Assets.getTexture("lifeCycle" + material.lifeCycleId);
				materialLifeCycle.width = materialLifeCycle.texture.width;
				materialLifeCycle.height = materialLifeCycle.texture.height;
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
				materialList.x = 10;
				materialList.y = 350;
				container.addChild(materialList);
			}
			else
			{
				materialList.update(item.materialList);
			}
		}
		
		public function updateMaterialInfo(material:Material):void
		{
			if (textFieldList == null)
			{
				textFieldList = new TextFieldList(material.infoList);
				textFieldList.pivotX = itemImage.width / 2;
				textFieldList.x = 770;
				textFieldList.y = 385;
				container.addChild(textFieldList);
			}
			else
			{
				textFieldList.update(material.infoList);
			}
		}
	
	}

}