package screen 
{
	import components.RobotArm;
	import services.Assets;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class Screen003 extends Sprite
	{
		private var container:Sprite;
		private var robotArm:RobotArm;
		private var basket:Image;
		
		public function Screen003()
		{
			container = new Sprite();
			addChild(container);
			
			var robotArm:Sprite = new RobotArm;
			addChild(robotArm);
			
			var basket:Image = new Image(Assets.getTexture("kosz_Odzysk"));
			addChild(basket);
			
			basket = new Image(Assets.getTexture("kosz_Recykling"));
			addChild(basket);
			
			basket = new Image(Assets.getTexture("kosz_Skladowisko"));
			addChild(basket);
			
			basket = new Image(Assets.getTexture("kosz_Unieszkodliwienie"));
			addChild(basket);
		}
		
	}
}