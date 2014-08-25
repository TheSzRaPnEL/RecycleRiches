package model.lifeCycles
{
	import model.LifeCycle;
	import services.Assets;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class LifeCycle019 extends LifeCycle
	{
		
		public function LifeCycle019()
		{
			super();
			
			id = 19;
			type = "Recykling\nSkładowanie >>";
			
			addItemImage("przedmiot_Mis");
			
			overlayGfx = new Image(Assets.getTexture("lifeCycle019"));
			container.addChild(overlayGfx);
		}
		
	}
}