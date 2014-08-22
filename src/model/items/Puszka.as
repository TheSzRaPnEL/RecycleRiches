package model.items 
{
	import model.Item;
	import model.ItemType;
	import model.materials.Metal;
	import services.Assets;
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class Puszka extends Item
	{
		
		public function Puszka() 
		{
			type = ItemType.ODZYSK_I_RECYKLING;
			
			addMaterial(new Metal());
			addMaterial(new Metal());
			
			name = "PUSZKA";
			
			itemTexture = Assets.getTexture("przedmiot_Puszka");
		}
		
	}
}