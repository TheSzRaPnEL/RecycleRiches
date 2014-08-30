package model.lifeCycles
{
	import model.LifeCycle;
	import services.Assets;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class LifeCycle022 extends LifeCycle
	{
		
		public function LifeCycle022()
		{
			super();
			
			id = 22;
			type = "Odzysk\nSkładowanie3 >>";
			
			addItemImage("przedmiot_Mis");
			addItemImage("przedmiot_Opona");
			addItemImage("przedmiot_Krzeslo");
			
			overlayGfx = new Image(Assets.getTexture("lifeCycle017"));
			container.addChild(overlayGfx);
		}
		
	}
}