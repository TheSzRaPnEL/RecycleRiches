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
			systemId = 6;
			
			type = ItemType.RECYKLING;
			
			addMaterial(new Makulatura());
			
			name = "GAZETA";
			
			itemTexture = Assets.getTexture("przedmiot_Gazeta");
		}
		
	}
}