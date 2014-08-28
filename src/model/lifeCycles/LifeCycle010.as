package model.lifeCycles
{
	import model.LifeCycle;
	import services.Assets;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class LifeCycle010 extends LifeCycle
	{
		
		public function LifeCycle010()
		{
			super();
			
			id = 10;
			type = "Recykling";
			
			addItemImage("przedmiot_ButelkaPet");
			
			overlayGfx = new Image(Assets.getTexture("lifeCycle010"));
			container.addChild(overlayGfx);
		}
		
	}
}