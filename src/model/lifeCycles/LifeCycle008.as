package model.lifeCycles
{
	import model.LifeCycle;
	import services.Assets;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class LifeCycle008 extends LifeCycle
	{
		
		public function LifeCycle008()
		{
			super();
			
			id = 8;
			type = "Recykling\nSkładowanie >>";
			
			addItemImage("przedmiot_Akumulator");
			
			overlayGfx = new Image(Assets.getTexture("lifeCycle008"));
			container.addChild(overlayGfx);
		}
		
	}
}