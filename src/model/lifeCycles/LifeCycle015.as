package model.lifeCycles
{
	import model.LifeCycle;
	import services.Assets;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class LifeCycle015 extends LifeCycle
	{
		
		public function LifeCycle015()
		{
			super();
			
			id = 15;
			type = "Recykling\nSkładowanie >>";
			
			addItemImage("przedmiot_Ogryzek");
			
			overlayGfx = new Image(Assets.getTexture("lifeCycle015"));
			container.addChild(overlayGfx);
		}
		
	}
}