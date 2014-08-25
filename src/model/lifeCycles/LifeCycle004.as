package model.lifeCycles
{
	import model.LifeCycle;
	import services.Assets;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class LifeCycle004 extends LifeCycle
	{
		
		public function LifeCycle004()
		{
			super();
			
			id = 4;
			type = "Recykling\nSkładowanie >>";
			
			addItemImage("przedmiot_Garnek");
			
			overlayGfx = new Image(Assets.getTexture("lifeCycle004"));
			container.addChild(overlayGfx);
		}
		
	}
}