package model.lifeCycles
{
	import model.LifeCycle;
	import services.Assets;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class LifeCycle016 extends LifeCycle
	{
		
		public function LifeCycle016()
		{
			super();
			
			id = 16;
			type = "Recykling\nSkładowanie >>";
			
			addItemImage("przedmiot_Komorka");
			
			overlayGfx = new Image(Assets.getTexture("lifeCycle016"));
			container.addChild(overlayGfx);
		}
		
	}
}