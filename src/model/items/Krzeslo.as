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
			
			type = ItemType.SKLADOWISKO;
			
			name = "Drewno impregnowane i meble";
			
			itemTexture = Assets.getTexture("przedmiot_Krzeslo");
		}
		
	}
}