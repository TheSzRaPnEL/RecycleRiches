package model.items
{
	import model.Item;
	import model.ItemType;
	import model.materials.Stal;
	import model.materials.Zelazo;
	import services.Assets;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class Garnek extends Item
	{
		
		public function Garnek()
		{
			lifeCycleId = 4;
			systemId = 5;
			
			type = ItemType.RECYKLING;
			
			addMaterial(new Zelazo());
			addMaterial(new Stal());
			
			name = "GARNEK STALOWY";
			
			itemTexture = Assets.getTexture("przedmiot_Garnek");
		}
		
	}
}