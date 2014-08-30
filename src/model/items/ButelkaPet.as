package model.items
{
	import model.Item;
	import model.ItemType;
	import model.materials.Pet;
	import model.materials.Polietylen;
	import services.Assets;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class ButelkaPet extends Item
	{
		
		public function ButelkaPet()
		{
			lifeCycleId = 10;
			systemId = 1;
			
			type = ItemType.RECYKLING;
			
			addMaterial(new Pet());
			addMaterial(new Polietylen());
			
			name = "BUTELKA PET";
			
			itemTexture = Assets.getTexture("przedmiot_ButelkaPet");
		}
		
	}
}