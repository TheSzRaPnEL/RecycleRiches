package screen 
{
	import components.Map;
	import model.maps.MazowszeMap;
	import services.Assets;
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
		
		public function Screen004() 
		{
			container = new Sprite();
			addChild(container);
			
			background = new Image(Assets.getTexture("screen005"));
			container.addChild(background);
			
			map = new MazowszeMap();
			container.addChild(map);
		}
		
	}

}