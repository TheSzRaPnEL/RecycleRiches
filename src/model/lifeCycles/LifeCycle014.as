package model.lifeCycles
{
	import model.LifeCycle;
	import services.Assets;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class LifeCycle014 extends LifeCycle
	{
		
		public function LifeCycle014()
		{
			super();
			
			id = 14;
			type = "Recykling";
			
			addItemImage("przedmiot_Puszka");
			
			overlayGfx = new Image(Assets.getTexture("lifeCycle014"));
			container.addChild(overlayGfx);
		}
		
	}
}