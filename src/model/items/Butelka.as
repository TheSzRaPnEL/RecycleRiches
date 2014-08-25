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
			
			type = ItemType.ODZYSK_I_RECYKLING;
			
			addMaterial(new TluczkaSzklana());
			
			name = "BUTELKA SZKLANA";
			
			itemTexture = Assets.getTexture("przedmiot_Butelka");
		}
		
	}
}