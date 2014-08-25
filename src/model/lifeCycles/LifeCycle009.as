package model.lifeCycles
{
	import model.LifeCycle;
	import services.Assets;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class LifeCycle009 extends LifeCycle
	{
		
		public function LifeCycle009()
		{
			super();
			
			id = 9;
			type = "Recykling\nSkładowanie >>";
			
			addItemImage("przedmiot_Jarzeniowka");
			
			overlayGfx = new Image(Assets.getTexture("lifeCycle009"));
			container.addChild(overlayGfx);
		}
		
	}
}