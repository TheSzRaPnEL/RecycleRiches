package screen 
{
	import services.Assets;
	import starling.display.Image;
	import starling.display.Sprite;
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class Screen001 extends Sprite
	{
		public function Screen001() 
		{
			addChild(new Image(Assets.getTexture("screen001")));
			addChild(new Image(Assets.getTexture("button_Start")));
		}
		
	}
}