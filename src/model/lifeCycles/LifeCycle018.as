package model.lifeCycles
{
	import model.LifeCycle;
	import services.Assets;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class LifeCycle018 extends LifeCycle
	{
		
		public function LifeCycle018()
		{
			super();
			
			id = 18;
			type = "Recykling\nSkładowanie >>";
			
			addItemImage("przedmiot_Opona");
			
			overlayGfx = new Image(Assets.getTexture("lifeCycle018"));
			container.addChild(overlayGfx);
		}
		
	}
}