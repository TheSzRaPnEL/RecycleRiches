package model.lifeCycles
{
	import model.LifeCycle;
	import services.Assets;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class LifeCycle013 extends LifeCycle
	{
		
		public function LifeCycle013()
		{
			super();
			
			id = 13;
			type = "Składowanie Kompostownia>>";
			
			addItemImage("przedmiot_Patyki");
			
			overlayGfx = new Image(Assets.getTexture("lifeCycle013"));
			container.addChild(overlayGfx);
		}
		
	}
}