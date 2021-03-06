package model.items
{
	import model.Item;
	import model.ItemType;
	import model.materials.TluczkaSzklana;
	import services.Assets;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class Butelka extends Item
	{
		
		public function Butelka()
		{
			lifeCycleId = 3;
			systemId = 4;
			
			type = ItemType.RECYKLING;
			
			addMaterial(new TluczkaSzklana());
			
			name = "BUTELKA SZKLANA";
			
			itemTexture = Assets.getTexture("przedmiot_Butelka");
		}
		
	}
}