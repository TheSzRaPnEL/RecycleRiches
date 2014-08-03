package components 
{
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
		
		public function RobotArm() 
		{
			forearm = new Image(Assets.getTexture("robotArm_part1"));
			forearm.pivotX = 13;
			forearm.pivotY = 28;
			addChild(forearm);
			
			arm = new Image(Assets.getTexture("robotArm_part2"));
			arm.pivotX = 13;
			arm.pivotY = 28;
			addChild(arm);
			
			fingerTop = new Image(Assets.getTexture("robotArm_part3a"));
			fingerTop.pivotX = 13;
			fingerTop.pivotY = 28;
			addChild(fingerTop);
			
			fingerBot = new Image(Assets.getTexture("robotArm_part3b"));
			fingerBot.pivotX = 13;
			fingerBot.pivotY = 28;
			addChild(fingerBot);
		}
		
	}
}