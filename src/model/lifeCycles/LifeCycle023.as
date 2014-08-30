package model.lifeCycles
{
	import model.LifeCycle;
	import services.Assets;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class LifeCycle023 extends LifeCycle
	{
		
		public function LifeCycle023()
		{
			super();
			
			id = 23;
			type = "Odzysk\nSkładowanie3 >>";
			
			addItemImage("przedmiot_Mis");
			addItemImage("przedmiot_Opona");
			addItemImage("przedmiot_Krzeslo");
			
			overlayGfx = new Image(Assets.getTexture("lifeCycle019"));
			container.addChild(overlayGfx);
		}
		
	}
}