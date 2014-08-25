package model.lifeCycles
{
	import model.LifeCycle;
	import services.Assets;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class LifeCycle003 extends LifeCycle
	{
		
		public function LifeCycle003()
		{
			super();
			
			id = 3;
			type = "Recykling\nSkładowanie >>";
			
			addItemImage("przedmiot_Butelka");
			
			overlayGfx = new Image(Assets.getTexture("lifeCycle003"));
			container.addChild(overlayGfx);
		}
		
	}
}