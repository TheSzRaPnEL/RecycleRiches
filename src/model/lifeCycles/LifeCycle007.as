package model.lifeCycles
{
	import model.LifeCycle;
	import services.Assets;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class LifeCycle007 extends LifeCycle
	{
		
		public function LifeCycle007()
		{
			super();
			
			id = 7;
			type = "Recykling\nSkładowanie >>";
			
			addItemImage("przedmiot_Spryskiwacz");
			
			overlayGfx = new Image(Assets.getTexture("lifeCycle007"));
			container.addChild(overlayGfx);
		}
		
	}
}