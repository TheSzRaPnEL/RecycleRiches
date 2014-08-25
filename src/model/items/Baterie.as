package model.items
{
	import model.Item;
	import model.ItemType;
	import model.materials.Cynk;
	import model.materials.Kadm;
	import model.materials.TlenekManganu;
	import services.Assets;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class Baterie extends Item
	{
		
		public function Baterie()
		{
			lifeCycleId = 1;
			
			type = ItemType.ODZYSK_I_RECYKLING;
			
			addMaterial(new Kadm());
			addMaterial(new Cynk());
			addMaterial(new TlenekManganu());
			
			name = "BATERIE";
			
			itemTexture = Assets.getTexture("przedmiot_Baterie");
		}
		
	}
}