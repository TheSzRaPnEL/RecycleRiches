package components 
{
	import services.Assets;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class GrassItemOverlay extends Sprite
	{
		private var container:Sprite;
		private var grass:Image;
		private var item:Image;
		
		public function GrassItemOverlay() 
		{
			container = new Sprite();
			addChild(container);
			
			grass = new Image(Assets.getTexture("jasnePoleTrawy"));
			grass.x = -20;
			container.addChild(grass);
			
			item = new Image(Assets.getTexture("przedmiot_Karton"));
			item.pivotX = item.width / 2;
			item.pivotY = item.height / 2;
			item.x = grass.width / 2 ;
			item.y = grass.height / 2;
			container.addChild(item);
			
			container.x = -grass.width / 2;
			container.y = -grass.height / 2;
		}
		
		public function setItem(itemTexture:Texture):void
		{
			item.texture = itemTexture;
			item.width = itemTexture.width;
			item.height = itemTexture.height;
		}
		
	}

}