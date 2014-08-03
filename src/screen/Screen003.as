package screen 
{
	import components.RobotArm;
	import events.ScreenEvent;
	import services.Assets;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
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
			container.addChild(robotArm);
			
			var basket:Image = new Image(Assets.getTexture("kosz_Odzysk"));
			basket.pivotX = basket.width / 2;
			basket.pivotY = basket.height;
			basket.x = 1 * 1024 / 8;
			basket.y = 768;
			container.addChild(basket);
			
			basket = new Image(Assets.getTexture("kosz_Recykling"));
			basket.pivotX = basket.width / 2;
			basket.pivotY = basket.height;
			basket.x = 3 * 1024 / 8;
			basket.y = 768;
			container.addChild(basket);
			
			basket = new Image(Assets.getTexture("kosz_Skladowisko"));
			basket.pivotX = basket.width / 2;
			basket.pivotY = basket.height;
			basket.x = 5 * 1024 / 8;
			basket.y = 768;
			container.addChild(basket);
			
			basket = new Image(Assets.getTexture("kosz_Unieszkodliwienie"));
			basket.pivotX = basket.width / 2;
			basket.pivotY = basket.height;
			basket.x = 7 * 1024 / 8;
			basket.y = 768;
			basket.addEventListener(TouchEvent.TOUCH, onBasket4Touch_handler);
			container.addChild(basket);
		}
		
		private function onBasket4Touch_handler(e:TouchEvent):void 
		{
			var touch:Touch = e.getTouch(stage);
			if (touch.phase == TouchPhase.BEGAN)
			{
				onBasket4Selected_handler();
			}
		}
		
		private function onBasket4Selected_handler():void
		{
			Starling.current.stage.dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SCREEN, false, 3));
		}
		
	}
}