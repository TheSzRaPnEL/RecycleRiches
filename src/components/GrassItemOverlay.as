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
			container.addChild(grass);
			
			item = new Image(Assets.getTexture("przedmiot_Butelka"));
			item.pivotX = item.width / 2;
			item.pivotY = item.height / 2;
			item.x = 133;
			item.y = 81;
			container.addChild(item);
		}
		
		public function setItem(itemTexture:Texture):void
		{
			item.texture = itemTexture;
			item.width = itemTexture.width;
			item.height = itemTexture.height;
		}
		
	}

}