package model.lifeCycles
{
	import model.LifeCycle;
	import services.Assets;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class LifeCycle006 extends LifeCycle
	{
		
		public function LifeCycle006()
		{
			super();
			
			id = 6;
			type = "Recykling\nSkładowanie >>";
			
			addItemImage("przedmiot_Siatka");
			
			overlayGfx = new Image(Assets.getTexture("lifeCycle006"));
			container.addChild(overlayGfx);
		}
		
	}
}