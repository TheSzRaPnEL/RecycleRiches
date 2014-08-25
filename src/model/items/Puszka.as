package model.items
{
	import model.Item;
	import model.ItemType;
	import model.materials.Aluminium;
	import services.Assets;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class Puszka extends Item
	{
		
		public function Puszka()
		{
			lifeCycleId = 14;
			
			type = ItemType.RECYKLING;
			
			addMaterial(new Aluminium());
			
			name = "Puszka aluminiowa";
			
			itemTexture = Assets.getTexture("przedmiot_Puszka");
		}
		
	}
}