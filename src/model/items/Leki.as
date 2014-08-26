package model.items
{
	import model.Item;
	import model.ItemType;
	import services.Assets;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class Leki extends Item
	{
		
		public function Leki()
		{
			lifeCycleId = 20;
			
			type = ItemType.ODZYSK;
			
			name = "Zużyte lekarstwa";
			
			itemTexture = Assets.getTexture("przedmiot_Leki");
		}
	
	}
}