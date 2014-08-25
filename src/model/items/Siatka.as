package model.items
{
	import model.Item;
	import model.ItemType;
	import model.materials.Polietylen;
	import services.Assets;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class Siatka extends Item
	{
		
		public function Siatka()
		{
			lifeCycleId = 6;
			
			type = ItemType.ODZYSK_I_RECYKLING;
			
			addMaterial(new Polietylen());
			
			name = "Torba foliowa";
			
			itemTexture = Assets.getTexture("przedmiot_Siatka");
		}
		
	}
}