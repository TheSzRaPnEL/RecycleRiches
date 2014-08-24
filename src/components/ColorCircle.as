package components
{
	import services.Assets;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.utils.Color;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class ColorCircle extends Sprite
	{
		private var container:Sprite;
		private var circle:Sprite;
		private var colorCircle:Image;
		private var whiteCircle:Image;
		
		public function ColorCircle()
		{
			container = new Sprite();
			addChild(container);
			
			circle = new Sprite();
			container.addChild(circle);
			
			colorCircle = new Image(Assets.getTexture("bialeKolo"));
			colorCircle.color = Color.WHITE;
			circle.addChild(colorCircle);
			
			whiteCircle = new Image(Assets.getTexture("bialeKolo"));
			whiteCircle.x = whiteCircle.width / 20;
			whiteCircle.y = whiteCircle.height / 20;
			whiteCircle.scaleX = 0.9;
			whiteCircle.scaleY = whiteCircle.scaleX;
			circle.addChild(whiteCircle);
		}
		
		public function set color(value:uint):void
		{
			colorCircle.color = value;
		}
		
	}
}