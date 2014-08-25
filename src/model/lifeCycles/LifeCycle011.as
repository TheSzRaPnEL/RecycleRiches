package model.lifeCycles
{
	import model.LifeCycle;
	import services.Assets;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class LifeCycle011 extends LifeCycle
	{
		
		public function LifeCycle011()
		{
			super();
			
			id = 11;
			type = "Recykling\nSkładowanie >>";
			
			addItemImage("przedmiot_Cd");
			
			overlayGfx = new Image(Assets.getTexture("lifeCycle011"));
			container.addChild(overlayGfx);
		}
		
	}
}