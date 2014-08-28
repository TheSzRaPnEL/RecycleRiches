package model.lifeCycles
{
	import model.LifeCycle;
	import services.Assets;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class LifeCycle017 extends LifeCycle
	{
		
		public function LifeCycle017()
		{
			super();
			
			id = 17;
			type = "Odzysk\nSkładowanie >>";
			
			addItemImage("przedmiot_Krzeslo");
			
			overlayGfx = new Image(Assets.getTexture("lifeCycle017"));
			container.addChild(overlayGfx);
		}
		
	}
}