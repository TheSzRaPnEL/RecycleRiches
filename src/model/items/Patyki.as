package model.items
{
	import model.Item;
	import model.ItemType;
	import model.materials.KompostOgrodniczy;
	import services.Assets;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class Patyki extends Item
	{
		
		public function Patyki()
		{
			lifeCycleId = 13;
			systemId = 11;
			
			type = ItemType.ODZYSK;
			
			addMaterial(new KompostOgrodniczy());
			
			name = "Gałęzie";
			
			itemTexture = Assets.getTexture("przedmiot_Patyki");
		}
		
	}
}