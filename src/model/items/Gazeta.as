package model.items
{
	import model.Item;
	import model.ItemType;
	import model.materials.Makulatura;
	import services.Assets;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class Gazeta extends Item
	{
		
		public function Gazeta()
		{
			lifeCycleId = 2;
			
			type = ItemType.ODZYSK_I_RECYKLING;
			
			addMaterial(new Makulatura());
			
			name = "GAZETA";
			
			itemTexture = Assets.getTexture("przedmiot_Gazeta");
		}
		
	}
}