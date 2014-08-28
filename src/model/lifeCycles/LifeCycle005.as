package model.lifeCycles
{
	import model.LifeCycle;
	import services.Assets;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class LifeCycle005 extends LifeCycle
	{
		
		public function LifeCycle005()
		{
			super();
			
			id = 5;
			type = "Recykling";
			
			addItemImage("przedmiot_Rower");
			
			overlayGfx = new Image(Assets.getTexture("lifeCycle005"));
			container.addChild(overlayGfx);
		}
		
	}
}