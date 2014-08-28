package model.lifeCycles
{
	import model.LifeCycle;
	import services.Assets;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class LifeCycle020 extends LifeCycle
	{
		
		public function LifeCycle020()
		{
			super();
			
			id = 20;
			type = "Odzysk\nSkładowanie >>";
			
			addItemImage("przedmiot_Leki");
			
			overlayGfx = new Image(Assets.getTexture("lifeCycle020"));
			container.addChild(overlayGfx);
		}
		
	}
}