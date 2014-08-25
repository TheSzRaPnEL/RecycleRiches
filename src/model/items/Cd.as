package model.items
{
	import model.Item;
	import model.ItemType;
	import model.materials.Poliweglan;
	import services.Assets;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class Cd extends Item
	{
		
		public function Cd()
		{
			lifeCycleId = 11;
			
			type = ItemType.ODZYSK_I_RECYKLING;
			
			addMaterial(new Poliweglan());
			
			name = "PŁYTA CD";
			
			itemTexture = Assets.getTexture("przedmiot_Cd");
		}
		
	}
}