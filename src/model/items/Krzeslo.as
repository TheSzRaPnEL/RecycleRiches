package model.items
{
	import model.Item;
	import model.ItemType;
	import services.Assets;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class Krzeslo extends Item
	{
		
		public function Krzeslo()
		{
			lifeCycleId = 17;
			systemId = 10;
			
			type = ItemType.ODZYSK;
			
			name = "Drewno impregnowane i meble";
			
			itemTexture = Assets.getTexture("przedmiot_Krzeslo");
		}
		
	}
}