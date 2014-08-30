package model.lifeCycles
{
	import model.LifeCycle;
	import services.Assets;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class LifeCycle021 extends LifeCycle
	{
		
		public function LifeCycle021()
		{
			super();
			
			id = 21;
			type = "Odzysk\nSkładowanie3 >>";
			
			addItemImage("przedmiot_Mis");
			addItemImage("przedmiot_Opona");
			addItemImage("przedmiot_Krzeslo");
			
			overlayGfx = new Image(Assets.getTexture("lifeCycle017"));
			container.addChild(overlayGfx);
		}
		
	}
}