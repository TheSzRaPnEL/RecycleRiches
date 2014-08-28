package model.lifeCycles
{
	import model.LifeCycle;
	import services.Assets;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class LifeCycle012 extends LifeCycle
	{
		
		public function LifeCycle012()
		{
			super();
			
			id = 12;
			type = "Recykling";
			
			addItemImage("przedmiot_Jogurt");
			
			overlayGfx = new Image(Assets.getTexture("lifeCycle012"));
			container.addChild(overlayGfx);
		}
		
	}
}