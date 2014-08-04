package components 
{
	import flash.geom.Point;
	import services.Assets;
	import starling.display.Image;
	import starling.display.Sprite;
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class RobotArm extends Sprite
	{
		private var forearm:Image;
		private var arm:Image;
		private var fingerTop:Image;
		private var fingerBot:Image;
		private var _handlingPoint:Point;
		
		public function RobotArm() 
		{
			fingerTop = new Image(Assets.getTexture("robotArm_part3a"));
			fingerTop.pivotX = 13;
			fingerTop.pivotY = 28;
			fingerTop.x = 270;
			fingerTop.y = 490;
			addChild(fingerTop);
			
			fingerBot = new Image(Assets.getTexture("robotArm_part3b"));
			fingerBot.pivotX = 13;
			fingerBot.pivotY = 28;
			fingerBot.x = 335;
			fingerBot.y = 485;
			addChild(fingerBot);
			
			arm = new Image(Assets.getTexture("robotArm_part2"));
			arm.pivotX = 13;
			arm.pivotY = 28;
			arm.x = 265;
			arm.y = 330;
			addChild(arm);
			
			forearm = new Image(Assets.getTexture("robotArm_part1"));
			forearm.pivotX = 13;
			forearm.pivotY = 28;
			forearm.x = 0;
			forearm.y = 150;
			addChild(forearm);
			
			_handlingPoint = new Point();
			handlingPoint.x = 300;
			handlingPoint.y = 490;
		}
		
		public function get handlingPoint():Point 
		{
			return _handlingPoint;
		}
		
		public function set handlingPoint(value:Point):void 
		{
			_handlingPoint = value;
		}
		
	}
}