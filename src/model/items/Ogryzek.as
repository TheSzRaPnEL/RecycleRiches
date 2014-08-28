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
	public class Ogryzek extends Item
	{
		
		public function Ogryzek()
		{
			lifeCycleId = 15;
			systemId = 11;
			
			type = ItemType.ODZYSK;
			
			addMaterial(new KompostOgrodniczy());
			
			name = "OGRYZEK";
			
			itemTexture = Assets.getTexture("przedmiot_Ogryzek");
		}
	
	}
}